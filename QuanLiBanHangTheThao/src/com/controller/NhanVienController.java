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

import com.entity.Account;
import com.entity.Branch;
import com.entity.Role;
import com.entity.Staff;


@Transactional
@Controller
@RequestMapping("/admin/nhanvien/")
public class NhanVienController {
	@Autowired
	SessionFactory factory;
	
	@ModelAttribute("dsChiNhanh")
	public List<Branch> getLoai() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Branch";
		Query query = session.createQuery(hql);
		List<Branch> list = query.list();
		return list;
	}
	
	@ModelAttribute("role")
	public List<Role> getRole()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Role";
		Query query = session.createQuery(hql);
		List<Role> list = query.list();
		return list;
	}
	
	public Role getRole(String id)
	{
		Session session = factory.getCurrentSession();
		Role role = (Role) session.get(Role.class, id);
		return role;
	}
	
	public Branch getBranch(String id)
	{
		Session session = factory.getCurrentSession();
		return (Branch) session.get(Branch.class, id);
	}
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession httpSession) {
		return "redirect:/admin/nhanvien/index.htm?page=1";
	}

	public void loadindex(ModelMap model, String hql, Integer page) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Staff> list = query.list();
		model.addAttribute("Staff", list.subList((page - 1) * 8, (page * 8 > list.size() ? list.size() : page * 8)));
		model.addAttribute("page", page);
		model.addAttribute("maxpage", Math.ceil(list.size() / 8.0));
	}

	@RequestMapping(value = "index", params = { "page" })
	public String indexpage(ModelMap model, @PathParam("page") Integer page) {
		String hql = "From Staff";
		loadindex(model, hql, page);
		return "admin/nhanvien/index";
	}

	@RequestMapping(value="insert",method=RequestMethod.GET)
	public String insert(ModelMap model)
	{
		model.addAttribute("staff",new Staff());
		return "admin/nhanvien/insert";
	}
	
	@RequestMapping(value="insert",method=RequestMethod.POST)
	public String insert(ModelMap model,@ModelAttribute("staff")Staff staff,BindingResult errors)
	{
		if (staff.getName().trim().length() == 0) {
			errors.rejectValue("name", "name", "Vui lòng nhập tên nhân viên");
		}
		if (staff.getFirstName().trim().length() == 0) {
			errors.rejectValue("firstName", "firstName", "Vui lòng nhập họ nhân viên");
		}
		if (staff.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "address", "Vui lòng nhập địa chỉ nhân viên");
		}
		if (staff.getPhoneNumber().trim().length() == 0) {
			errors.rejectValue("phoneNumber", "phoneNumber", "Vui lòng nhập số điện thoại nhân viên");
		}
		if (staff.getBirthday() == null)
		{
			errors.rejectValue("phoneNumber", "phoneNumber", "Vui lòng nhập ngày sinh cho nhân viên");
		}
		if (staff.getCmnd().trim().length() == 0) {
			errors.rejectValue("cmnd", "cmnd", "Vui Lòng nhập chứng minh nhân dân.");
		}
		if (staff.getAccountStaff().getUsername().trim().length() == 0) {
			errors.rejectValue("accountStaff.email", "accountStaff.email", "Vui Lòng nhập tài khoản.");
		}
		if (staff.getAccountStaff().getPassword().trim().length() == 0) {
			errors.rejectValue("accountStaff.password", "accountStaff.password", "Vui Lòng nhập mật khẩu.");
		}
		if (staff.getAccountStaff().getPassword().trim().length() == 0) {
			errors.rejectValue("accountStaff.email", "accountStaff.email", "Vui Lòng nhập email.");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
		} else {
			Session session = factory.getCurrentSession();

			if (session.get(Account.class, staff.getAccountStaff().getUsername()) != null)
			{
				model.addAttribute("message","Tên tài khoản đã tồn tại");
				return "admin/nhanvien/insert";
			}
			else 
			{
				String hql = "From Account where email= '"+staff.getAccountStaff().getEmail()+"'";
				Query query = session.createQuery(hql);
				if (!query.list().isEmpty())
				{
					model.addAttribute("message","Email đăng ký đã được đăng ký.");
					return "admin/nhanvien/insert";
				}
			}
			
			Role role = getRole(staff.getAccountStaff().getRole().getId());
			Branch branch = getBranch(staff.getBranch().getId());
			Account account = new Account(staff.getAccountStaff().getUsername(), staff.getAccountStaff().getPassword(), staff.getAccountStaff().getEmail(), role, true);
			Staff newStaff = new Staff(staff.getFirstName(), staff.getName(), staff.getCmnd(), staff.getAddress(), staff.getPhoneNumber(), branch, staff.getStatus(), staff.getSex());
			
			account.setStaff(newStaff);
			newStaff.setAccountStaff(account);
			newStaff.setBirthday(staff.getBirthday());

			
			session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.save(account);
				session.save(newStaff);
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
		}	
		return "admin/nhanvien/insert";
	}
	
	@RequestMapping(value="update/{maNV}",method=RequestMethod.GET)
	public String update(ModelMap model,@PathVariable("maNV") String id)
	{
		Session session = factory.getCurrentSession();
		Staff staff = (Staff) session.get(Staff.class, id);
		model.addAttribute("id", id);
		model.addAttribute("staff", staff);
		return "admin/nhanvien/update";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(ModelMap model,@ModelAttribute("staff")Staff staff,BindingResult errors)
	{
		if (staff.getName().trim().length() == 0) {
			errors.rejectValue("name", "name", "Vui lòng nhập tên nhân viên");
		}
		if (staff.getFirstName().trim().length() == 0) {
			errors.rejectValue("firstName", "firstName", "Vui lòng nhập họ nhân viên");
		}
		if (staff.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "address", "Vui lòng nhập địa chỉ nhân viên");
		}
		if (staff.getPhoneNumber().trim().length() == 0) {
			errors.rejectValue("phoneNumber", "phoneNumber", "Vui lòng nhập số điện thoại nhân viên");
		}
		if (staff.getBirthday() == null)
		{
			errors.rejectValue("phoneNumber", "phoneNumber", "Vui lòng nhập ngày sinh cho nhân viên");
		}
		if (staff.getCmnd().trim().length() == 0) {
			errors.rejectValue("cmnd", "cmnd", "Vui Lòng nhập chứng minh nhân dân.");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
		} else {
			Session session = factory.getCurrentSession();
			Staff datStaff = (Staff) session.get(Staff.class, staff.getId());
			
			staff.setAccountStaff(datStaff.getAccountStaff());
			
			session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.update(staff);	
				t.commit();
				model.addAttribute("message","Cập Nhật Thành Công!");
			}
			catch (Exception e) {
				t.rollback();
				System.out.print(e);
				model.addAttribute("message",e.getMessage());
			}
			finally {
				session.close();
			}
		}	
		return "redirect:/admin/nhanvien/index.htm?page=1";
	}	
}
