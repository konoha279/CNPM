package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
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

import com.entity.Account;
import com.entity.Bill;
import com.entity.CTBill;

@Transactional
@Controller
@RequestMapping("/admin/donDatHang/")
public class DonDatHangController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	Mailer mailer;
	
	@ModelAttribute("listBill")
	public List<Bill> listBill()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Bill";
		Query query = session.createQuery(hql);
		List<Bill> list = query.list();
		return list;
	}
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		return "admin/donDatHang/index";
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model) {
		return "admin/donDatHang/insert";
	}
	
	@RequestMapping("detail")
	public String detail(ModelMap model) {
		return "admin/donDatHang/detail";
	}
	
	@RequestMapping("insertdetail")
	public String insertdetail(ModelMap model) {
		return "admin/donDatHang/insertdetail";
	}
	
	@RequestMapping(value = "confirm", method = RequestMethod.POST)
	public @ResponseBody byte[] confirm(HttpServletRequest request) throws UnsupportedEncodingException
	{
		String result = "";
		String id = request.getParameter("ID");
		Session session = factory.openSession();
		Bill tempBill = (Bill) session.get(Bill.class, id);
		Account account = (Account) session.get(Account.class, checkCookie(request).getUsername());
		tempBill.setStaff(account.getStaff());
		tempBill.setStatus(true);
		Account account2 = (Account) session.get(Account.class, tempBill.getAccount().getUsername());
		Transaction transaction = session.beginTransaction();
		try {
			session.update(tempBill);
			String content = "<!DOCTYPE html>\r\n"
					+ "<html>\r\n"
					+ "<head>\r\n"
					+ "	<style>\r\n"
					+ "table, td, th {\r\n"
					+ "  border: 1px solid black;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ "table {\r\n"
					+ "  font-family: Arial, Helvetica, sans-serif;\r\n"
					+ "  border-collapse: collapse;\r\n"
					+ "  width: 100%;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ "table, td, th {\r\n"
					+ "  border: 1px solid #ffcce6;\r\n"
					+ "  padding: 8px;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ "table tr:nth-child(even){background-color: #f2f2f2;}\r\n"
					+ "\r\n"
					+ "table tr:hover {background-color: #ffcce6;}\r\n"
					+ "\r\n"
					+ "table th {\r\n"
					+ "  padding-top: 12px;\r\n"
					+ "  padding-bottom: 12px;\r\n"
					+ "  text-align: left;\r\n"
					+ "  background-color: #ff1a8c;\r\n"
					+ "  color: white;\r\n"
					+ "}\r\n"
					+ "</style>\r\n"
					+ "</head>\r\n"
					+ "<body>\r\n"
					+ "<div style=\"border: 5px solid #ff6666;margin: 20px;padding: 20px; width: 1000px;\">\r\n"
					+ "		<h1 style=\"text-align: right;\">Xin chào, Phạm Minh Trí</h1>\r\n"
					+ "		<h3 style=\"text-align: center; font-size: 35px\">Đơn hàng của bạn đã được xác nhận</h3>\r\n"
					+ "		<p>	Cảm ơn bạn đã tin tưởng mua hàng. Hãy đợi một vài ngày bạn sẽ nhận được món đồ mong muốn mà bạn đã mua từ chúng tôi. </p>\r\n"
					+ "		\r\n"
					+ "		<h2>Chi tiết: </h2>\r\n"
					+ "		<div>\r\n"
					+ "			<table class=\"table table-striped table-bordered\" style=\"width: 100%;\">	\r\n"
					+ "			<colgroup>\r\n"
					+ "				<col span=\"1\" style=\"width: 30%\">\r\n"
					+ "				<col span=\"1\" style=\"width: 15%\">\r\n"
					+ "				<col span=\"1\" style=\"width: 15%\">\r\n"
					+ "				<col span=\"1\" style=\"width: 10%\">\r\n"
					+ "				<col span=\"1\" style=\"width: 15%\">\r\n"
					+ "				<col span=\"1\" style=\"width: 15%\">\r\n"
					+ "			</colgroup>												\r\n"
					+ "				<thead>\r\n"
					+ "					<tr>\r\n"
					+ "						<th>Tên sản phẩm</th>\r\n"
					+ "						<th>Kích thước</th>\r\n"
					+ "						<th>Đơn giá</th>\r\n"
					+ "						<th>Số lượng</th>\r\n"
					+ "						<th>Khuyến mãi</th>\r\n"
					+ "						<th>Thành tiền </th>\r\n"
					+ "					</tr>													\r\n"
					+ "				</thead>			\r\n"
					+ "				<tbody>\r\n";
			double allMoney = 0;
			List<CTBill> bills = new ArrayList<>(tempBill.getCtBills());
			for (int i=0; i< bills.size();i++)
			{
				content+= "					<tr>\r\n"
						+ "						<td>"+ bills.get(i).getcTHangHoa().getMaHangHoa().getName() +"</td>\r\n"
						+ "						<td>"+ (bills.get(i).getcTHangHoa().getSize().getId().equals("5") == false ? bills.get(i).getcTHangHoa().getSize().getName() : "" ) +"</td>\r\n"
						+ "						<td>"+ bills.get(i).getUnitPrice() +"đ</td>\r\n"
						+ "						<td>"+ bills.get(i).getCount() +"</td>\r\n"
						+ "						<td>"+ bills.get(i).getPromotion() +"%</td>\r\n"
						+ "						<td>"+ bills.get(i).intoMoney() +"đ</td>\r\n"
						+ "					</tr>\r\n"
						+ "\r\n";
				allMoney += bills.get(i).intoMoney();
			}
			content+= "					<tr>\r\n"
					+ "						<td><b>Tổng tiền</b></td>\r\n"
					+ "						<td></td>\r\n"
					+ "						<td></td>\r\n"
					+ "						<td></td>\r\n"
					+ "						<td></td>\r\n"
					+ "						<td><b>"+allMoney+"đ</b></td>\r\n"
					+ "					</tr>"
					+ "				</tbody>\r\n"
					+ "			</table>\r\n"
					+ "		</div>\r\n"
					+ "		<p style=\"font-size: 18px;  font-family: 'Times New Roman'\">Nếu có gì đó sai sót hoặc nhầm lẫn hãy báo với chúng tôi bằng cách trả lời mail này. </p>\r\n"
					+ "	</div>"
					+ "</body>\r\n"
					+ "</html>";
			mailer.send("n18dcat092@student.ptithcm.edu.vn", account2.getEmail(), "Xác nhận đơn hàng", content);
			transaction.commit();
			result = "Xác nhận đơn đặt hàng thành công.";
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
			result = "Xác nhận đơn đặt hàng thất bại.";
		}
		finally {
			session.close();
		}
		
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "deleteBill", method = RequestMethod.POST)
	public @ResponseBody byte[] deleteBill(HttpServletRequest request) throws UnsupportedEncodingException
	{
		String result = "";
		String id = request.getParameter("ID");
		Session session = factory.openSession();
		Bill tempBill = (Bill) session.get(Bill.class, id);
		if(tempBill.isStatus())
		{
			return "Đừng cố thử những thứ vô nghĩa ☺.".getBytes("UTF-8");
		}
		String email = tempBill.getAccount().getEmail();

		String content = "<!DOCTYPE html>\r\n"
				+ "<html>\r\n"
				+ "<head>\r\n"
				+ "	<style>\r\n"
				+ "table, td, th {\r\n"
				+ "  border: 1px solid black;\r\n"
				+ "}\r\n"
				+ "\r\n"
				+ "table {\r\n"
				+ "  font-family: Arial, Helvetica, sans-serif;\r\n"
				+ "  border-collapse: collapse;\r\n"
				+ "  width: 100%;\r\n"
				+ "}\r\n"
				+ "\r\n"
				+ "table, td, th {\r\n"
				+ "  border: 1px solid #ffcce6;\r\n"
				+ "  padding: 8px;\r\n"
				+ "}\r\n"
				+ "\r\n"
				+ "table tr:nth-child(even){background-color: #f2f2f2;}\r\n"
				+ "\r\n"
				+ "table tr:hover {background-color: #ffcce6;}\r\n"
				+ "\r\n"
				+ "table th {\r\n"
				+ "  padding-top: 12px;\r\n"
				+ "  padding-bottom: 12px;\r\n"
				+ "  text-align: left;\r\n"
				+ "  background-color: #ff1a8c;\r\n"
				+ "  color: white;\r\n"
				+ "}\r\n"
				+ "</style>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "<div style=\"border: 5px solid #ff6666;margin: 20px;padding: 20px; width: 1000px;\">\r\n"
				+ "		<h1 style=\"text-align: right;\">Xin chào, Phạm Minh Trí</h1>\r\n"
				+ "		<h3 style=\"text-align: center; font-size: 35px\">Đơn hàng của bạn đã hủy</h3>\r\n"
				+ "		<p>	Cảm ơn bạn đã tin tưởng mua hàng. Nhưng rất tiếc đơn hàng của bạn đã bị hủy. </p>\r\n"
				+ "		\r\n"
				+ "		<h2>Chi tiết: </h2>\r\n"
				+ "		<div>\r\n"
				+ "			<table class=\"table table-striped table-bordered\" style=\"width: 100%;\">	\r\n"
				+ "			<colgroup>\r\n"
				+ "				<col span=\"1\" style=\"width: 30%\">\r\n"
				+ "				<col span=\"1\" style=\"width: 15%\">\r\n"
				+ "				<col span=\"1\" style=\"width: 15%\">\r\n"
				+ "				<col span=\"1\" style=\"width: 10%\">\r\n"
				+ "				<col span=\"1\" style=\"width: 15%\">\r\n"
				+ "				<col span=\"1\" style=\"width: 15%\">\r\n"
				+ "			</colgroup>												\r\n"
				+ "				<thead>\r\n"
				+ "					<tr>\r\n"
				+ "						<th>Tên sản phẩm</th>\r\n"
				+ "						<th>Kích thước</th>\r\n"
				+ "						<th>Đơn giá</th>\r\n"
				+ "						<th>Số lượng</th>\r\n"
				+ "						<th>Khuyến mãi</th>\r\n"
				+ "						<th>Thành tiền </th>\r\n"
				+ "					</tr>													\r\n"
				+ "				</thead>			\r\n"
				+ "				<tbody>\r\n";
		double allMoney = 0;
		List<CTBill> bills = new ArrayList<>(tempBill.getCtBills());
		for (int i=0; i< bills.size();i++)
		{
			content+= "					<tr>\r\n"
					+ "						<td>"+ bills.get(i).getcTHangHoa().getMaHangHoa().getName() +"</td>\r\n"
					+ "						<td>"+ (bills.get(i).getcTHangHoa().getSize().getId().equals("5") == false ? bills.get(i).getcTHangHoa().getSize().getName() : "" ) +"</td>\r\n"
					+ "						<td>"+ bills.get(i).getUnitPrice() +"đ</td>\r\n"
					+ "						<td>"+ bills.get(i).getCount() +"</td>\r\n"
					+ "						<td>"+ bills.get(i).getPromotion() +"%</td>\r\n"
					+ "						<td>"+ bills.get(i).intoMoney() +"đ</td>\r\n"
					+ "					</tr>\r\n"
					+ "\r\n";
			allMoney += bills.get(i).intoMoney();
		}
		content+= "					<tr>\r\n"
				+ "						<td><b>Tổng tiền</b></td>\r\n"
				+ "						<td></td>\r\n"
				+ "						<td></td>\r\n"
				+ "						<td></td>\r\n"
				+ "						<td></td>\r\n"
				+ "						<td><b>"+allMoney+"đ</b></td>\r\n"
				+ "					</tr>"
				+ "				</tbody>\r\n"
				+ "			</table>\r\n"
				+ "		</div>\r\n"
				+ "		<p style=\"font-size: 18px;  font-family: 'Times New Roman'\">Nếu có gì đó sai sót hoặc nhầm lẫn hãy báo với chúng tôi bằng cách trả lời mail này. </p>\r\n"
				+ "	</div>"
				+ "</body>\r\n"
				+ "</html>";
		mailer.send("n18dcat092@student.ptithcm.edu.vn", email, "Hủy đơn hàng", content);
		
		Transaction transaction = session.beginTransaction();
		try {
			for (CTBill ctBill : bills) {
				session.delete(ctBill);
			}
			session.delete(tempBill);
			
			transaction.commit();
			result = "Xóa đơn đặt hàng thành công.";
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
			result = "Xóa đơn đặt hàng thất bại.";
		}
		finally {
			session.close();
		}
		return result.getBytes("UTF-8");
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
