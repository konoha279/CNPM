package com.controller;


import java.util.Random;

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

import com.entity.Account;
import com.entity.Guest;
import com.entity.Role;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Transactional
@Controller
public class LoginController {
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
	
	@RequestMapping("forgot")
	public String forgot(HttpServletRequest request)
	{
		Account account = checkCookie(request);
		if (account == null)
			return "forgot";
		else
			return "redirect:/index.htm";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String gotoLogin2(ModelMap model,@ModelAttribute("Account") Account acc, HttpServletResponse response)
	{		
		Session session = factory.getCurrentSession();
		String hql = "From Account where username = '"+acc.getUsername()+"'";
		Query query = session.createQuery(hql);		
		
		if (query.list().isEmpty())
		{
			model.addAttribute("Msg", "Tài khoản này không tồn tại!");
		}
		else
		{
			Account temp = null;
			temp = (Account) query.list().get(0);
			if (!temp.getActive())
			{
				model.addAttribute("Msg", "Tài khoản này đã bị khóa!");
			}
			else if (temp.getPassword().equals(encrypt(acc.getPassword())))
			{
				Cookie cookieUser = new Cookie("username", acc.getUsername());
				cookieUser.setMaxAge(86400);
				response.addCookie(cookieUser);
				Cookie cookiePass = new Cookie("passwd", encrypt(acc.getPassword()));
				cookiePass.setMaxAge(86400);
				response.addCookie(cookiePass);
				if (temp.getRole().getId().equals("0"))
					return "redirect:/index.htm";
				else
					return "redirect:/admin/admin.htm";
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
		
		if (!query.list().isEmpty())
		{
			model.addAttribute("Msg", "Tài khoản này đã tồn tại!");
			return "registry";
		}
		
		hql = "From Account where email = '"+Email+"'";
		query = session.createQuery(hql);
		
		if (!query.list().isEmpty())
		{
			model.addAttribute("Msg", "Email này đã tồn tại!");
			return "registry";
		}
		
		if (!Passwd.equals(confirmPasswd))
		{
			model.addAttribute("Msg", "Mật khẩu không khớp!");
			return "registry";
		}
		Role role = (Role) session.get(Role.class, 0);
		Account accountGuest = new Account(User, Passwd, Email, role, true);
		accountGuest.setPassword(encrypt(accountGuest.getPassword()));
		
		Guest guest= new Guest(Firstname, Lastname, sex, date, PhoneNumber, accountGuest);
		
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
	
	
	@RequestMapping(value = "forgot" , method = RequestMethod.POST)
	public String forgot2(ModelMap model, HttpServletRequest request)
	{		
		String email = request.getParameter("email-forgot");
		Session session = factory.getCurrentSession();
		String hql = "From Account where email = '"+email+"'";
		Query query = session.createQuery(hql);
		
		if (query.list().isEmpty())
		{
			model.addAttribute("Msg", "Mail này không tồn tại hoặc chưa đăng ký.");
			return "forgot";
		}
		Account account = (Account) query.list().get(0);
		String newPasswd = getRandomPassword();
		String content = "<h1 style =\"font-size: 48px;\">Đừng quên nữa nhé</h1>"
				+ "<p style =\"font-size: 24px; font-family: \'Courier New\'\">Tài khoản của bạn là: <b style = \"color: red\">"+account.getUsername()+"</b>" + "<br>"
				+ "Mật khẩu của bạn là: <b style = \"color: red\">" +newPasswd+ "</b></p>";
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			Account account2 = new Account(account.getUsername(), account.getPassword(), account.getEmail(), account.getRole(), account.getActive());
			account2.setPassword(encrypt(newPasswd));
			session.update(account2);
			transaction.commit();
			mailer.send("n18dcat092@student.ptithcm.edu.vn", email, "Reset password", content);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			transaction.rollback();
			model.addAttribute("Msg", "Có lỗi xảy ra ở server!");
			return "forgot";
		}
		finally
		{
			session.close();
		}
		
		return "redirect:/login.htm";
	}
  
	public String getRandomPassword()
	{
		String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		String passwd = new String();
		Random rand = new Random();
		int n = rand.nextInt();
		if (n < 0)
			n *= -1;
		n %= 30;
		if (n <= 15)
			n += 15;
		while(n >= 0)
		{
			passwd += alphabet.charAt(rand.nextInt(alphabet.length()));
			n--;
		}
		return passwd;
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
