package com.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.websocket.server.PathParam;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Account;
import com.entity.Role;
import com.entity.Staff;


@Transactional
@Controller
@RequestMapping("/admin/nhanvien/")
public class NhanVienController {
	@Autowired
	SessionFactory factory;
	
	
	@ModelAttribute("role")
	public List<Role> getRole()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Role";
		Query query = session.createQuery(hql);
		List<Role> list = query.list();
		return list;
	}
	
	public Role getRole(String id)
	{
		Session session = factory.getCurrentSession();
		Role role = (Role) session.get(Role.class, id);
		return role;
	}
	
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession httpSession) {
		return "redirect:/admin/nhanvien/index.htm?page=1";
	}

	public void loadindex(ModelMap model, String hql, Integer page) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Staff> list = query.list();
		model.addAttribute("Staff", list.subList((page - 1) * 8, (page * 8 > list.size() ? list.size() : page * 8)));
		model.addAttribute("page", page);
		model.addAttribute("maxpage", Math.ceil(list.size() / 8.0));
	}

	@RequestMapping(value = "index", params = { "page" })
	public String indexpage(ModelMap model, @PathParam("page") Integer page) {
		String hql = "From Staff";
		loadindex(model, hql, page);
		return "admin/nhanvien/index";
	}

	@RequestMapping(value="insert",method=RequestMethod.GET)
	public String insert(ModelMap model)
	{
		model.addAttribute("staff",new Staff());
		return "admin/nhanvien/insert";
	}
	
	@RequestMapping(value="insert",method=RequestMethod.POST)
	public String insert(ModelMap model,@ModelAttribute("staff")Staff staff,BindingResult errors)
	{
		if (staff.getName().trim().length() == 0) {
			errors.rejectValue("name", "name", "Vui l??ng nh???p t??n nh??n vi??n");
		}
		if (staff.getFirstName().trim().length() == 0) {
			errors.rejectValue("firstName", "firstName", "Vui l??ng nh???p h??? nh??n vi??n");
		}
		if (staff.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "address", "Vui l??ng nh???p ?????a ch??? nh??n vi??n");
		}
		if (staff.getPhoneNumber().trim().length() == 0) {
			errors.rejectValue("phoneNumber", "phoneNumber", "Vui l??ng nh???p s??? ??i???n tho???i nh??n vi??n");
		}
		if (staff.getBirthday() == null)
		{
			errors.rejectValue("birthday", "birthday", "Vui l??ng nh???p ng??y sinh cho nh??n vi??n");
		}
		if (staff.getWorkday() == null)
		{
			errors.rejectValue("workday", "workday", "Vui l??ng nh???p ng??y b???t ?????u l??m cho nh??n vi??n");
		}
		if (staff.getCmnd().trim().length() == 0) {
			errors.rejectValue("cmnd", "cmnd", "Vui L??ng nh???p ch???ng minh nh??n d??n.");
		}
		if (staff.getAccountStaff().getUsername().trim().length() == 0) {
			errors.rejectValue("accountStaff.email", "accountStaff.email", "Vui L??ng nh???p t??i kho???n.");
		}
		if (staff.getAccountStaff().getPassword().trim().length() == 0) {
			errors.rejectValue("accountStaff.password", "accountStaff.password", "Vui L??ng nh???p m???t kh???u.");
		}
		if (staff.getAccountStaff().getPassword().trim().length() == 0) {
			errors.rejectValue("accountStaff.email", "accountStaff.email", "Vui L??ng nh???p email.");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui l??ng s???a c??c l???i sau");
		} else {
			Session session = factory.getCurrentSession();

			if (session.get(Account.class, staff.getAccountStaff().getUsername()) != null)
			{
				model.addAttribute("message","T??n t??i kho???n ???? t???n t???i");
				return "admin/nhanvien/insert";
			}
			else 
			{
				String hql = "From Account where email= '"+staff.getAccountStaff().getEmail()+"'";
				Query query = session.createQuery(hql);
				if (!query.list().isEmpty())
				{
					model.addAttribute("message","Email ????ng k?? ???? ???????c ????ng k??.");
					return "admin/nhanvien/insert";
				}
			}
			
			Role role = getRole(staff.getAccountStaff().getRole().getId());
			Account account = new Account(staff.getAccountStaff().getUsername(), encrypt(staff.getAccountStaff().getPassword()), staff.getAccountStaff().getEmail(), role, true);
			Staff newStaff = new Staff(staff.getFirstName(), staff.getName(), staff.getCmnd(), staff.getAddress(), staff.getPhoneNumber(), staff.getStatus(), staff.getSex());
			
			account.setStaff(newStaff);
			newStaff.setAccountStaff(account);
			newStaff.setBirthday(staff.getBirthday());
			newStaff.setWorkday(staff.getWorkday());
			
			session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.save(account);
				session.save(newStaff);
				t.commit();
				model.addAttribute("message","Th??m M???i Th??nh C??ng!");
			}
			catch (Exception e) {
				t.rollback();
				model.addAttribute("message",e.getMessage());
			}
			finally {
				session.close();
			}
		}	
		return "admin/nhanvien/insert";
	}
	
	@RequestMapping(value="update/{maNV}",method=RequestMethod.GET)
	public String update(ModelMap model,@PathVariable("maNV") String id, HttpServletRequest request)
	{
		Session session = factory.getCurrentSession();
		Staff staff = (Staff) session.get(Staff.class, id);
		if (staff.getAccountStaff().getUsername().trim().equals(checkCookie(request).getUsername()))
			model.addAttribute("check", 0);
		else
			model.addAttribute("check", 1);
		model.addAttribute("id", id);
		model.addAttribute("staff", staff);
		model.addAttribute("role", staff.getAccountStaff().getRole().getId());
		return "admin/nhanvien/update";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(ModelMap model,@ModelAttribute("staff")Staff staff,BindingResult errors, @RequestParam( value = "role" ,defaultValue = "") String roleID)
	{
		if (staff.getName().trim().length() == 0) {
			errors.rejectValue("name", "name", "Vui l??ng nh???p t??n nh??n vi??n");
		}
		if (staff.getFirstName().trim().length() == 0) {
			errors.rejectValue("firstName", "firstName", "Vui l??ng nh???p h??? nh??n vi??n");
		}
		if (staff.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "address", "Vui l??ng nh???p ?????a ch??? nh??n vi??n");
		}
		if (staff.getPhoneNumber().trim().length() == 0) {
			errors.rejectValue("phoneNumber", "phoneNumber", "Vui l??ng nh???p s??? ??i???n tho???i nh??n vi??n");
		}
		if (staff.getBirthday() == null)
		{
			errors.rejectValue("birthday", "birthday", "Vui l??ng nh???p ng??y sinh cho nh??n vi??n");
		}
		if (staff.getWorkday() == null)
		{
			errors.rejectValue("workday", "workday", "Vui l??ng nh???p ng??y b???t ?????u l??m cho nh??n vi??n");
		}
		if (staff.getCmnd().trim().length() == 0) {
			errors.rejectValue("cmnd", "cmnd", "Vui L??ng nh???p ch???ng minh nh??n d??n.");
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui l??ng s???a c??c l???i sau");
		} else {
			Role role = new Role();
			role.setId(staff.getAccountStaff().getRole().getId());
			Session session = factory.getCurrentSession();
			Staff datStaff = (Staff) session.get(Staff.class, staff.getId());
			staff.setAccountStaff(datStaff.getAccountStaff());
			
			Account tmpAccount = new Account();
			tmpAccount.setUsername(datStaff.getAccountStaff().getUsername());
			tmpAccount.setPassword(datStaff.getAccountStaff().getPassword());;
			tmpAccount.setEmail(datStaff.getAccountStaff().getEmail());
			tmpAccount.setActive(datStaff.getAccountStaff().getActive());
			tmpAccount.setRole(role);
			
			session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.update(tmpAccount);	
				session.update(staff);	
				t.commit();
				model.addAttribute("message","C???p Nh???t Th??nh C??ng!");
			}
			catch (Exception e) {
				t.rollback();
				System.out.print(e);
				model.addAttribute("message",e.getMessage());
			}
			finally {
				session.close();
			}
		}	
		return "redirect:/admin/nhanvien/index.htm?page=1";
	}	
	
	public Account checkCookie(HttpServletRequest request)
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
}
