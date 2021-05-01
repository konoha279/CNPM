package com.controller;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
@Transactional
@Controller
@RequestMapping("/admin/taikhoan/")
public class TaiKhoanController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		return "admin/taikhoan/index";
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model) {
		return "admin/taikhoan/insert";
	}
	
	@RequestMapping("update")
	public String update(ModelMap model) {
		return "admin/taikhoan/update";
	}
}