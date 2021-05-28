package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.ObjectReport;
import com.entity.Bill;
import com.entity.Comment;
import com.entity.Product;

@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	SessionFactory factory;
	
	@ModelAttribute("billReport")//thống kê năm nay
	public List<ObjectReport> list(HttpServletRequest request)
	{
		List<ObjectReport> objectReports = new ArrayList<ObjectReport>();
		
		Session session = factory.getCurrentSession();
		String hql = "From Bill";
		Query query = session.createQuery(hql);
		List<Bill> bills = query.list();
		
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int yearNow = calendar.get(Calendar.YEAR);
		int i = 0;
		
		//loại bỏ những hóa đơn không có trong năm nay
		for ( ; i< bills.size();i++)
		{
			calendar.setTime(bills.get(i).getDate());
			if (calendar.get(Calendar.YEAR) != yearNow)
			{
				bills.remove(i);
				i--;
			}
		}
		
		//tính từng tháng
		for (i = 1; i <= 12; i++ )
		{
			int temp = 0;
			for (Bill bill : bills) {
				calendar.setTime(bill.getDate());
				int month = calendar.get(Calendar.MONTH) + 1;
				if (month == i)
				{
					temp += bill.getMoneyProduct();
				}
			}
			String dateStr = i + "/" + yearNow;
			objectReports.add(new ObjectReport(dateStr, temp));
		}
		return objectReports;
	}
	
	@RequestMapping("admin")
	public String admin(ModelMap model) {
		long countBillUnconf = 0,revenue = 0; // số đơn hàng chưa xác nhận
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int monthNow = cal.get(Calendar.MONTH);
		
		Session session = factory.getCurrentSession();
		String hql = "From Bill";
		Query query = session.createQuery(hql);
		List<Bill> lBills = query.list();
		
		for (Bill bill : lBills) {
			Calendar calBill = Calendar.getInstance();
			calBill.setTime(bill.getDate());
			if (calBill.get(Calendar.MONTH) == monthNow)
			{
				
				if (bill.isStatus()) {
					revenue += bill.getMoneyProduct();
				}
			}
			if (!bill.isStatus())
				countBillUnconf++;
		}
		model.addAttribute("countBill", lBills.size());
		model.addAttribute("countBillUnconf", countBillUnconf);
		model.addAttribute("revenue", revenue);
		
		hql = "From Product";
		query = session.createQuery(hql);
		List<Product> listProducts = query.list();
		model.addAttribute("countProduct",listProducts.size());
		
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
	
//	-------------------------------------------------	comment	-----------------------------------------------
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
