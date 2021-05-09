package com.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.entity.Account;

@Transactional
public class DecentralizationInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	SessionFactory factory;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception
	{
		Account account = checkCookie(request);
		if (account == null)
		{
			response.sendError(403);
			return false;
		}
		
		Session session = factory.getCurrentSession();
		String hql = "From Account where username = '" + account.getUsername() + "'";
		Query query = session.createQuery(hql);
		account = (Account) query.list().get(0);
		
		if (account.getLevel() == 0)
		{
			response.sendError(403);
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
