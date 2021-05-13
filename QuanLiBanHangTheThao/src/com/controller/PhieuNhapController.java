package com.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

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

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.Branch;
import com.entity.Receipt;
import com.entity.Staff;


@Transactional
@Controller
@RequestMapping("/admin/nhap/")
public class PhieuNhapController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	
	@ModelAttribute("Branchs")
	public List<Branch> getBranchs()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Branch";
		Query query = session.createQuery(hql);
		List<Branch> list = query.list();
		return list;
	}

	@ModelAttribute("dsNhanVien")
	public List<Staff> getLoai() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Staff";
		Query query = session.createQuery(hql);
		List<Staff> list = query.list();
		return list;
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Receipt";
		Query query = session.createQuery(hql);
		List<Receipt> list = query.list();
		model.addAttribute("dsPhieuNhap", list);
		return "admin/nhap/index";
	}

	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("Receipt", new Receipt());
		return "admin/nhap/insert";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("Receipt") Receipt phieuNhap, BindingResult errors,
			RedirectAttributes re) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(phieuNhap);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		} finally {
			session.close();
		}
		return "admin/nhap/insertdetail";
	}

	@RequestMapping(value = "detail/{maPN}")
	public String detail(ModelMap model, @PathVariable("maPN") int maPN) {
		Session session = factory.getCurrentSession();
		Receipt phieuNhap = (Receipt) session.get(Receipt.class, maPN);
		model.addAttribute("phieuNhap", phieuNhap);
		return "admin/nhap/detail";
	}

	@RequestMapping("insertdetail")
	public String insertdetail(ModelMap model) {
		return "admin/nhap/insertdetail";
	}
}
