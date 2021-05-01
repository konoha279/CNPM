package com.controller;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
@RequestMapping("/admin/hoadon/")
public class HoaDonController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		return "admin/hoadon/index";
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model) {
		return "admin/hoadon/insert";
	}
	
	@RequestMapping("detail")
	public String detail(ModelMap model) {
		return "admin/hoadon/detail";
	}
	
	@RequestMapping("insertdetail")
	public String insertdetail(ModelMap model) {
		return "admin/hoadon/insertdetail";
	}
}
