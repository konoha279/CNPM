package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.entity.Brand;

@Controller
@Transactional
@RequestMapping("/admin/thuonghieu/")
public class BrandController {

	@Autowired
	SessionFactory factory;
	
	@ModelAttribute("Brand")
	public List<Brand> listBrand()
	{
		Session session = factory.getCurrentSession();
		String hql = "From Brand";
		Query query = session.createQuery(hql);
		List<Brand> list = query.list();
		return list;
	}
	@RequestMapping("index")
	public String index(ModelMap model)
	{
		return "admin/thuonghieu/index";
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public @ResponseBody byte[] delete(HttpServletRequest request) throws UnsupportedEncodingException
	{
		String result ="error";
		String id = request.getParameter("id");
		Session session = factory.openSession();
		Brand brand = (Brand) session.get(Brand.class, id);
		if (!brand.getProducts().isEmpty())
		{
			return "Không thể xóa vì thương hiệu này đã có sản phẩm trong database".getBytes("UTF-8");
		}
		Transaction transaction = session.beginTransaction();
		try {
			session.delete(brand);
			transaction.commit();
			result = "Xóa thành công";
		} catch (Exception e) {
			result = String.valueOf(e);
			transaction.rollback();
			System.out.print(e);
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public @ResponseBody byte[] insert(HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String result = "error";
		Session session = factory.getCurrentSession();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		if ((Brand) session.get(Brand.class, id) != null)
		{
			result = "Mã thương hiệu đã tồn tại, vui lòng chọn mã khác.";
		}
		else
		{
			Brand brand = new Brand(id, name);
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				session.save(brand);
				transaction.commit();
				result = "Thêm thành công";
			} catch (Exception e) {
				result = String.valueOf(e);
				System.out.print(e);
				transaction.rollback();
				// TODO: handle exception
			}
			finally {
				session.close();
			}
		}
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public @ResponseBody byte[] edit(HttpServletRequest request) throws UnsupportedEncodingException
	{
		String result = "error";
		Session session = factory.getCurrentSession();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		if ((Brand) session.get(Brand.class, id) != null)
		{
			Brand brand = new Brand(id, name);
			session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				session.update(brand);
				transaction.commit();
				result = "Chỉnh sửa thành công";
			} catch (Exception e) {
				result = String.valueOf(e);
				System.out.print(e);
				transaction.rollback();
				// TODO: handle exception
			}
			finally {
				session.close();
			}
		}
		return result.getBytes("UTF-8");
	}

}
