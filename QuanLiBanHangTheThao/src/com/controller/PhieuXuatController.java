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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Account;
import com.entity.CTHangHoa;
import com.entity.CTPhieuXuat;
import com.entity.PhieuXuat;
import com.entity.Product;
import com.entity.Size;
import com.entity.Staff;

@Transactional
@Controller
@RequestMapping("/admin/xuat/")
public class PhieuXuatController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	
	@ModelAttribute("dsPhieuXuat")
	public List<PhieuXuat> xuats()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM PhieuXuat";
		Query query = session.createQuery(hql);
		List<PhieuXuat> list = query.list();
		return list;
	}
	
	@ModelAttribute("dsSanPham")
	public List<Product> getSanPham()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}
	
	@ModelAttribute("ctPhieuXuats")
	public List<CTPhieuXuat>  listCtPX(HttpSession httpSession)
	{
		List<CTPhieuXuat> ctPhieuXuats = (List<CTPhieuXuat>) httpSession.getAttribute("ctPhieuXuats");
		if (ctPhieuXuats == null)
			ctPhieuXuats = new ArrayList<CTPhieuXuat>();
		httpSession.setAttribute("ctPhieuXuats", ctPhieuXuats);
		return ctPhieuXuats;
	}
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		return "admin/xuat/index";
	}
	
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public @ResponseBody byte[] deleteReceipt(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws UnsupportedEncodingException
	{
		String result ="ERROR";
		Session session = factory.getCurrentSession();
		Account account = (Account) session.get(Account.class, checkCookie(request).getUsername());
		if (account.getRole().getId().equals("1") == false)
			return "Tôi khóa tài khoản đó (╬▔皿▔)╯".getBytes("UTF-8");
		
		session = factory.openSession();
		String id = request.getParameter("id");
		PhieuXuat phieuXuat = (PhieuXuat) session.get(PhieuXuat.class, id);
		if (phieuXuat.isStatus())
			return "Đừng cố gắng xâm nhập vào server trái phép.".getBytes("UTF-8");
		
		List<CTPhieuXuat> phieuXuats = new ArrayList<CTPhieuXuat>(phieuXuat.getCtPhieuXuats());
		Transaction transaction = session.beginTransaction();
		try {
			for (CTPhieuXuat xuat : phieuXuats) {
				session.delete(xuat);
			}
			session.delete(phieuXuat);
			transaction.commit();
			result = "Xóa thành công.";
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
	
	@RequestMapping(value = "confirm", method = RequestMethod.POST)
	public @ResponseBody byte[] confirm(ModelMap model, HttpSession httpSession, HttpServletRequest request) throws UnsupportedEncodingException {
		
		String result = "Có lỗi xảy ra";
		Session session = factory.openSession();
		
		Account account = (Account) session.get(Account.class, checkCookie(request).getUsername());
		if (account.getRole().getId().equals("1") == false)
			return "Tôi khóa tài khoản đó (╬▔皿▔)╯".getBytes("UTF-8");
		
		String id = request.getParameter("id");
		
		PhieuXuat phieuXuat = (PhieuXuat) session.get(PhieuXuat.class, id);
		if (phieuXuat.isStatus())
			return "Đừng cố gắng xâm nhập vào server trái phép.".getBytes("UTF-8");
		
		phieuXuat.setStatus(true);
		phieuXuat.setDateConfirm(new Date());
		Transaction transaction = session.beginTransaction();
		try {
			session.save(phieuXuat);
			for (CTPhieuXuat ctPhieuXuat : phieuXuat.getCtPhieuXuats())
			{
				Product temp = (Product) session.get(Product.class, ctPhieuXuat.getcTHangHoa().getMaHangHoa().getId()); // lấy sản phẩm từ ctPhieuNhap
				boolean exist = false; //kiểm tra sự tồn tại có trong ctPhieuNhap không nếu không có sẽ khỏi lưu vào database
				CTHangHoa cTHangHoa = null;
				List<CTHangHoa> tempHangHoas = new ArrayList<CTHangHoa>(temp.getCT_HangHoa()); 
				for (int i =0; i< tempHangHoas.size(); i++)
				{
					if (tempHangHoas.get(i).getSize().getId().equals(ctPhieuXuat.getcTHangHoa().getSize().getId()))
					{
						cTHangHoa = tempHangHoas.get(i);
						cTHangHoa.setSoLuong(cTHangHoa.getSoLuong() - ctPhieuXuat.getSoLuong() );
						session.update(cTHangHoa);
						exist = true;
						break;
					}
				}
				
				if (!exist)
				{
					cTHangHoa = new CTHangHoa();
					cTHangHoa.setMaHangHoa(ctPhieuXuat.getcTHangHoa().getMaHangHoa());
					cTHangHoa.setSize(ctPhieuXuat.getcTHangHoa().getSize());
					cTHangHoa.setSoLuong(ctPhieuXuat.getSoLuong());
					session.save(cTHangHoa);
				}
			}
			
			transaction.commit();
			result ="Xác nhận thành công";
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
			result = String.valueOf(e);
		} finally {
			session.close();
		}
		return result.getBytes("UTF-8");
	}	
	
	// ----------------------------------------------------------------------------- insert -----------------------------------------------------------------------------
	
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  

		Date now = new Date();
		String strNow = dateFormat.format(now);
		model.addAttribute("now", strNow);
		return "admin/xuat/insert";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public @ResponseBody byte[] insert(ModelMap model, HttpSession httpSession, HttpServletRequest request) throws UnsupportedEncodingException {
		Session session = factory.openSession();
		String result = "ERROR";
		//khởi tạo phiếu nhập
		Account account = (Account) session.get(Account.class, checkCookie(request).getUsername());
		Staff staff = account.getStaff();
		
		String date = request.getParameter("date");
		Date datePX = null;
		if (date.isEmpty() || date == null)
		{
			datePX = new Date();
		}
		else
		{
			try {
				datePX = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "ERROR!.".getBytes("UTF-8");
			}
		}
		
		
		PhieuXuat phieuXuat = new PhieuXuat(datePX, staff);
		phieuXuat.setStatus(false);
		phieuXuat.setDateConfirm(null);
		
		//lấy danh sách từ session, nếu null thì return "";
		List<CTPhieuXuat> ctPhieuXuats = (List<CTPhieuXuat>) httpSession.getAttribute("ctPhieuXuats");
		if (ctPhieuXuats.isEmpty() || ctPhieuXuats == null)
		{
			ctPhieuXuats = new ArrayList<CTPhieuXuat>();
			return "Chưa thêm sản phẩm.".getBytes("UTF-8");
		}
		
		// lưu vào database
		Transaction t = session.beginTransaction();
		try {
			session.save(phieuXuat);
			for (CTPhieuXuat ctPhieuXuat : ctPhieuXuats) {				
				CTHangHoa cTHangHoa = ctPhieuXuat.getcTHangHoa();
				CTPhieuXuat ctXuat = new CTPhieuXuat(phieuXuat, cTHangHoa, ctPhieuXuat.getSoLuong());
				session.save(ctXuat);			
			}
			t.commit();
			ctPhieuXuats = new ArrayList<CTPhieuXuat>();
			httpSession.setAttribute("ctPhieuXuats", ctPhieuXuats);
			result = "Thêm thành công";
		} catch (Exception e) {
			System.out.print(e);
			t.rollback();
		} finally {
			session.close();
		}
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "addToCTPX", method = RequestMethod.POST)
	public @ResponseBody byte[] addtoListPN(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws UnsupportedEncodingException
	{
		Session session = factory.getCurrentSession();
		List<CTPhieuXuat> ctPhieuXuats = (List<CTPhieuXuat>) httpSession.getAttribute("ctPhieuXuats");
		if (ctPhieuXuats == null)
			ctPhieuXuats = new ArrayList<CTPhieuXuat>();
		
		String idProduct = request.getParameter("id");
		String idSize = request.getParameter("size");
		
		if (idSize.isEmpty())
			return "Vui lòng chọn size!".getBytes("UTF-8");
		int count = Integer.valueOf(request.getParameter("count"));
		for (CTPhieuXuat ctPhieuXuat : ctPhieuXuats) {
			if (ctPhieuXuat.getcTHangHoa().getMaHangHoa().getId().equals(idProduct) && ctPhieuXuat.getcTHangHoa().getSize().getId().equals(idSize))
			{
				String hql = "From CTHangHoa where MaHangHoa.id = '" + idProduct+ "' and size.id ='"+idSize+"'";
				Query query = session.createQuery(hql);
				CTHangHoa ctHangHoa = (CTHangHoa) query.list().get(0);
				
				if (ctHangHoa.getSoLuong() < count)
				{
					return "Số lượng xuất đã là số lượng tối đa trong kho".getBytes("UTF-8");
				}
				
				ctPhieuXuat.setSoLuong(ctPhieuXuat.getSoLuong()+count);
				return "".getBytes("UTF-8");
			}
		}
		Product product = (Product) session.get(Product.class, idProduct);
		Size size = (Size) session.get(Size.class, idSize);
		 
		CTHangHoa cTHangHoa = new CTHangHoa(product, size);
		CTPhieuXuat ctPhieuXuat = new CTPhieuXuat(null, cTHangHoa, count);
		ctPhieuXuats.add(ctPhieuXuat);
		httpSession.setAttribute("ctPhieuXuats", ctPhieuXuats);
		
		return "".getBytes("UTF-8");
	}
	
	@RequestMapping(value = "changeCTPX", method = RequestMethod.POST)
	public @ResponseBody byte[] changeCTPN(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws UnsupportedEncodingException
	{
		List<CTPhieuXuat> ctPhieuXuats = (List<CTPhieuXuat>) httpSession.getAttribute("ctPhieuXuats");
		if (ctPhieuXuats == null)
			ctPhieuXuats = new ArrayList<CTPhieuXuat>();
		
		String idProduct = request.getParameter("id");
		String idSize = request.getParameter("size");
		int count = Integer.valueOf(request.getParameter("count"));
		
		if (count < 1)
			return "Không thể bé hơn 1".getBytes("UTF-8");
		for (CTPhieuXuat ctPhieuXuat : ctPhieuXuats) {
			if (ctPhieuXuat.getcTHangHoa().getMaHangHoa().getId().equals(idProduct) && ctPhieuXuat.getcTHangHoa().getSize().getId().equals(idSize))
			{
				Session session = factory.getCurrentSession();
				String hql = "From CTHangHoa where MaHangHoa.id = '" + idProduct+ "' and size.id ='"+idSize+"'";
				Query query = session.createQuery(hql);
				CTHangHoa ctHangHoa = (CTHangHoa) query.list().get(0);
				
				if (ctHangHoa.getSoLuong() < count)
				{
					return "Số lượng xuất đã là số lượng tối đa trong kho".getBytes("UTF-8");
				}
				ctPhieuXuat.setSoLuong(count);
				return "".getBytes("UTF-8");
			}
		}
		httpSession.setAttribute("ctPhieuXuats", ctPhieuXuats);
		
		return "".getBytes("UTF-8");
	}
	
	@RequestMapping(value = "removeCTPX", method = RequestMethod.POST)
	public @ResponseBody byte[] removeCTPN(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws UnsupportedEncodingException
	{
		List<CTPhieuXuat> ctPhieuXuats = (List<CTPhieuXuat>) httpSession.getAttribute("ctPhieuXuats");
		if (ctPhieuXuats == null)
			ctPhieuXuats = new ArrayList<CTPhieuXuat>();
		
		String idProduct = request.getParameter("id");
		String idSize = request.getParameter("size");
		for (CTPhieuXuat ctPhieuXuat : ctPhieuXuats) {
			if (ctPhieuXuat.getcTHangHoa().getMaHangHoa().getId().equals(idProduct) && ctPhieuXuat.getcTHangHoa().getSize().getId().equals(idSize))
			{
				ctPhieuXuats.remove(ctPhieuXuat);
				return "".getBytes("UTF-8");
			}
		}
		httpSession.setAttribute("ctPhieuXuats", ctPhieuXuats);
		
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
