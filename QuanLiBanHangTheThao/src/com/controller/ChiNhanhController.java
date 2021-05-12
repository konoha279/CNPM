package com.controller;

import java.util.List;

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

import com.entity.Branch;


@Transactional
@Controller
@RequestMapping("/admin/chinhanh/")
public class ChiNhanhController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from Branch";
		Query query = session.createQuery(hql);
		List<Branch> list = query.list();
		model.addAttribute("dsChiNhanh",list);
		return "admin/chinhanh/index";
	}
	
	@RequestMapping(value="insert",method=RequestMethod.GET)
	public String insert(ModelMap model)
	{
		model.addAttribute("Branch",new Branch());
		return "admin/chinhanh/insert";
	}
	
	@RequestMapping(value="insert",method=RequestMethod.POST)
	public String insert(ModelMap model,@ModelAttribute("Branch")Branch chiNhanh,BindingResult errors)
	{
		if (chiNhanh.getId().trim().length() == 0) {
			errors.rejectValue("id", "id", "Vui Lòng Mã CN");
		}
		if (chiNhanh.getName().trim().length() == 0) {
			errors.rejectValue("name", "name", "Vui Lòng Nhập Tên CN");
		}
		if (chiNhanh.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "address", "Vui Lòng Nhập Địa Chỉ");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {		
				session.save(chiNhanh);
				t.commit();
				model.addAttribute("message","Thêm Mới Thành Công!");
			}
			catch (Exception e) {
				t.rollback();
				model.addAttribute("message","Thêm Mới Thất Bại!");
			}
			finally {
				session.close();
			}
		}		
		return "admin/chinhanh/insert";
	}
	
	@RequestMapping(value="update/{maCN}",method=RequestMethod.GET)
	public String update(ModelMap model,@PathVariable("maCN") String maCN)
	{
		Session session = factory.getCurrentSession();
		Branch chiNhanh = (Branch) session.get(Branch.class, maCN);
		model.addAttribute("Branch",chiNhanh);
		return "admin/chinhanh/update";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(ModelMap model,@ModelAttribute("Branch")Branch chiNhanh,BindingResult errors)
	{
		if (chiNhanh.getName().trim().length() == 0) {
			errors.rejectValue("name", "name", "Vui Lòng Nhập Tên CN");
		}
		if (chiNhanh.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "address", "Vui Lòng Nhập Địa Chỉ");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
			return "admin/chinhanh/update";
		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.update(chiNhanh);
				t.commit();
				model.addAttribute("message","Cập Nhật Thành Công!");
			}
			catch (Exception e) {
				t.rollback();
				model.addAttribute("message","Cập Nhật Thất Bại!");
				return "admin/hanghoa/update";
			}
			finally {
				session.close();
			}
		}	
		return "redirect:/admin/chinhanh/index.htm";
	}
	
	@RequestMapping(value="delete/{maCN}",method=RequestMethod.GET)
	public String delete(ModelMap model,@PathVariable("maCN")String maCN)
	{
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Branch chiNhanh = (Branch)session.get(Branch.class,maCN);
			session.delete(chiNhanh);
			t.commit();
			model.addAttribute("message","Xóa Thành Công!");
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message","Xóa Thất Bại!");
		}
		finally {
			session.close();
		}
		return "redirect:/admin/chinhanh/index.htm";
	}
}
