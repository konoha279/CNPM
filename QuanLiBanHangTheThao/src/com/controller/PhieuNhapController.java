package com.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.Account;
import com.entity.CTHangHoa;
import com.entity.CTPhieuNhap;
import com.entity.Product;
import com.entity.Receipt;
import com.entity.Size;
import com.entity.Staff;


@Transactional
@Controller
@RequestMapping("/admin/nhap/")
public class PhieuNhapController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	
	
	@ModelAttribute("dsSanPham")
	public List<Product> getSanPham()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}

	@ModelAttribute("dsNhanVien")
	public List<Staff> getLoai() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Staff";
		Query query = session.createQuery(hql);
		List<Staff> list = query.list();
		return list;
	}
	
	@ModelAttribute("ctPhieuNhaps")
	public List<CTPhieuNhap>  listCtPN(HttpSession httpSession)
	{
		List<CTPhieuNhap> ctPhieuNhaps = (List<CTPhieuNhap>) httpSession.getAttribute("ctPhieuNhaps");
		if (ctPhieuNhaps == null)
			ctPhieuNhaps = new ArrayList<CTPhieuNhap>();
		httpSession.setAttribute("ctPhieuNhaps", ctPhieuNhaps);
		return ctPhieuNhaps;
	}
	
	@ModelAttribute("dsSize")
	public List<Size> getSizes() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Size";
		Query query = session.createQuery(hql);
		List<Size> list = query.list();
		return list;
	}
	
	@ModelAttribute("dsPhieuNhap")
	public List<Receipt> receipts()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Receipt";
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
		return list;
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		return "admin/nhap/index";
	}

	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  

		Date now = new Date();
		String strNow = dateFormat.format(now);
		model.addAttribute("now", strNow);
		return "admin/nhap/insert";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public @ResponseBody byte[] insert(ModelMap model, HttpSession httpSession, HttpServletRequest request) throws UnsupportedEncodingException {
		Session session = factory.openSession();
		String result = "ERROR";
		//kh???i t???o phi???u nh???p
		Account account = (Account) session.get(Account.class, checkCookie(request).getUsername());
		Staff staff = account.getStaff();
		
		String date = request.getParameter("date");
		Date datePN = null;
		if (date.isEmpty())
		{
			datePN = new Date();
		}
		else
		{
			try {
				datePN = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "ERROR!.".getBytes("UTF-8");
			}
		}
		
		Receipt receipt = new Receipt(datePN, staff);
		receipt.setStatus(false);
		receipt.setDateConfirm(null);
		
		//l???y danh s??ch t??? session, n???u null th?? return "";
		List<CTPhieuNhap> ctPhieuNhaps = (List<CTPhieuNhap>) httpSession.getAttribute("ctPhieuNhaps");
		if (ctPhieuNhaps.isEmpty() || ctPhieuNhaps == null)
		{
			ctPhieuNhaps = new ArrayList<CTPhieuNhap>();
			return "Ch??a th??m s???n ph???m.".getBytes("UTF-8");
		}
		
		// l??u v??o database
		Transaction t = session.beginTransaction();
		try {
			session.save(receipt);
			for (CTPhieuNhap ctPhieuNhap : ctPhieuNhaps) {				
				CTHangHoa cTHangHoa = ctPhieuNhap.getcTHangHoa();
				CTPhieuNhap phieuNhap = new CTPhieuNhap(receipt, cTHangHoa, ctPhieuNhap.getSoLuong());
				session.save(phieuNhap);			
			}
			t.commit();
			ctPhieuNhaps = new ArrayList<CTPhieuNhap>();
			httpSession.setAttribute("ctPhieuNhaps", ctPhieuNhaps);
			result = "Th??m th??nh c??ng";
		} catch (Exception e) {
			System.out.print(e);
			t.rollback();
		} finally {
			session.close();
		}
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "confirm", method = RequestMethod.POST)
	public @ResponseBody byte[] confirm(ModelMap model, HttpSession httpSession, HttpServletRequest request) throws UnsupportedEncodingException {
		
		String result = "C?? l???i x???y ra";
		Session session = factory.openSession();
		String id = request.getParameter("id");
		Receipt receipt = (Receipt) session.get(Receipt.class, id);
		
		if (receipt.isStatus()) //khi c??? t??nh m??? n??t x??c nh???n v?? b???m
			return "?????ng c??? g???ng x??m nh???p v??o server tr??i ph??p.".getBytes("UTF-8");
		
		receipt.setStatus(true);
		receipt.setDateConfirm(new Date());
		Transaction transaction = session.beginTransaction();
		try {
			session.save(receipt);
			for (CTPhieuNhap ctPhieuNhap : receipt.getCtPhieuNhaps())
			{
				Product temp = (Product) session.get(Product.class, ctPhieuNhap.getcTHangHoa().getMaHangHoa().getId()); // l???y s???n ph???m t??? ctPhieuNhap
				boolean exist = false; //ki???m tra s??? t???n t???i c?? trong ctPhieuNhap kh??ng n???u kh??ng c?? s??? kh???i l??u v??o database
				CTHangHoa cTHangHoa = null;
				List<CTHangHoa> tempHangHoas = new ArrayList<CTHangHoa>(temp.getCT_HangHoa()); 
				for (int i =0; i< tempHangHoas.size(); i++)
				{
					if (tempHangHoas.get(i).getSize().getId().equals(ctPhieuNhap.getcTHangHoa().getSize().getId()))
					{
						cTHangHoa = tempHangHoas.get(i);
						cTHangHoa.setSoLuong(cTHangHoa.getSoLuong() + ctPhieuNhap.getSoLuong() );
						session.update(cTHangHoa);
						exist = true;
						break;
					}
				}
				
				if (!exist)
				{
					cTHangHoa = new CTHangHoa();
					cTHangHoa.setMaHangHoa(ctPhieuNhap.getcTHangHoa().getMaHangHoa());
					cTHangHoa.setSize(ctPhieuNhap.getcTHangHoa().getSize());
					cTHangHoa.setSoLuong(ctPhieuNhap.getSoLuong());
					session.save(cTHangHoa);
				}
			}
			
			transaction.commit();
			result ="X??c nh???n th??nh c??ng";
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
			result = String.valueOf(e);
		} finally {
			session.close();
		}
		return result.getBytes("UTF-8");
	}
	
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public @ResponseBody byte[] deleteReceipt(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws UnsupportedEncodingException
	{
		String result ="ERROR";
		Session session = factory.getCurrentSession();
		Account account = (Account) session.get(Account.class, checkCookie(request).getUsername());
		if (account.getRole().getId().equals("1") == false)
			return "?????ng c??? g???ng x??m nh???p v??o server tr??i ph??p.".getBytes("UTF-8");
		
		session = factory.openSession();
		String id = request.getParameter("id");
		Receipt receipt = (Receipt) session.get(Receipt.class, id);
		
		if (receipt.isStatus())
			return "?????ng c??? g???ng x??m nh???p v??o server tr??i ph??p.".getBytes("UTF-8");
		
		List<CTPhieuNhap> phieuNhaps = new ArrayList<CTPhieuNhap>(receipt.getCtPhieuNhaps());
		Transaction transaction = session.beginTransaction();
		try {
			for (CTPhieuNhap ctPhieuNhap : phieuNhaps) {
				session.delete(ctPhieuNhap);
			}
			session.delete(receipt);
			transaction.commit();
			result = "X??a th??nh c??ng.";
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		
		return result.getBytes("UTF-8");
	}

	@RequestMapping(value = "detail/{maPN}")
	public String detail(ModelMap model, @PathVariable("maPN") int maPN) {
		Session session = factory.getCurrentSession();
		Receipt phieuNhap = (Receipt) session.get(Receipt.class, maPN);
		model.addAttribute("phieuNhap", phieuNhap);
		return "admin/nhap/detail";
	}

	@RequestMapping("insertdetail")
	public String insertdetail(ModelMap model) {
		return "admin/nhap/insertdetail";
	}
	
	@RequestMapping(value = "addToCTPN", method = RequestMethod.POST)
	public @ResponseBody byte[] addtoListPN(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws UnsupportedEncodingException
	{
		Session session = factory.getCurrentSession();
		List<CTPhieuNhap> ctPhieuNhaps = (List<CTPhieuNhap>) httpSession.getAttribute("ctPhieuNhaps");
		if (ctPhieuNhaps == null)
			ctPhieuNhaps = new ArrayList<CTPhieuNhap>();
		
		String idProduct = request.getParameter("id");
		if (idProduct.equals(""))
		{
			return "".getBytes("UTF-8");
		}
		String idSize = request.getParameter("size");
		int count = Integer.valueOf(request.getParameter("count"));
		for (CTPhieuNhap ctPhieuNhap : ctPhieuNhaps) {
			if (ctPhieuNhap.getcTHangHoa().getMaHangHoa().getId().equals(idProduct) && ctPhieuNhap.getcTHangHoa().getSize().getId().equals(idSize))
			{
				ctPhieuNhap.setSoLuong(ctPhieuNhap.getSoLuong()+count);
				return "".getBytes("UTF-8");
			}
		}
		Product product = (Product) session.get(Product.class, idProduct);
		Size size = (Size) session.get(Size.class, idSize);
		 
		CTHangHoa cTHangHoa = new CTHangHoa(product, size);
		CTPhieuNhap ctPhieuNhap = new CTPhieuNhap(null, cTHangHoa, count);
		ctPhieuNhaps.add(ctPhieuNhap);
		httpSession.setAttribute("ctPhieuNhaps", ctPhieuNhaps);
		
		return "".getBytes("UTF-8");
	}
	
	@RequestMapping(value = "changeCTPN", method = RequestMethod.POST)
	public @ResponseBody byte[] changeCTPN(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws UnsupportedEncodingException
	{
		List<CTPhieuNhap> ctPhieuNhaps = (List<CTPhieuNhap>) httpSession.getAttribute("ctPhieuNhaps");
		if (ctPhieuNhaps == null)
			ctPhieuNhaps = new ArrayList<CTPhieuNhap>();
		
		String idProduct = request.getParameter("id");
		String idSize = request.getParameter("size");
		int count = Integer.valueOf(request.getParameter("count"));
		if (count < 1)
			return "Kh??ng th??? b?? h??n 1".getBytes("UTF-8");
		for (CTPhieuNhap ctPhieuNhap : ctPhieuNhaps) {
			if (ctPhieuNhap.getcTHangHoa().getMaHangHoa().getId().equals(idProduct) && ctPhieuNhap.getcTHangHoa().getSize().getId().equals(idSize))
			{
				ctPhieuNhap.setSoLuong(count);
				return "".getBytes("UTF-8");
			}
		}
		httpSession.setAttribute("ctPhieuNhaps", ctPhieuNhaps);
		
		return "".getBytes("UTF-8");
	}
	
	@RequestMapping(value = "removeCTPN", method = RequestMethod.POST)
	public @ResponseBody byte[] removeCTPN(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws UnsupportedEncodingException
	{
		List<CTPhieuNhap> ctPhieuNhaps = (List<CTPhieuNhap>) httpSession.getAttribute("ctPhieuNhaps");
		if (ctPhieuNhaps == null)
			ctPhieuNhaps = new ArrayList<CTPhieuNhap>();
		
		String idProduct = request.getParameter("id");
		if (idProduct.equals(""))
		{
			return "".getBytes("UTF-8");
		}
		String idSize = request.getParameter("size");
		for (CTPhieuNhap ctPhieuNhap : ctPhieuNhaps) {
			if (ctPhieuNhap.getcTHangHoa().getMaHangHoa().getId().equals(idProduct) && ctPhieuNhap.getcTHangHoa().getSize().getId().equals(idSize))
			{
				ctPhieuNhaps.remove(ctPhieuNhap);
				return "".getBytes("UTF-8");
			}
		}
		httpSession.setAttribute("ctPhieuNhaps", ctPhieuNhaps);
		
		return "".getBytes("UTF-8");
	}
	
	
	
	Account checkCookie(HttpServletRequest request)
	{
		try {
			Cookie[] cookies = request.getCookies();
			Account account = null;
			String username = "", passwd = "";
			for (Cookie cookie: cookies)
			{
				if (cookie.getName().equalsIgnoreCase("username"))
				{
					username = cookie.getValue();
				}
				if (cookie.getName().equalsIgnoreCase("passwd"))
				{
					passwd = cookie.getValue();
				}
			}
			if (!username.isEmpty() && !passwd.isEmpty())
				account = new Account(username, passwd);
			return account;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
}
