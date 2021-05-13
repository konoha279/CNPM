package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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

import com.entity.CTHangHoa;
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

//	@RequestMapping("index")
//	public String index(ModelMap model) {
//		Session session = factory.getCurrentSession();
//		String hql = "from HangHoa";
//		Query query = session.createQuery(hql);
//		List<HangHoa> list = query.list();
//		model.addAttribute("dshangHoa", list);
//		return "admin/hanghoa/index";
//	}

	@RequestMapping("index")
	public String index(ModelMap model, HttpSession httpSession) {
		return "redirect:/admin/hanghoa/index.htm?page=1";
	}

	public void loadindex(ModelMap model, String hql, Integer page) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Object> list = query.list();
		model.addAttribute("dshangHoa",
				list.subList((page - 1) * 4, (page * 4 > list.size() ? list.size() : page * 4)));
		model.addAttribute("page", page);
		model.addAttribute("maxpage", Math.ceil(list.size() / 4.0));
	}

	@RequestMapping(value = "index", params = { "page" })
	public String indexpage(ModelMap model, @PathParam("page") Integer page) {
		String hql = "From Product";
		loadindex(model, hql, page);
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
		if (hangHoa.getID().trim().length() == 0) {
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
					String photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
					photo.transferTo(new File(photoPath));
					hangHoa.setImage("images/" + photo.getOriginalFilename());
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
				Product temp = (Product) session1.get(Product.class, hangHoa.getID());
				hangHoa.setImage(temp.getImage());
				System.out.println(temp.getImage());
			} else {
				try {
					String photoPath = "";
					photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
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
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Product hangHoa = (Product) session.get(Product.class, maHangHoa);
			session.delete(hangHoa);
			t.commit();
			model.addAttribute("message", "Xóa Thành Công!");
		} catch (Exception e) {
			t.rollback();
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
		Size size = (Size) session.get(Size.class, request.getParameter("size"));
		Product product = (Product) session.get(Product.class, request.getParameter("ID"));
		
		String temp = request.getParameter("count");
		if (temp.isEmpty())
		{
			return "Không được để số lượng trống".getBytes("UTF-8");
		}
		int count = Integer.parseInt(temp) ;

		String hql = "From CTHangHoa cthanghoa where cthanghoa.MaHangHoa.id = '"+product.getID()+"' AND cthanghoa.size.size = '"+size.size+"'";
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
		}
		
		
		return result.getBytes("UTF-8");
	}
	
}