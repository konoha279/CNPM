package com.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Account;
import com.entity.Guest;
import com.entity.Role;
import com.entity.Staff;

@Transactional
@Controller
@RequestMapping("/admin/taikhoan/")
public class TaiKhoanController {
	@Autowired
	SessionFactory factory;
	@Autowired
	Mailer mailer;
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
	public String update(ModelMap model ,@PathVariable("username") String username,@ModelAttribute("Account") Account account) {
		if (account == null)
			return "";
		return "redirect:/admin/taikhoan/index.htm";
	}
	
	@RequestMapping(value= "insert/kh", method = RequestMethod.POST)
	public @ResponseBody byte[] insert(HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String result = "something";
		Session session = factory.getCurrentSession();
		String username = request.getParameter("username");
		String passwd = request.getParameter("passwd");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");

		
		if (username.isEmpty())
			return "Vui lòng nhập tài khoản".getBytes("UTF-8");
		else if (passwd.isEmpty())
			return "Vui lòng nhập mật khẩu".getBytes("UTF-8");
		else if (email.isEmpty())
			return "Vui lòng nhập email".getBytes("UTF-8");
		else if (name.isEmpty())
			return "Vui lòng nhập tên".getBytes("UTF-8");
		else if (birthday.isEmpty())
			return "Vui lòng nhập ngày sinh".getBytes("UTF-8");
		
		
		if (session.get(Account.class, username) != null)
		{
			return "Tên tài khoản đã tồn tại".getBytes("UTF-8");
		}
		else 
		{
			String hql = "From Account where email= '"+email+"'";
			Query query = session.createQuery(hql);
			if (!query.list().isEmpty())
			{
				return "Email đăng ký đã được đăng ký.".getBytes("UTF-8");
			}
		}
		
		String firstName = request.getParameter("firstName");
		boolean sex =  Boolean.parseBoolean(request.getParameter("sex"));
		String phone = request.getParameter("phone");
		
		
		Role role = (Role) session.get(Role.class, request.getParameter("role"));

		Account account = new Account(username, encrypt(passwd), email, role, true);
		
		Guest guest = new Guest(firstName, name, sex, phone);
		guest.setBirthday(birthday);
		guest.setAccountGuest(account);
		
		account.setGuest(guest);
		account.setStaff(null);
		
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			session.save(account);
			session.save(guest);			
			transaction.commit();
			result = "Thêm thành công";
		} catch (Exception e) {
			// TODO: handle exception
			result = e.toString();
			transaction.rollback();
		}
		finally {
			session.close();
		}
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value= "insert/nv", method = RequestMethod.POST)
	public @ResponseBody byte[] insertNV(HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String result = "something";
		Session session = factory.getCurrentSession();
		String username = request.getParameter("username");
		String passwd = request.getParameter("passwd");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String workday = request.getParameter("workday");
		String cmnd = request.getParameter("cmnd");
		String address = request.getParameter("address");
		
		if (username.isEmpty())
			return "Vui lòng nhập tài khoản".getBytes("UTF-8");
		else if (passwd.isEmpty())
			return "Vui lòng nhập mật khẩu".getBytes("UTF-8");
		else if (email.isEmpty())
			return "Vui lòng nhập email của nhân viên.".getBytes("UTF-8");
		else if (name.isEmpty())
			return "Vui lòng nhập tên của nhân viên.".getBytes("UTF-8");
		else if (birthday.isEmpty())
			return "Vui lòng nhập ngày sinh của nhân viên.".getBytes("UTF-8");
		else if (workday.isEmpty())
			return "Vui lòng nhập ngày làm của nhân viên.".getBytes("UTF-8");
		else if (cmnd.isEmpty())
			return "Vui lòng nhập chứng minh nhân dân của nhân viên.".getBytes("UTF-8");
		
		if (session.get(Account.class, username) != null)
		{
			return "Tên tài khoản đã tồn tại".getBytes("UTF-8");
		}
		else 
		{
			String hql = "From Account where email= '"+email+"'";
			Query query = session.createQuery(hql);
			if (!query.list().isEmpty())
			{
				return "Email đăng ký đã được đăng ký.".getBytes("UTF-8");
			}
		}
		
		boolean status = Boolean.parseBoolean(request.getParameter("status"));
		
		String firstName = request.getParameter("firstName");
		boolean sex =  Boolean.parseBoolean(request.getParameter("sex"));
		String phone = request.getParameter("phone");
		
		Role role = (Role) session.get(Role.class, request.getParameter("role"));
		Account account = new Account(username, encrypt(passwd), email, role, true);
		Staff staff = new Staff(firstName, name, cmnd, address, phone, status, sex);
		staff.setBirthday_Str(birthday);
		staff.setWorkday_Str(workday);
		account.setGuest(null);
		account.setStaff(staff);
		staff.setAccountStaff(account);
		
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			session.save(account);
			session.save(staff);
			transaction.commit();
			result = "Thêm thành công";
		} catch (Exception e) {
			// TODO: handle exception
			result = e.toString();
			transaction.rollback();
		}
		finally {
			session.close();
		}
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "delete/{username}", method = RequestMethod.GET)
	public String delete(@PathVariable("username") String username, ModelMap model)
	{
		Session session = factory.openSession();
		Account account = (Account) session.get(Account.class, username);
		if (!account.getBills().isEmpty())
		{
			return "redirect:/404.htm";
		}
		else
		{
			Transaction transaction = session.beginTransaction();
			try {
				if (account.getRole().getId().equals("0"))			
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
		}	
		
		return "redirect:/admin/taikhoan/index.htm";
	}
	
	@RequestMapping(value = "unlock/{username}", method = RequestMethod.GET)
	public String unlock(@PathVariable("username") String username)
	{
		Session session = factory.getCurrentSession();
		Account account = (Account) session.get(Account.class, username);
		account.setActive(true);
		
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			session.update(account);
			transaction.commit();
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
		}
		finally {
			session.close();
		}
		return "redirect:/admin/taikhoan/index.htm";
	}
	
	@RequestMapping(value = "lock/{username}", method = RequestMethod.GET)
	public String lock(@PathVariable("username") String username)
	{
		Session session = factory.getCurrentSession();
		Account account = (Account) session.get(Account.class, username);
		account.setActive(false);
		
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			session.update(account);
			transaction.commit();
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
		}
		finally {
			session.close();
		}
		return "redirect:/admin/taikhoan/index.htm";
	}
	
	@RequestMapping(value= "changeEmail", method = RequestMethod.POST)
	public @ResponseBody byte[] changeEmail(HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String username = request.getParameter("username");
		String email = request.getParameter("email");

		Session session = factory.getCurrentSession();
		
		String hql = "From Account where email= '"+email+"'";
		Query query = session.createQuery(hql);
		if (!query.list().isEmpty())
		{
			return "Email này đã được đăng ký.".getBytes("UTF-8");
		}
		
		Account account = (Account) session.get(Account.class, username);
		account.setEmail(email);
		
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			session.update(account);
			transaction.commit();
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
		}
		finally {
			session.close();
		}
		mailer.send("n18dcat092@student.ptithcm.edu.vn", email, "Đổi email tài khoản", "Tài khoản của bạn đã được thay đổi email.");

		return "Thay đổi thành công.".getBytes("UTF-8");
	}
	
	String encrypt(String input)
    {
        try {
            // getInstance() method is called with algorithm SHA-1
            MessageDigest md = MessageDigest.getInstance("SHA-1");
  
            // digest() method is called
            // to calculate message digest of the input string
            // returned as array of byte
            byte[] messageDigest = md.digest(input.getBytes());
  
            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);
  
            // Convert message digest into hex value
            String hashtext = no.toString(16);
  
            // Add preceding 0s to make it 32 bit
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            // return the HashText
            return hashtext;
        }
  
        // For specifying wrong message digest algorithms
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}