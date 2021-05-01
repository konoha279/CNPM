package com.controller;

import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
@RequestMapping("/admin/xuat/")
public class XuatController {
	@RequestMapping("index")
	public String index(ModelMap model) {
		return "admin/xuat/index";
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model) {
		return "admin/xuat/insert";
	}
	
	@RequestMapping("detail")
	public String detail(ModelMap model) {
		return "admin/xuat/detail";
	}
	
	@RequestMapping("insertdetail")
	public String insertdetail(ModelMap model) {
		return "admin/xuat/insertdetail";
	}
}
