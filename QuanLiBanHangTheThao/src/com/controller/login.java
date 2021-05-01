package com.controller;


import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

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
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.Account;
import com.entity.Guest;

import java.math.BigInteger;
import java.net.URI;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Transactional
@Controller
public class login {
	@Autowired
	SessionFactory factory;

	@Autowired
	Mailer mailer;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String gotoLogin(@ModelAttribute("Account") Account acc, HttpServletRequest request, HttpSession session, ModelMap model)
	{
		Account account = checkCookie(request);
		if (account == null)
			return "login";
		else
			return "redirect:/index.htm";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String gotoLogin2(ModelMap model,@ModelAttribute("Account") Account acc, HttpServletResponse response)
	{
		String user = acc.getUsername();
		String pass = acc.getPassword();
		
		Session session = factory.getCurrentSession();
		String hql = "From Account where username = '"+user+"'";
		Query query = session.createQuery(hql);
		List<Account> list = query.list();
		
		
		if (list.isEmpty())
		{
			model.addAttribute("Msg", "Tài khoản này không tồn tại!");
		}
		else
		{
			Account temp = null;
			temp = list.get(0);
			if (!temp.getActive())
			{
				model.addAttribute("Msg", "Tài khoản này đã bị khóa!");
			}
			else if (temp.getPassword().equals(encrypt(pass)))
			{
				Cookie cookieUser = new Cookie("username", user);
				cookieUser.setMaxAge(3600);
				response.addCookie(cookieUser);
				Cookie cookiePass = new Cookie("passwd", pass);
				cookiePass.setMaxAge(3600);
				response.addCookie(cookiePass);
				return "redirect:/index.htm";
			}
			else
			{
				model.addAttribute("Msg", "Sai mật khẩu!");
			}
		}
		return "login";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(@ModelAttribute("Account") Account acc, HttpSession session, HttpServletRequest request, HttpServletResponse response)
	{
		//remove session
		session.removeAttribute("username");
		//remove cookie
		for (Cookie cookie : request.getCookies())
		{
			if (cookie.getName().equalsIgnoreCase("username"))
			{
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			if (cookie.getName().equalsIgnoreCase("passwd"))
			{
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
		return "redirect:/login.htm";
	}
	
	@RequestMapping(value = "registry", method = RequestMethod.GET)
	public String gotoReg(@ModelAttribute("Account") Account acc)
	{
		return "registry";
	}
	
	@RequestMapping(value = "registry", method = RequestMethod.POST)
	public String reg(ModelMap model, HttpServletRequest request,@ModelAttribute("Account") Account acc)
	{
		String User = request.getParameter("username");
		String Firstname = request.getParameter("firstName");
		String Lastname = request.getParameter("lastname");
		String Email = request.getParameter("email");
		String Passwd = request.getParameter("password");
		String confirmPasswd = request.getParameter("confirmpassword");	
		String PhoneNumber = request.getParameter("phoneNumber");
		String date = request.getParameter("birthday");
		Date birthday = null;
		try {
			birthday = new SimpleDateFormat("yyyy-MM-dd").parse(date);

		} catch (Exception e) {
			// TODO: handle exception
		}
		Boolean sex = false;
		String sexName = request.getParameter("sex");
		if (sexName.equals("Male"))
		{
			sex = true;
		}
		else
			sex = false;
		
		Session session = factory.getCurrentSession();
		String hql = "From Account where username = '"+User+"'";
		Query query = session.createQuery(hql);
		List<Account> list = query.list();
		
		if (!list.isEmpty())
		{
			model.addAttribute("Msg", "Tài khoản này đã tồn tại!");
			return "registry";
		}
		
		hql = "From Account where email = '"+Email+"'";
		query = session.createQuery(hql);
		list = query.list();
		
		if (!list.isEmpty())
		{
			model.addAttribute("Msg", "Email này đã tồn tại!");
			return "registry";
		}
		
		if (!Passwd.equals(confirmPasswd))
		{
			model.addAttribute("Msg", "Mật khẩu không khớp!");
			return "registry";
		}
		Passwd = encrypt(Passwd);

		Account accountGuest = new Account(User, Passwd, Email, 0, true);
		Guest guest= new Guest(Firstname, Lastname, sex, birthday, PhoneNumber, accountGuest);
		
		session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(accountGuest);
			session.save(guest);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("Msg", "Thất bại!");
			return "registry";
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		
		return "redirect:/login.htm";
	}
	
	public Account checkCookie(HttpServletRequest request)
	{
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
	}
	
	public String encrypt(String input)
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
