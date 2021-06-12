package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Qualifier;

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
import com.entity.*;

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
				continue;
			}
			if (!bills.get(i).isStatus())
			{
				bills.remove(i);
				i--;
				continue;
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
			ArrayList<Integer> moneys = new ArrayList<>();
			moneys.add(temp);
			objectReports.add(new ObjectReport(dateStr, moneys));
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
	public String doanhthu(ModelMap model,@RequestParam( value = "tuNgay" ,defaultValue = "") String from,
			@RequestParam( value = "toiNgay",defaultValue = "") String to) {
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
		LocalDateTime now = LocalDateTime.now();  
		if(to.isEmpty() || to == null) {
		    
		    to = dtf.format(now);  
		}
		if(from.isEmpty() || from == null) {
		    now = now.minusMonths(1);
		    from = dtf.format(now);  
		}
		
		List<Bill> bills = getBills_byDate(from, to);
		List<ObjectReport> objectReports = new ArrayList<ObjectReport>();
		List<Bill> reportBills = new ArrayList<Bill>();
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
		int tmp_money = 0, total_proudct =0;
		String date = dateFormat.format(bills.get(0).getDate()) ;
		int id=0;
		for(Bill b : bills) {
			if (!b.isStatus())
			{
				bills.remove(b);
				continue;
			}
			String tmpDate = dateFormat.format(b.getDate());
			if (!tmpDate.equals(date) || b.equals(bills.get(bills.size() -1)))
			{
				ArrayList<Integer> integersCount = new ArrayList<>();
				integersCount.add(total_proudct);
				integersCount.add(tmp_money);
				ObjectReport report = new ObjectReport(id, tmpDate, integersCount, reportBills);
				objectReports.add(report);
				
				id++;
				
				reportBills = new ArrayList<Bill>();
				reportBills.add(b);
				
				date = tmpDate;
				tmp_money = b.getMoneyProduct();
				total_proudct = 0;
				for(CTBill ct : b.getCtBills()) {
					total_proudct += ct.getCount();
				}
			}
			else
			{
				reportBills.add(b);
				tmp_money += b.getMoneyProduct();
				for(CTBill ct : b.getCtBills()) {
					total_proudct += ct.getCount();
				}
			}
		}
		
		model.addAttribute("objectReports", objectReports);
		model.addAttribute("tuNgay",from);
		model.addAttribute("toiNgay",to);
		
		return "admin/doanhso";
	}
	
	@RequestMapping(value="summary-employees",method = RequestMethod.GET)
	public String summaryEmployees(ModelMap model)
	{
		
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
	    LocalDateTime now = LocalDateTime.now();  
	    String to = dtf.format(now);
	    now = now.minusMonths(1);
	    String from = dtf.format(now);  
	    
		
		List<Bill> bills = getBills_byDate(from, to);
		
		List<SummaryNv> summaryNVList = new ArrayList();
		
		
		for(Bill bill : bills) {

			int totalProducts = 0;
			long totalMoney = bill.getMoneyProduct();
			for(CTBill b : bill.getCtBills()) {
				totalProducts += b.getCount();
			}
			
			int exist_employ_index = SummaryNv.isExist(summaryNVList, bill.getStaff().getId());
			System.out.println("id: " +bill.getStaff().getId());
			System.out.println(exist_employ_index);
			if(exist_employ_index == -1) {
				SummaryNv nv = new SummaryNv(totalProducts,totalMoney,bill.getStaff().getFirstName() + " " + bill.getStaff().getName(),bill.getStaff().getId());
				summaryNVList.add(nv);
			}
			else {
				summaryNVList.get(exist_employ_index).setTotalMoney(summaryNVList.get(exist_employ_index).getTotalMoney() + totalMoney);
				summaryNVList.get(exist_employ_index).setTotalProducts(summaryNVList.get(exist_employ_index).getTotalProducts() + totalProducts);
				
			}
			
		}
		
		model.addAttribute("summary", summaryNVList);
		

		return "admin/summary-nv";
	}
	
	
	//////////////////////////////
	
	private List<Bill> getBills_byDate(String from, String to){

		SimpleDateFormat formatter1 = new  SimpleDateFormat("yyyy-MM-dd");  
		
		Date fromDate; 
		Date toDate;
		try {
			fromDate = formatter1.parse(from);  
			toDate = formatter1.parse(to);  
		}
		catch(Exception e) {
			return new ArrayList<Bill>();
		}
		
		
		Session session = factory.getCurrentSession();
		String hql = "From Bill b where b.date >= :from and b.date <= :to ";
		Query query = session.createQuery(hql);
		
		query.setDate("from", fromDate);
		query.setDate("to", toDate);
		
		List<Bill> bills = query.list();
		
		return bills;
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
