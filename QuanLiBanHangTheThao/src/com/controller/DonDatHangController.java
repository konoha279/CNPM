package com.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Cart;
import com.entity.Account;
import com.entity.Bill;
import com.entity.CTBill;
import com.entity.CTHangHoa;
import com.entity.Guest;
import com.entity.Product;
import com.entity.Staff;
import com.pdfcrowd.Pdfcrowd;

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
		String hql = "From Guest";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Guest> list = query.list();
		model.addAttribute("listGuest", list);
		hql = "From Product";
		query = session.createQuery(hql);
		List<Product> list2 = query.list();
		model.addAttribute("listProduct", list2);
		
		return "admin/donDatHang/index";
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model) {
		return "admin/donDatHang/insert";
	}
	
	
	@RequestMapping("insertdetail")
	public String insertdetail(ModelMap model) {
		return "admin/donDatHang/insertdetail";
	}
	
	@ModelAttribute("listCreateCart")
	public List<Cart> cartItems(HttpSession httpSession)
	{
		List<Cart> cartItems = (List<Cart>) httpSession.getAttribute("listCreateCart");
		if (cartItems == null)
			cartItems = new ArrayList<Cart>();
		httpSession.setAttribute("listCreateCart", cartItems);
		return cartItems;
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
			String fullName ="";
			if (tempBill.getAccount().getStaff() == null)
			{
				fullName = tempBill.getAccount().getGuest().getFullname();
			}
			else 
				fullName = tempBill.getAccount().getStaff().getFullName();
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
					+ "		<h1 style=\"text-align: right;\">Xin chào, "+ fullName +"</h1>\r\n"
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
//			List<CTBill> bills = new ArrayList<>(tempBill.getCtBills());
//			bills = (List<CTBill>) new HashSet<CTBill>(bills);
			List<CTBill> bills = new ArrayList<>(tempBill.getCtBills());
			HashSet<CTBill> hashSet = new HashSet<CTBill>(bills);
			bills = new ArrayList<CTBill>(hashSet);
			for (int i=0; i< bills.size();i++)
			{
				content+= "					<tr>\r\n"
						+ "						<td>"+ bills.get(i).getcTHangHoa().getMaHangHoa().getName() +"</td>\r\n"
						+ "						<td>"+ (bills.get(i).getcTHangHoa().getSize().getId().equals("5") == false ? bills.get(i).getcTHangHoa().getSize().getName() : "" ) +"</td>\r\n"
						+ "						<td>"+ convertToMoney(bills.get(i).getUnitPrice()) +"</td>\r\n"
						+ "						<td>"+ bills.get(i).getCount() +"</td>\r\n"
						+ "						<td>"+ bills.get(i).getPromotion() +"%</td>\r\n"
						+ "						<td>"+ convertToMoney(bills.get(i).intoMoney()) +"</td>\r\n"
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
					+ "						<td><b>"+convertToMoney(allMoney)+"</b></td>\r\n"
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
		String fullName = "";
		if (tempBill.getAccount().getStaff() == null)
		{
			fullName = tempBill.getAccount().getGuest().getFullname();
		}
		else 
			fullName = tempBill.getAccount().getStaff().getFullName();
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
				+ "		<h1 style=\"text-align: right;\">Xin chào, "+fullName+"</h1>\r\n"
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
//		List<CTBill> bills = new ArrayList<>(tempBill.getCtBills());
//		bills = (List<CTBill>) new HashSet<CTBill>(bills);
		List<CTBill> bills = new ArrayList<>(tempBill.getCtBills());
		HashSet<CTBill> hashSet = new HashSet<CTBill>(bills);
		bills = new ArrayList<CTBill>(hashSet);
		for (int i=0; i< bills.size();i++)
		{
			content+= "					<tr>\r\n"
					+ "						<td>"+ bills.get(i).getcTHangHoa().getMaHangHoa().getName() +"</td>\r\n"
					+ "						<td>"+ (bills.get(i).getcTHangHoa().getSize().getId().equals("5") == false ? bills.get(i).getcTHangHoa().getSize().getName() : "" ) +"</td>\r\n"
					+ "						<td>"+ convertToMoney(bills.get(i).getUnitPrice()) +"</td>\r\n"
					+ "						<td>"+ bills.get(i).getCount() +"</td>\r\n"
					+ "						<td>"+ bills.get(i).getPromotion() +"%</td>\r\n"
					+ "						<td>"+ convertToMoney(bills.get(i).intoMoney()) +"</td>\r\n"
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
				+ "						<td><b>"+convertToMoney(allMoney)+"</b></td>\r\n"
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
				CTHangHoa ctHangHoa = new CTHangHoa();
				ctHangHoa = ctBill.getcTHangHoa();
				ctHangHoa.setSoLuong(ctHangHoa.getSoLuong() + ctBill.getCount());
				session.update(ctHangHoa);
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
	
	// ---------------------------------------------------------------------------------------------------- Tạo đơn hàng trong admin ----------------------------------------------------------------------------------------------------

	String convertToMoney(float money)
	{
		String moneyStr= "";
		boolean check = true;
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		moneyStr = String.valueOf(formatter.format(money)) + " ₫";
		return moneyStr;
	}
	
	String convertToMoney(double money)
	{
		String moneyStr= "";
		boolean check = true;
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		moneyStr = String.valueOf(formatter.format(money)) + " ₫";
		return moneyStr;
	}

	@RequestMapping(value = "addCart", method = RequestMethod.POST)
	public @ResponseBody byte[] addToCart(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws UnsupportedEncodingException
	{
		String result ="";
		List<Cart> cartItems = (List<Cart>) httpSession.getAttribute("listCreateCart");
		if (cartItems == null)
			cartItems = new ArrayList<Cart>();
		Session session = factory.getCurrentSession();
		String size = request.getParameter("size");
		String id = request.getParameter("id");
		int Count = Integer.valueOf(request.getParameter("count"));
		if (Count != 0)
		{
			if (size.isEmpty())
				size = "5";
			
			for (Cart cart : cartItems) {
				if (cart.getProduct().getMaHangHoa().getId().equals(id) && cart.getProduct().getSize().getId().equals(size))
				{
					if ((cart.getCount() + Count) <= cart.getProduct().getSoLuong())
						cart.setCount(cart.getCount() + Count);
					for (Cart cart2 : cartItems) {
						result += "								<tr>\r\n"
								+ "									<td>" +cart2.getProduct().getMaHangHoa().getId() +"</td>\r\n"
								+ "									<td>" +cart2.getProduct().getMaHangHoa().getName()+ "</td>\r\n"
								+ "									<td>"+cart2.getProduct().getSize().getName()+"</td>\r\n"
								+ "									<td>\r\n"
								+ "										<input onchange=\"editcount('"+ cart2.getProduct().getMaHangHoa().getId()+"','"+ cart2.getProduct().getSize().getId() +"','"+cart2.getProduct().getMaHangHoa().getMoney()+"')\" class=\"btn\" max=\""+cart2.getProduct().getSoLuong() +"\" id=\"quantity"+cart2.getProduct().getMaHangHoa().getId()+cart2.getProduct().getSize().getId()+"\" type=\"number\" min=\"0\" value=\""+cart2.getCount()+"\" />\r\n"
								+ "									</td>\r\n"
								+ "									<td id =\"money-"+cart2.getProduct().getMaHangHoa().getId()+"-"+cart2.getProduct().getSize().getId()+"\">"+ convertToMoney(cart2.getProduct().getMaHangHoa().getMoney() * cart2.getCount()) +" </td>\r\n"
								+ "									<td>\r\n"
								+ "										<button onclick=\"remove('"+cart2.getProduct().getMaHangHoa().getId()+"','"+cart2.getProduct().getSize().getId()+"')\" class=\"btn btn-outline-danger\">Xóa</button>\r\n"
								+ "									</td>\r\n"
								+ "								</tr>\n";
					}
					return result.getBytes("UTF-8");
				}
			}
			String hql = "From CTHangHoa where MaHangHoa.id= '"+id+"' and size.id='"+size+"'";
			Query query = session.createQuery(hql);
			
			CTHangHoa hangHoa = (CTHangHoa) query.list().get(0);
			if (Count >= hangHoa.getSoLuong())
				Count = hangHoa.getSoLuong();
			Cart cart = new Cart(hangHoa, Count);
			cartItems.add(cart);
			httpSession.setAttribute("myCartItems", cartItems);
		}
		
		for (Cart cart2 : cartItems) {
			result += "								<tr>\r\n"
					+ "									<td>" +cart2.getProduct().getMaHangHoa().getId() +"</td>\r\n"
					+ "									<td>" +cart2.getProduct().getMaHangHoa().getName()+ "</td>\r\n"
					+ "									<td>"+cart2.getProduct().getSize().getName()+"</td>\r\n"
					+ "									<td>\r\n"
					+ "										<input onchange=\"editcount('"+ cart2.getProduct().getMaHangHoa().getId()+"','"+ cart2.getProduct().getSize().getId() +"','"+cart2.getProduct().getMaHangHoa().getMoney()+"')\" class=\"btn\" max=\""+cart2.getProduct().getSoLuong() +"\" id=\"quantity"+cart2.getProduct().getMaHangHoa().getId()+cart2.getProduct().getSize().getId()+"\" type=\"number\" min=\"0\" value=\""+cart2.getCount()+"\" />\r\n"
					+ "									</td>\r\n"
					+ "									<td id =\"money-"+cart2.getProduct().getMaHangHoa().getId()+"-"+cart2.getProduct().getSize().getId()+"\">"+ convertToMoney(cart2.getProduct().getMaHangHoa().getMoney() * cart2.getCount()) +"</td>\r\n"
					+ "									<td>\r\n"
					+ "										<button onclick=\"remove('"+cart2.getProduct().getMaHangHoa().getId()+"','"+cart2.getProduct().getSize().getId()+"')\" class=\"btn btn-outline-danger\">Xóa</button>\r\n"
					+ "									</td>\r\n"
					+ "								</tr>\n";
		}
		
		
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "editCart",method = RequestMethod.POST)
	public @ResponseBody String editCart(HttpSession httpSession, HttpServletRequest request)
	{
		int money =0;
		String productId = request.getParameter("id_product");
		String sizeId = request.getParameter("size_product");
		int count = Integer.valueOf(request.getParameter("count_product"));
		List<Cart> cartItems = (List<Cart>) httpSession.getAttribute("listCreateCart");
		for (int i=0; i<cartItems.size();i++)
		{
			CTHangHoa ctHangHoa = cartItems.get(i).getProduct();
			if (ctHangHoa.getMaHangHoa().getId().equals(productId) && ctHangHoa.getSize().getId().equals(sizeId))
			{
				cartItems.get(i).setCount(count);
			}
			money += ctHangHoa.getMaHangHoa().getMoney() * cartItems.get(i).getCount();
		}
		return String.valueOf(money);
	}
	
	@RequestMapping(value = "removeItem",method = RequestMethod.POST)
	public @ResponseBody byte[] removeItem(HttpSession httpSession, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String productId = request.getParameter("id_product");
		String sizeId = request.getParameter("size_product");
		List<Cart> cartItems = (List<Cart>) httpSession.getAttribute("listCreateCart");
		for (int i=0; i<cartItems.size();i++)
		{
			CTHangHoa ctHangHoa = cartItems.get(i).getProduct();
			if (ctHangHoa.getMaHangHoa().getId().equals(productId) && ctHangHoa.getSize().getId().equals(sizeId))
			{
				cartItems.remove(i);
				break;
			}
		}
		httpSession.setAttribute("myCartItems", cartItems);
		String result ="";
		for (Cart cart2 : cartItems) {
			result += "								<tr>\r\n"
					+ "									<td>" +cart2.getProduct().getMaHangHoa().getId() +"</td>\r\n"
					+ "									<td>" +cart2.getProduct().getMaHangHoa().getName()+ "</td>\r\n"
					+ "									<td>"+cart2.getProduct().getSize().getName()+"</td>\r\n"
					+ "									<td>\r\n"
					+ "										<input onchange=\"editcount('"+ cart2.getProduct().getMaHangHoa().getId()+"','"+ cart2.getProduct().getSize().getId() +"','"+cart2.getProduct().getMaHangHoa().getMoney()+"')\" class=\"btn\" max=\""+cart2.getProduct().getSoLuong() +"\" id=\"quantity"+cart2.getProduct().getMaHangHoa().getId()+cart2.getProduct().getSize().getId()+"\" type=\"number\" min=\"0\" value=\""+cart2.getCount()+"\" />\r\n"
					+ "									</td>\r\n"
					+ "									<td id =\"money-"+cart2.getProduct().getMaHangHoa().getId()+"-"+cart2.getProduct().getSize().getId()+"\">"+ convertToMoney(cart2.getProduct().getMaHangHoa().getMoney() * cart2.getCount()) +"</td>\r\n"
					+ "									<td>\r\n"
					+ "										<button onclick=\"removeItem('"+cart2.getProduct().getMaHangHoa().getId()+"','"+cart2.getProduct().getSize().getId()+"')\" class=\"btn btn-outline-danger\">Xóa</button>\r\n"
					+ "									</td>\r\n"
					+ "								</tr>\n";
		}
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "pay",method = RequestMethod.POST)
	public @ResponseBody byte[] pay(HttpSession httpSession, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String result = "ERROR";
		int money =0;
		List<Cart> cartItems = (List<Cart>) httpSession.getAttribute("listCreateCart");
		for (int i=0; i<cartItems.size();i++)
		{
			CTHangHoa ctHangHoa = cartItems.get(i).getProduct();
			
			money += ctHangHoa.getMaHangHoa().getMoney() * cartItems.get(i).getCount();
		}
		Date date = new Date();
		Session session = factory.openSession();
		
		Account accountGuest = new Account();
		String temp = request.getParameter("username"); //tài khoản khách hàng
		if (temp.isEmpty())
			return result.getBytes("UTF-8");
		accountGuest.setUsername(temp);
		
		Bill bill = new Bill();
		bill.setAddress("Mua tại quầy");
		bill.setDate(date);
		bill.setStatus(true);
		bill.setMoneyProduct(money);
		bill.setTransportationFee(0);
		bill.setAccount(accountGuest);
		
		//Lấy email và họ tên khách hàng
		String email = ((Account) session.get(Account.class, temp)).getEmail();
		String fullName = ((Account) session.get(Account.class, temp)).getGuest().getFullname();
		
		Account account = (Account) session.get(Account.class, checkCookie(request).getUsername());
		Staff staff = new Staff();
		staff.setId(account.getStaff().getId());
		bill.setStaff(staff);
		Transaction transaction = session.beginTransaction();

		try {
			session.save(bill);
			String tempId = bill.getId();
			transaction.commit();
			session.close();
			session = factory.openSession();
			transaction = session.beginTransaction();
			for (Cart cart : cartItems) {
				
				CTBill ctBill = new CTBill();
				ctBill.setBill(bill);
				ctBill.setcTHangHoa(cart.getProduct());
				ctBill.setCount(cart.getCount());
				ctBill.setPromotion(cart.getProduct().getMaHangHoa().getDiscount());			
				ctBill.setUnitPrice(cart.getProduct().getMaHangHoa().getPrice());
				session.save(ctBill);
				
				
				CTHangHoa ctHangHoa = new CTHangHoa(cart.getProduct().getMaHangHoa(), cart.getProduct().getSize());
				ctHangHoa.setSoLuong(cart.getProduct().getSoLuong() - cart.getCount());
				session.update(ctHangHoa);

			}
			transaction.commit();
			cartItems = new ArrayList<Cart>();
			httpSession.setAttribute("listCreateCart", cartItems);
			
			bill = (Bill) session.get(Bill.class, tempId);
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
					+ "		<h1 style=\"text-align: right;\">Xin chào, "+fullName+"</h1>\r\n"
					+ "		<h3 style=\"text-align: center; font-size: 35px\">Thông tin đơn hàng của bạn</h3>\r\n"
					+ "		<p>	Cảm ơn bạn đã tin tưởng mua hàng tại chúng tôi. Rất mong đợi được gặp lại bạn.</p>\r\n"
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
			List<CTBill> bills = new ArrayList<>(bill.getCtBills());
			HashSet<CTBill> hashSet = new HashSet<CTBill>(bills);
			bills = new ArrayList<CTBill>(hashSet);
			for (int i=0; i< bills.size();i++)
			{
				content+= "					<tr>\r\n"
						+ "						<td>"+ bills.get(i).getcTHangHoa().getMaHangHoa().getName() +"</td>\r\n"
						+ "						<td>"+ (bills.get(i).getcTHangHoa().getSize().getId().equals("5") == false ? bills.get(i).getcTHangHoa().getSize().getName() : "" ) +"</td>\r\n"
						+ "						<td>"+ convertToMoney(bills.get(i).getUnitPrice()) +"</td>\r\n"
						+ "						<td>"+ bills.get(i).getCount() +"</td>\r\n"
						+ "						<td>"+ bills.get(i).getPromotion() +"%</td>\r\n"
						+ "						<td>"+ convertToMoney(bills.get(i).intoMoney()) +"</td>\r\n"
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
					+ "						<td><b>"+convertToMoney(allMoney)+"</b></td>\r\n"
					+ "					</tr>"
					+ "				</tbody>\r\n"
					+ "			</table>\r\n"
					+ "		</div>\r\n"
					+ "		<p style=\"font-size: 18px;  font-family: 'Times New Roman'\">Nếu có gì đó sai sót hoặc nhầm lẫn hãy báo với chúng tôi bằng cách trả lời mail này. </p>\r\n"
					+ "	</div>"
					+ "</body>\r\n"
					+ "</html>";
			mailer.send("n18dcat092@student.ptithcm.edu.vn", email, "Mua hàng tại quầy", content);
			result = "Tạo thành công";
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		
		
		
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "print",method = RequestMethod.POST)
	public @ResponseBody String print(HttpSession httpSession, HttpServletRequest request)
	{
		Session session = factory.openSession();
		String id = request.getParameter("ID");
		Bill bill = (Bill) session.get(Bill.class, id);
		String fullName = "";
		
		if (bill.getAccount().getStaff() != null)
		{
			fullName = bill.getAccount().getStaff().getFullName();
		}
		else
			fullName = bill.getAccount().getGuest().getFullname();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String strDate = formatter.format(new Date());
		String strPay = formatter.format(bill.getDate());
		try {
            // create the API client instance
			Pdfcrowd.HtmlToPdfClient client =
	                new Pdfcrowd.HtmlToPdfClient("konoha279", "148c2757f61a48a8d90270cc83478994");

            // run the conversion and write the result to a file
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
            		+ "	<div style=\"margin: 20px;padding: 20px; width: 1000px;\">\r\n"
            		+ "		<p style=\"text-align: right;\">"+strDate+"</p>\r\n"
            		+ "		<h1 style=\"text-align: center; font-size: 35px\">Hóa đơn mua hàng</h1>\r\n"
            		+ "		<p><strong>CỬA HÀNG: PTITSPORT</strong></p>\r\n"
            		+ "		<p>Tên khách hàng: <strong>"+fullName+"</strong></p>\r\n"
            		+ "		<p>Địa chỉ: <strong>"+ bill.getAddress() +"</strong></p>\r\n"
            		+ "		<P>Ngày mua: <STRONG>"+strPay+"</STRONG></P>\r\n"
            		+ "		\r\n"
            		+ "		<div style=\"margin-top: 20px;\">\r\n"
            		+ "			<table style=\"width: 100%;border-collapse: collapse;\">	\r\n"
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
            		+ "						<th>Tổng tiền </th>\r\n"
            		+ "					</tr>													\r\n"
            		+ "				</thead>			\r\n"
            		+ "				<tbody>\r\n";
					int allMoney=0;
					List<CTBill> ctBills = new ArrayList<>(bill.getCtBills());
					HashSet<CTBill> hashSet = new HashSet<CTBill>(ctBills);
					ctBills = new ArrayList<CTBill>(hashSet);
					for (int i=0; i< ctBills.size();i++)
					{
						content+= "					<tr>\r\n"
								+ "						<td>"+ ctBills.get(i).getcTHangHoa().getMaHangHoa().getName() +"</td>\r\n"
								+ "						<td>"+ (ctBills.get(i).getcTHangHoa().getSize().getId().equals("5") == false ? ctBills.get(i).getcTHangHoa().getSize().getName() : "" ) +"</td>\r\n"
								+ "						<td>"+ convertToMoney(ctBills.get(i).getUnitPrice()) +"</td>\r\n"
								+ "						<td>"+ ctBills.get(i).getCount() +"</td>\r\n"
								+ "						<td>"+ ctBills.get(i).getPromotion() +"%</td>\r\n"
								+ "						<td>"+ convertToMoney(ctBills.get(i).intoMoney()) +"</td>\r\n"
								+ "					</tr>\r\n"
								+ "\r\n";
						allMoney += ctBills.get(i).intoMoney();
					}
    		
    		
	            content	+= "				<tr style=\"background-color: #ffcce6;\">\r\n"
	            		+ "						<td><b>Tổng tiền</b></td>\r\n"
	            		+ "						<td></td>\r\n"
	            		+ "						<td></td>\r\n"
	            		+ "						<td></td>\r\n"
	            		+ "						<td></td>\r\n"
	            		+ "						<td><b>"+convertToMoney(allMoney)+"</b></td>\r\n"
	            		+ "					</tr>\r\n"
	            		+ "\r\n"
	            		+ "\r\n"
	            		+ "				</tbody>\r\n"
	            		+ "			</table>\r\n"
	            		+ "		</div>\r\n"
	            		+ "	</div>\r\n"
	            		+ "</body>\r\n"
	            		+ "</html>";
            client.convertStringToFile(content, "HoaDon.pdf");
        }
        catch(Pdfcrowd.Error why) {
            // report the error
            System.err.println("Pdfcrowd Error: " + why);

            // rethrow or handle the exception
            throw why;
        }
        catch(IOException why) {
            // report the error
            System.err.println("IO Error: " + why);

            // rethrow or handle the exception
        }
		return "";
	}
	
	// ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
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
