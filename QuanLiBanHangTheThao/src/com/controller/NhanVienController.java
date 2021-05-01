package com.controller;

import java.util.List;

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

import com.entity.Branch;
import com.entity.Staff;


@Transactional
@Controller
@RequestMapping("/admin/nhanvien/")
public class NhanVienController {
	@Autowired
	SessionFactory factory;
	
//	@RequestMapping("index")
//	public String index(ModelMap model) {
//		Session session = factory.getCurrentSession();
//		String hql = "from NhanVien";
//		Query query = session.createQuery(hql);
//		List<NhanVien> list = query.list();
//		model.addAttribute("dsNhanVien", list);
//		return "admin/nhanvien/index";
//	}
	@ModelAttribute("dsChiNhanh")
	public List<Branch> getLoai() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Branch";
		Query query = session.createQuery(hql);
		List<Branch> list = query.list();
		return list;
	}
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession httpSession) {
		return "redirect:/admin/nhanvien/index.htm?page=1";
	}

	public void loadindex(ModelMap model, String hql, Integer page) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Object> list = query.list();
		model.addAttribute("products", list.subList((page - 1) * 8, (page * 8 > list.size() ? list.size() : page * 8)));
		model.addAttribute("page", page);
		model.addAttribute("maxpage", Math.ceil(list.size() / 8.0));
	}

	@RequestMapping(value = "index", params = { "page" })
	public String indexpage(ModelMap model, @PathParam("page") Integer page) {
		String hql = "From NhanVien";
		loadindex(model, hql, page);
		return "admin/nhanvien/index";
	}

	@RequestMapping(value="insert",method=RequestMethod.GET)
	public String insert(ModelMap model)
	{
		model.addAttribute("nhanVien",new Staff());
		return "admin/nhanvien/insert";
	}
	
	@RequestMapping(value="insert",method=RequestMethod.POST)
	public String insert(ModelMap model,@ModelAttribute("Staff")Staff nhanVien,BindingResult errors)
	{
//		if (nhanVien.getMaNV().trim().length() == 0) {
//			errors.rejectValue("mACN", "mACN", "Vui Lòng Mã CN");
//		}
//		if (nhanVien.getHo().trim().length() == 0) {
//			errors.rejectValue("", "", "Vui Lòng Nhập Tên CN");
//		}
//		if (nhanVien.getTen().trim().length() == 0) {
//			errors.rejectValue("diaChi", "diaChi", "Vui Lòng Nhập Địa Chỉ");
//		}
//		if (nhanVien.getDiaChi().trim().length() == 0) {
//			errors.rejectValue("soDT", "soDT", "Vui Lòng Nhập Số Điện Thoại");
//		}
//		if (errors.hasErrors()) {
//			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
//		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.save(nhanVien);
				t.commit();
				model.addAttribute("message","Thêm Mới Thành Công!");
			}
			catch (Exception e) {
				t.rollback();
				model.addAttribute("message",e.getMessage());
			}
			finally {
				session.close();
			}
//		}		
		return "admin/nhanvien/insert";
	}
	
	@RequestMapping(value="update/{maNV}",method=RequestMethod.GET)
	public String update(ModelMap model,@PathVariable("maNV") int maNV)
	{
		Session session = factory.getCurrentSession();
		Staff nhanVien = (Staff) session.get(Staff.class, maNV);
		model.addAttribute("mANV", maNV);
		model.addAttribute("nhanVien", nhanVien);
		return "admin/nhanvien/update";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(ModelMap model,@ModelAttribute("Staff")Staff nhanVien,BindingResult errors)
	{
//		if (.getmACN().trim().length() == 0) {
//			errors.rejectValue("mACN", "mACN", "Vui Lòng Mã CN");
//		}
//		if (.get().trim().length() == 0) {
//			errors.rejectValue("", "", "Vui Lòng Nhập Tên CN");
//		}
//		if (.getDiaChi().trim().length() == 0) {
//			errors.rejectValue("diaChi", "diaChi", "Vui Lòng Nhập Địa Chỉ");
//		}
//		if (.getSoDT().trim().length() == 0) {
//			errors.rejectValue("soDT", "soDT", "Vui Lòng Nhập Số Điện Thoại");
//		}
//		if (errors.hasErrors()) {
//			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
//		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				
				session.update(nhanVien);				
				t.commit();
				model.addAttribute("message","Cập Nhật Thành Công!");
			}
			catch (Exception e) {
				t.rollback();
				model.addAttribute("message",e.getMessage());
			}
			finally {
				session.close();
			}
//		}	
		return "redirect:/admin/nhanvien/index.htm?page=1";
	}	
}
