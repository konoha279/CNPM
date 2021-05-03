package com.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/profile/")
public class ProfileController {

	
	@RequestMapping("account")
	public String profile()
	{
		return "profile/account";
	}
}
