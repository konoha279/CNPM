package com.controller;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
