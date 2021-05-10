package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.Account;
import com.entity.Role;

@Transactional
@Controller
@RequestMapping("/admin/taikhoan/")
public class TaiKhoanController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model, @ModelAttribute("Account") Account account) {
		Session session = factory.getCurrentSession();	
		String hql = "From Account";
		Query query = session.createQuery(hql);
		List<Account> list = query.list();
		model.addAttribute("listAccount", list);
		hql = "From Role";
		query = session.createQuery(hql);
		List<Role> listRole = query.list();
		model.addAttribute("role", listRole);
		return "admin/taikhoan/index";
	}
	
	@InitBinder
	public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
	    final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));    
	}
	
	@RequestMapping(value = "update/{username}", method = RequestMethod.POST)
	public String insert(ModelMap model ,@PathVariable("username") String username,@ModelAttribute("Account") Account account) {
		if (account == null)
			return "";
		return "redirect:/admin/taikhoan/index.htm";
	}
	
	@RequestMapping(value = "delete/{username}", method = RequestMethod.GET)
	public String delete(@PathVariable("username") String username)
	{
		Session session = factory.openSession();
		Account account = (Account) session.get(Account.class, username);
		Transaction transaction = session.beginTransaction();
		try {
			if (account.getRole().getId() == 0)			
				session.delete(account.getGuest());			
			else
				session.delete(account.getStaff());
			session.delete(account);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			System.out.print(e);
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		return "redirect:/admin/taikhoan/index.htm";
	}
}