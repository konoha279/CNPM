package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Comment;

@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("admin")
	public String admin(ModelMap model) {
		return "admin/admin";
	}
	
	@RequestMapping("doanhso")
	public String doanhthu(ModelMap model) {
		return "admin/doanhso";
	}
	
	@ModelAttribute("ListComment")
	public List<Comment> listComment(ModelMap model)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Comment";
		Query query = session.createQuery(hql);
		List<Comment> list = query.list();
		return list;
	}

	@RequestMapping(value="comment",method = RequestMethod.GET)
	public String index()
	{
		return "admin/comment";
	}
	
	@RequestMapping(value = "comment/edit", method = RequestMethod.POST)
	public @ResponseBody byte[] editComment(HttpServletRequest request) throws UnsupportedEncodingException
	{
		String result = "";
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		
		Session session = factory.getCurrentSession();
		Comment comment = (Comment) session.get(Comment.class, id);
		Comment newCmt = comment;
		newCmt.setContent(content);
		
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			session.update(newCmt);
			transaction.commit();
			result = "Sửa thành công.";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
			transaction.rollback();
			result = String.valueOf(e);
			
		}
		finally {
			session.close();
		}
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "comment/delete", method = RequestMethod.POST)
	public @ResponseBody byte[] delComment(HttpServletRequest request) throws UnsupportedEncodingException
	{
		String result = "";
		String id = request.getParameter("id");
		
		Comment comment = new Comment();
		comment.setId(id);
		
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			session.delete(comment);
			transaction.commit();
			result = "Xóa thành công.";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
			transaction.rollback();
			result = String.valueOf(e);
			
		}
		finally {
			session.close();
		}
		return result.getBytes("UTF-8");
	}
}
