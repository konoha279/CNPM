package com.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.entity.Account;
import com.entity.Bill;

@Transactional
public class BaseInterceptor extends HandlerInterceptorAdapter { //Dùng cho việc kiểm tra login
	@Autowired
	SessionFactory factory;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception
	{
		Account account = checkCookie(request);
		if (account == null)
		{
			response.sendRedirect(request.getContextPath() + "/login.htm");
			return false;
		}
		else
		{
			Session session = factory.getCurrentSession();			
			account = (Account) session.get(Account.class, account.getUsername());

			if (account != null)
			{
				if (account.getRole().getId().equals("0"))
					request.setAttribute("guest", account.getGuest());
				else
					request.setAttribute("staff", account.getStaff());
			}
			request.setAttribute("account", account);
			List<Bill> bills = new ArrayList<>(account.getBills());
			request.setAttribute("bills", bills);
			return true;
		}
					
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
