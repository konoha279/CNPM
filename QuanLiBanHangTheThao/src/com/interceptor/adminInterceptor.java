package com.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.entity.Account;

@Transactional
public class adminInterceptor extends HandlerInterceptorAdapter { //Phân quyền nhân viên và quản lí

	@Autowired
	SessionFactory factory;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception
	{
		Account account = checkCookie(request);
		if (account == null)
		{
			response.sendError(404);
			return false;
		}
		else
		{
			Session session = factory.getCurrentSession();			
			account = (Account) session.get(Account.class, account.getUsername());
			if (account.getRole().getId().equals("2"))
			{
				response.sendError(403);
				return false;
			}
		}
		return true;					
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
