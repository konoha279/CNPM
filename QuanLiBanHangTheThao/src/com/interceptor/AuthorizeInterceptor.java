package com.interceptor;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.entity.Account;
import com.entity.Guest;

@Transactional
public class AuthorizeInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	SessionFactory factory;
	private Guest guest = null;
	
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
			String hql = "From Guest guest where guest.accountGuest.username = '" + account.getUsername() + "'";
			Query query = session.createQuery(hql);
			List<Guest> list = query.list();
			if (!list.isEmpty())
			{
				guest = list.get(0);
				request.setAttribute("guest", guest);
			}
			request.setAttribute("account", account);

			return true;
		}
					
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
}
