package com.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Account;
import com.entity.Guest;
import com.entity.Staff;


@Controller
@RequestMapping("/profile/")
public class ProfileController {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	Mailer mailer;
	
	@RequestMapping("account")
	public String profile()
	{
		return "profile/account";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public @ResponseBody byte[] doGet(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String username = request.getParameter("username");
		String firstName = request.getParameter("firstName");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		String temp =  new String();
		if (sex.equals("Nữ"))
		{
			temp ="<input type=\"radio\" name=\"sex\" id =\"sex1_input\" value=\"Nữ\" checked> Nữ\r\n"
					+ "			  			<input type=\"radio\" name=\"sex\" id =\"sex2_input\" value=\"Nam\" > Nam\r\n";
		}
		else
			temp = "<input type=\"radio\" name=\"sex\" id =\"sex1_input\" value=\"Nữ\"> Nữ\r\n"
					+ "			  			<input type=\"radio\" name=\"sex\" id =\"sex2_input\" value=\"Nam\" checked> Nam\r\n";

		String result = "<form id=\"form-profile\" action=\"#\" style=\"padding-left: 50px;\">\r\n"
				+ "			  		<div>\r\n"
				+ "				  		<div>Username:</div>\r\n"
				+ "				  		<input id = \"username\" name = \"username\" value=\""+username+"\" disabled> \r\n"
				+ "			  		</div>\r\n"
				+ "			  		\r\n"
				+ "			  		<div style=\"display: flex\">\r\n"
				+ "				  		<div>\r\n"
				+ "				  			<div>Họ:</div> <input type=\"text\" id =\"firstname_input\" value=\""+firstName+"\" >\r\n"
				+ "				  		</div>\r\n"
				+ "				  		<div style=\"padding-left: 100px\">\r\n"
				+ "			  				<div>Tên:</div> <input type=\"text\" id =\"name_input\" value=\""+name+"\" >\r\n"
				+ "				  		</div>\r\n"
				+ "			  		</div>\r\n"
				+ "			  		<div style=\"display: flex: ;\">\r\n"
				+ "			  			<div>Giới tính:</div> \r\n"
				+ temp 
				+ "			  		</div>\r\n"
				+ "			  		<div>\r\n"
				+ "			  			<div>Sinh nhật:</div> <input id =\"date_input\" type=\"date\" value=\""+birthday+"\" >\r\n"
				+ "			  		</div>\r\n"
				+ "			  		<div>\r\n"
				+ "			  			<div>Số điện thoại:</div> <input type=\"text\" id =\"phone_input\" value=\""+phone+"\" >\r\n"
				+ "			  		</div>\r\n"
				+ "				<div class=\"d-flex justify-content-center\">\r\n"
				+ "			  		<button onclick=\"post()\" class=\"btn btn-outline-success\" type=\"button\" id = \"button1\">Cập nhật</button>\r\n"
				+ "				</div>\r\n"
				+ "			  	</form>\r\n"
				+ "				<div id=\"error-msg\"></div>	";
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public @ResponseBody byte[] doPost(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		//value return
		String result = "";
		
		//params
		String username = request.getParameter("username");
		String firstName = request.getParameter("firstName");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		boolean checkSex = false, checkOther = false;
		
		if (sex.equals("Nữ"))
		{
			checkSex = false;
		}
		else
		{
			checkSex = true;
		}
		Session session = factory.openSession();
		String hql = "From Guest guest where guest.accountGuest.username = '" + username + "'";
		Query query = session.createQuery(hql);
		
	
		
		if (query.list().isEmpty())
		{
			result = "<div id=\"error-msg\">"+"Tài khoản có gì đó không đúng!"+"</div>";
			return result.getBytes("UTF-8");
		}
				
		Guest guest = (Guest) query.list().get(0);
		
		// ------------------- Content mail (head) -------------------
		String contentMail = "	<div style=\"border: 5px solid #ff6666;margin: 20px;padding: 20px; width: 750px;\">\r\n"
							+ "		<h1 style=\"text-align: right;\">Xin chào, "+ guest.getFullname() + "</h1>\r\n"
							+ "		<h1 style=\"text-align: center; font-size: 35px\">Hồ sơ của bạn đã bị thay đổi</h1>\r\n"
							+ "		<h2>Những thứ đã thay đổi: </h2>\r\n"
							+ "		<div style=\"font-size: 20px; margin-left: 20px; font-family: 'Times New Roman'\">\r\n"
							+ "			<ol>\r\n";
		String contentBefore = "";
		String contentAfter = "";
		// -----------------------------------------------------------
		
		// ------------------- check for change of data -------------------
		if (!guest.getFirstName().equals(firstName))
		{
			checkOther = true;
			contentMail += "<li>Đã thay đổi <b>Họ</b></li>\n";
			contentBefore += "<li>Họ: <b>"+guest.getFirstName()+"</b></li>\r\n";
			contentAfter += "<li>Họ: <b>"+firstName+"</b></li>\r\n";
		}
		if (!guest.getName().equals(name))
		{
			checkOther = true;
			contentMail += "<li>Đã thay đổi <b>Tên</b></li>\n";
			contentBefore += "				<li>Tên: <b>"+guest.getName()+"</b></li>\r\n";
			contentAfter += "				<li>Tên: <b>"+name+"</b></li>\r\n";
		}
		
		if (guest.getSex() != checkSex)
		{
			checkOther = true;
			contentMail += "<li>Đã thay đổi <b>Giới tính</b></li>\n";
			contentBefore += "				<li>Giới tính: <b>"+(guest.getSex() == false ? "Nữ": "Nam")+"</b></li>\r\n";
			contentAfter += "				<li>Giới tính: <b>"+ sex +"</b></li>\r\n";
		}
		
		if (!guest.getPhoneNumber().equals(phone))
		{
			checkOther = true;
			contentMail += "<li>Đã thay đổi <b>Số điện thoại</b></li>\n";
			contentBefore += "				<li>Số điện thoại: <b>"+guest.getPhoneNumber()+"</b></li>\r\n";
			contentAfter += "				<li>Số điện thoại: <b>"+phone+"</b></li>\r\n";
		}
		
		if (!guest.getBirthday_str().equals(birthday))
		{
			checkOther = true;
			contentMail += "<li>Đã thay đổi <b>Sinh nhật</b></li>\n";
			contentBefore += "				<li>Sinh nhật: <b>"+guest.getBirthday_str()+"</b></li>\r\n";
			contentAfter += "				<li>Sinh nhật: <b>"+birthday+"</b></li>\r\n";
		}
		// --------------------------------------------------------------------
		
		// ------------------- Content mail (end) -------------------
		contentMail += "			</ol>\r\n"
					+ "		</div>"
					+ "		<h2>Chi tiết: </h2>\r\n"
					+ "		<div style=\"display: flex;  border: 2px solid black;\">\r\n"
					+ "			<div style=\"width: 50%;border-right: 2px solid black\">\r\n"
					+ "				<h2 style=\"text-align: center;color: red; border-bottom: 2px solid black; font-size: 30px; font-family: 'Courier New'\">Trước</h2>\r\n"
					+ "				<div style=\"font-size: 20px; margin-left: 20px; font-family: 'Times New Roman'\">\r\n"
					+ "					<ul>\r\n"
					+ 						contentBefore
					+ "					</ul>\r\n"
					+ "				</div>\r\n"
					+ "			</div>\r\n"
					+ "			<div style=\" width: 50%\">\r\n"
					+ "				<h2 style=\"text-align: center;color: red; border-bottom: 2px solid black; font-size: 30px; font-family: 'Courier New'\">Sau</h2>\r\n"
					+ "				<div style=\"font-size: 20px; margin-left: 20px; font-family: 'Times New Roman'\">\r\n"
					+ "					<ul>\r\n"
					+					 	contentAfter
					+ "					</ul>\r\n"
					+ "				</div>\r\n"
					+ "			</div>\r\n"
					+ "		</div>\r\n"
					+ "		<p style=\"font-size: 18px;  font-family: 'Times New Roman'\">Hãy kiểm tra kĩ lại mọi thông tin, nếu không có gì sai sót vui lòng bỏ qua mail này. Nếu người thay đổi thông tin <b>không phải</b> là bạn, hãy đổi mật khẩu ngay! </p>\r\n"
					+ "	</div>";
		
		// -----------------------------------------------------------
		
		// ------------------- Set new data -------------------
		guest.setFirstName(firstName);
		guest.setName(name);
		guest.setSex(checkSex);
		guest.setPhoneNumber(phone);
		guest.setBirthday(birthday);
		// -----------------------------------------------------------
		
		Transaction transaction = session.beginTransaction();
		
		try {
			
			if (checkOther)
			{
				session.update(guest);
				mailer.send("n18dcat092@student.ptithcm.edu.vn", guest.getAccountGuest().getEmail(), "Thay đổi hồ sơ", contentMail);
			}
			transaction.commit();
			result += "<form id=\"form-profile\" action=\"#\" style=\"padding-left: 50px;\">\r\n"
					+ "			  		<div>\r\n"
					+ "				  		<div>Username:</div>\r\n"
					+ "				  		<input id = \"username\" name = \"username\" value=\""+username+"\" disabled> \r\n"
					+ "			  		</div>\r\n"
					+ "			  		\r\n"
					+ "			  		<div style=\"display: flex\">\r\n"
					+ "				  		<div>\r\n"
					+ "				  			<div>Họ:</div> <input type=\"text\" id =\"firstname_input\" value=\""+firstName+"\" disabled >\r\n"
					+ "				  		</div>\r\n"
					+ "				  		<div style=\"padding-left: 100px\">\r\n"
					+ "			  				<div>Tên:</div> <input type=\"text\" id =\"name_input\" value=\""+name+"\"disabled >\r\n"
					+ "				  		</div>\r\n"
					+ "			  		</div>\r\n"
					+ "			  		<div style=\"display: flex: ;\">\r\n"
					+ "			  			<div>Giới tính:</div> \r\n"
					+ "							<input type=\"radio\" name=\"sex\" id =\"sex1_input\" value=\"Nữ\" "+ (sex.equals("Nữ") == true ?"checked":"") +" disabled> Nữ\r\n"
					+ "			  				<input type=\"radio\" name=\"sex\" id =\"sex2_input\" value=\"Nam\" "+ (sex.equals("Nữ") == false ?"checked":"") +" disabled > Nam\r\n" 
					+ "			  		</div>\r\n"
					+ "			  		<div>\r\n"
					+ "			  			<div>Sinh nhật:</div> <input id =\"date_input\" type=\"date\" value=\""+birthday+"\" disabled >\r\n"
					+ "			  		</div>\r\n"
					+ "			  		<div>\r\n"
					+ "			  			<div>Số điện thoại:</div> <input type=\"text\" id =\"phone_input\" value=\""+phone+"\" disabled >\r\n"
					+ "			  		</div>\r\n"
					+ "				<div class=\"d-flex justify-content-center\">\r\n"
					+ "			  		<button onclick=\"get()\" class=\"btn btn-outline-primary\" type=\"button\" id = \"button1\">Chỉnh sửa</button>\r\n"
					+ "				</div>\r\n"
					+ "			  	</form>"
					+ "				<div id=\"error-msg\">"+"Cập nhật thành công"+"</div>";
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
			transaction.rollback();
			result = "<div id=\"error-msg\">"+"Cập nhật thất bại, hãy báo cáo bug "+ e +" đến admin server."+"</div>";
		}
		finally {
			session.close();
		}
		
		return result.getBytes("UTF-8");
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
	
	@RequestMapping(value = "/checkPasswd", method = RequestMethod.POST)
	public @ResponseBody String checkPasswd(HttpServletRequest request, HttpServletResponse response)
	{
		String username = request.getParameter("username");
		String password = request.getParameter("oldPasswd");
		
		Session session = factory.openSession();
		String hql = "From Account where username = '" + username + "'";
		Query query = session.createQuery(hql);
		
		if (query.list().isEmpty())
		{
			return "ERROR!";
		}
		
		Account account = (Account)query.list().get(0);
		session.close();
		if (account.getPassword().equals(encrypt(password)))
		{
			return "OK";
		}
		else
			return "Wrong password.";
	}
	
	@RequestMapping(value = "/changePasswd", method = RequestMethod.POST)
	public @ResponseBody String changePasswd(HttpServletRequest request, HttpServletResponse response)
	{
		String result = new String();
		String time = new SimpleDateFormat("HH:mm:ss dd-MM-yyyy").format(new Date());
		
		String username = request.getParameter("username");
		String password = request.getParameter("newPasswd");
		Session session = factory.openSession();
		String hql = "From Account where username = '" + username + "'";
		Query query = session.createQuery(hql);
		
		if (query.list().isEmpty())
		{
			session.close();
			return "ERROR!";
		}
		
		Account account = (Account)query.list().get(0);
		account.setPassword(encrypt(password));
		
		Transaction transaction = session.beginTransaction();
		result = "Changed";
		try {
			session.update(account);
			String contentMail = new String();
			if (account.getLevel() == 0)
			{
				contentMail = "	<div style=\"border: 5px solid #ff6666;margin: 20px;padding: 20px; width: 750px;\">\r\n"
						+ "		<h1 style=\"text-align: right;\">Xin chào, "+ account.getGuest().getFullname() + "</h1>\r\n"
						+ "		<h1 style=\"text-align: center; font-size: 35px\">Mật khẩu của bạn đã bị thay đổi</h1>\r\n"
						+ "		<h2>Mật khẩu của bạn đã được thay đổi lúc: <b>"+time+"</b> </h2>\r\n"
						+ "		<p style=\"font-size: 18px;  font-family: 'Times New Roman'\">Nếu người thay đổi mật khẩu <b>không phải</b> là bạn, hãy báo với admin server ngay! </p>"
						+ "	</div>";
			}
			else
			{
				contentMail = "	<div style=\"border: 5px solid #ff6666;margin: 20px;padding: 20px; width: 750px;\">\r\n"
						+ "		<h1 style=\"text-align: right;\">Xin chào, "+account.getStaff().getFullName() + "</h1>\r\n"
						+ "		<h1 style=\"text-align: center; font-size: 35px\">Mật khẩu của bạn đã bị thay đổi</h1>\r\n"
						+ "		<h2>Mật khẩu của bạn đã được thay đổi lúc: <b>"+time+"</b> </h2>\r\n"
						+ "		<p style=\"font-size: 18px;  font-family: 'Times New Roman'\">Nếu người thay đổi mật khẩu <b>không phải</b> là bạn, hãy báo với admin server ngay! </p>"
						+ "	</div>";
			}

			mailer.send("n18dcat092@student.ptithcm.edu.vn", account.getEmail(), "Thay đổi mật khẩu", contentMail);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			result =  "ERROR!";
		}
		finally {
			session.close();
		}
		return result;
	}
}
