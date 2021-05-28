package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.websocket.server.PathParam;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.Brand;
import com.entity.CTHangHoa;
import com.entity.Comment;
import com.entity.Product;
import com.entity.ProductList;
import com.entity.Size;

@Transactional
@Controller
@RequestMapping("/admin/hanghoa/")
public class HangHoaController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;

	@ModelAttribute("dsLoai")
	public List<ProductList> getLoai() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductList";
		Query query = session.createQuery(hql);
		List<ProductList> list = query.list();
		return list;
	}

	@ModelAttribute("dsCTHangHoa")
	public List<CTHangHoa> getList() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CTHangHoa";
		Query query = session.createQuery(hql);
		List<CTHangHoa> list = query.list();
		return list;
	}
	
	@ModelAttribute("size")
	public List<Size> listSize()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Size";
		Query query = session.createQuery(hql);
		List<Size> list = query.list();
		return list;
	}
	
	@ModelAttribute("Brands")
	public List<Brand> listBrand()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Brand";
		Query query = session.createQuery(hql);
		List<Brand> list = query.list();
		return list;
	}

	@RequestMapping("size")
	public String indexSize(ModelMap model, HttpSession httpSession) {
		return "admin/hanghoa/size";
	}

	@RequestMapping("index")
	public String index(ModelMap model, HttpSession httpSession) {
		return "redirect:/admin/hanghoa/index.htm?page=1";
	}

	public void loadindex(ModelMap model, String hql, Integer page) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Object> list = query.list();
		//model.addAttribute("dshangHoa", list.subList((page - 1) * 4, (page * 4 > list.size() ? list.size() : page * 4)));
		model.addAttribute("dshangHoa",list);
	}

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String indexpage(ModelMap model) {
		String hql = "From Product";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		model.addAttribute("dshangHoa",list);
		return "admin/hanghoa/index";
	}

	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("Product", new Product());
		return "admin/hanghoa/insert";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("Product") Product hangHoa,
			@RequestParam("photo") MultipartFile photo, BindingResult errors, RedirectAttributes re)
			throws IllegalStateException, IOException {
		if (hangHoa.getId().trim().length() == 0) {
			errors.rejectValue("ID", "ID", "Vui Lòng Nhập Mã Hàng Hóa");
		}
		if (hangHoa.getName().trim().length() == 0) {
			errors.rejectValue("name", "name", "Vui Lòng Nhập Tên Hàng Hóa");
		}
		if (hangHoa.getDiscount() > hangHoa.getPrice()) {
			errors.rejectValue("discount", "discount", "Vui Lòng Chọn Giảm Giá Nhỏ Hơn Đơn Giá");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");

		} else {
			Session session = factory.openSession();
			if (photo.getOriginalFilename().isEmpty()) {
				hangHoa.setImage("default.jpg");
			} else if (!(photo.getContentType().contains("jpeg") || photo.getContentType().contains("png"))) {
				re.addFlashAttribute("message", "This file type is not supported !");
			} else {
				try {
					String photoPath = context.getRealPath("/images/" +photo.getOriginalFilename());
					photo.transferTo(new File(photoPath));
					hangHoa.setImage(photo.getOriginalFilename());
				} catch (Exception e) {
					re.addFlashAttribute("message", "Save file error: " + e);
					return "redirect:/admin/hanghoa/insert.htm";
				}
			}

			Transaction t = session.beginTransaction();
			try {
				session.save(hangHoa);
				t.commit();
				re.addFlashAttribute("message", "Thêm Thành Công!");
			} catch (Exception e) {
				t.rollback();
				re.addFlashAttribute("message", "Thêm Thất Bại!" + e);
				return "redirect:/admin/hanghoa/insert.htm";
			} finally {
				session.close();
			}
			return "redirect:/admin/hanghoa/insert.htm";
		}
		return "admin/hanghoa/insert";
	}

	@RequestMapping(value = "update/{maHangHoa}", method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable("maHangHoa") String maHangHoa, HttpServletRequest request) {
		Session session = factory.getCurrentSession();
		Product hangHoa = (Product) session.get(Product.class, maHangHoa);
		model.addAttribute("Product", hangHoa);
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		System.out.print(rootPath);
		return "admin/hanghoa/update";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("Product") Product hangHoa,
			@RequestParam("photo") MultipartFile photo, BindingResult errors, RedirectAttributes re) {
		if (hangHoa.getName().trim().length() == 0) {
			errors.rejectValue("tenHangHoa", "tenHangHoa", "Vui Lòng Nhập Tên Hàng Hóa");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
			return "admin/hanghoa/update";

		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			if (photo.isEmpty()) {
				Session session1 = factory.getCurrentSession();
				Product temp = (Product) session1.get(Product.class, hangHoa.getId());
				hangHoa.setImage(temp.getImage());
				System.out.println(temp.getImage());
			} else {
				try {
					String photoPath = "";
					photoPath = context.getRealPath("/images/" +photo.getOriginalFilename());
					photo.transferTo(new File(photoPath));
					
					hangHoa.setImage(photo.getOriginalFilename());
					System.out.println(hangHoa.getImage());
				} catch (Exception e) {
					// TODO: handle exception
				}
				
			}
			try {
				session.update(hangHoa);
				t.commit();
				re.addFlashAttribute("message", "Cập Nhật Thành Công!");
			} catch (Exception e) {
				t.rollback();
				System.out.print(e);
				re.addFlashAttribute("message", "Cập Nhật Thất Bại!");
				return "admin/hanghoa/update";
			} finally {
				session.close();
			}
			return "redirect:/admin/hanghoa/index.htm";
		}
	}

	@RequestMapping(value = "delete/{maHangHoa}", method = RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("maHangHoa") String maHangHoa) {
		Session session = factory.getCurrentSession();
		Product product = new Product();
		product.setId(maHangHoa);
		CTHangHoa ctHangHoa = new CTHangHoa();
		ctHangHoa.setMaHangHoa(product);
		String hql = "From Comment cmt where cmt.productCmt.id = '"+product.getId()+"'";
		Query query = session.createQuery(hql);
		List<Comment> comments = query.list();
		
		hql = "From CTHangHoa ct where ct.MaHangHoa.id = '"+product.getId()+"'";
		query = session.createQuery(hql);
		List<CTHangHoa> ctHangHoas = query.list();
		
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			for (Comment cmt : comments) {
				session.delete(cmt);
			}
			for (CTHangHoa ct : ctHangHoas) {
				session.delete(ct);
			}
			session.delete(product);
			t.commit();
			model.addAttribute("message", "Xóa Thành Công!");
		} catch (Exception e) {
			t.rollback();
			System.out.print(e);
			model.addAttribute("message", "Xóa Thất Bại!");
		} finally {
			session.close();
		}
		return "redirect:/admin/hanghoa/index.htm";
	}

	@RequestMapping(value = "detail/{maHangHoa}", method = RequestMethod.GET)
	public String detail(ModelMap model, @PathVariable("maHangHoa") String maHangHoa) {
		Session session = factory.getCurrentSession();
		Product hangHoa = (Product) session.get(Product.class, maHangHoa);
		int size = hangHoa.getCT_HangHoa().size();
		hangHoa.setCT_HangHoa(new HashSet<CTHangHoa>(hangHoa.getCT_HangHoa()));
		model.addAttribute("hangHoa", hangHoa);
		return "admin/hanghoa/detail";
	}
	
	@RequestMapping(value = "deleteDetail", method = RequestMethod.POST)
	public @ResponseBody byte[] deleteDetail(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String result= "";
		Session session = factory.getCurrentSession();
		Size size = new Size(request.getParameter("size"));
		Product product = (Product) session.get(Product.class, request.getParameter("ID"));
		
		CTHangHoa ctHangHoa = new CTHangHoa();
		ctHangHoa.setSize(size);
		ctHangHoa.setMaHangHoa(product);
		
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			session.delete(ctHangHoa);
			transaction.commit();
			result = "Xóa thành công.";
		} catch (Exception e) {
			transaction.rollback();
			System.out.print(e);
			result = "Xóa thất bại";
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "editDetail", method = RequestMethod.POST)
	public @ResponseBody byte[] editDetail(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String result= "";
		Session session = factory.getCurrentSession();
		Size size = new Size(request.getParameter("size"));
		Product product = (Product) session.get(Product.class, request.getParameter("ID"));
		String temp = request.getParameter("count");
		if (temp.isEmpty())
		{
			return "Không được để số lượng trống".getBytes("UTF-8");
		}
		int count = Integer.parseInt(temp) ;
		
		if (count < 0)
		{
			return "Số lượng phải lớn hơn hoặc bằng 0".getBytes("UTF-8");
		}
		
		CTHangHoa ctHangHoa = new CTHangHoa(product, size, count);
		
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			session.update(ctHangHoa);
			transaction.commit();
			result = "Sửa thành công.";
		} catch (Exception e) {
			transaction.rollback();
			result = "Sửa thất bại";
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "addDetail", method = RequestMethod.POST)
	public @ResponseBody byte[] addDetail(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String result= "";
		Session session = factory.getCurrentSession();
		String size_str = request.getParameter("size");
		Size size = (Size) session.get(Size.class,"5");
		if (!size_str.isEmpty())
		{
			size = (Size) session.get(Size.class,size_str);
		}
		
		Product product = (Product) session.get(Product.class, request.getParameter("ID"));
		
		String temp = request.getParameter("count");
		if (temp.isEmpty())
		{
			return "Không được để số lượng trống".getBytes("UTF-8");
		}
		int count = Integer.parseInt(temp) ;
	
		if (count < 0)
		{
			return "Số lượng phải lớn hơn hoặc bằng 0".getBytes("UTF-8");
		}
		
		String hql = "";

		if (!size_str.isEmpty())
			hql = "From CTHangHoa cthanghoa where cthanghoa.MaHangHoa.id = '"+product.getId()+"' AND cthanghoa.size.id = '"+size.getId()+"'";
		else
			hql = "From CTHangHoa cthanghoa where cthanghoa.MaHangHoa.id = '"+product.getId()+"' AND cthanghoa.size.id = '5'";
		Query query = session.createQuery(hql);
		
		if (query.list().isEmpty())
		{
			CTHangHoa ctHangHoa = new CTHangHoa(product, size, count);
			
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			
			try {
				session.save(ctHangHoa);
				transaction.commit();
				result = "Thêm thành công.";
			} catch (Exception e) {
				transaction.rollback();
				System.out.print(e);
				result = "Thêm thất bại.\n"+e;
				// TODO: handle exception
			}
			finally {
				session.close();
			}
		}
		else
		{
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			
			CTHangHoa ctHangHoa = (CTHangHoa) query.list().get(0);
			ctHangHoa.setSoLuong(ctHangHoa.getSoLuong() + count);
			try {
				session.update(ctHangHoa);
				transaction.commit();
				result = "Thêm thành công.";
			} catch (Exception e) {
				transaction.rollback();
				result = "Thêm thất bại.\n"+e;
				// TODO: handle exception
			}
			finally {
				session.close();
			}
		}
		
		
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value ="editSize", method = RequestMethod.POST)
	public @ResponseBody byte[] editSize(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String result ="Error";
		String id = request.getParameter("ID");
		String name = request.getParameter("name");
		String notes = request.getParameter("notes");
		Size size = new Size(id, name, notes);
		Session session = factory.getCurrentSession();
		String hql = "From Size where name ='"+name+"'";
		Query query = session.createQuery(hql);
		
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.update(size);
			transaction.commit();
			result = "Sửa thành công.";
		} catch (Exception e) {
			result = "Sửa thất bại.";
			System.out.print(e);
			transaction.rollback();
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value ="delSize", method = RequestMethod.POST)
	public @ResponseBody byte[] delSize(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String result ="Error";
		String id = request.getParameter("ID");
		Session session = factory.getCurrentSession();
		
		Size size = (Size) session.get(Size.class, request.getParameter("ID"));
		if (!size.getCtHangHoa().isEmpty())
		{
			return "Không thể xóa size đã có sản phẩm sử dụng.".getBytes("UTF-8");
		}
		size = new Size(size.getId());
		
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.delete(size);
			transaction.commit();
			result = "Xóa thành công.";
		} catch (Exception e) {
			result = String.valueOf(e);
			System.out.print(e);
			transaction.rollback();
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value ="addSize", method = RequestMethod.POST)
	public @ResponseBody byte[] addSize(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String result ="Error";
		String name = request.getParameter("name");
		Session session = factory.getCurrentSession();
		String hql = "From Size where name ='"+name+"'";
		Query query = session.createQuery(hql);
		
		if (!query.list().isEmpty())
		{
			return "Tên size đã tồn tại.".getBytes("UTF-8");
		}
		String notes = request.getParameter("notes");
		Size size = new Size(name, notes);
		
		
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(size);
			transaction.commit();
			result = "Thêm thành công.";
		} catch (Exception e) {
			result = String.valueOf(e);
			System.out.print(e);
			transaction.rollback();
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		
		return result.getBytes("UTF-8");
	}
	
}