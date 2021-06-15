package com.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Formatter;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Transactional
@Controller
@RequestMapping("/admin/page/")
public class PageController {
	
	@RequestMapping(value = "gioithieu", method = RequestMethod.GET)
	public String gioithieu(HttpServletRequest request)
	{
		String content = "";
		File x = new File("gioithieu.dat");
		try {
			if (x.exists())
			{
				Scanner scan = new Scanner(x);
				
				while(scan.hasNextLine()) {
		    		  content += scan.nextLine()+"\r\n";
		    	}
				scan.close();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error");
		}
		request.setAttribute("content", content);		
		return "admin/page/gioithieu";
	}
	
	@RequestMapping(value = "gioithieu", method = RequestMethod.POST)
	public String savePageGT(HttpServletRequest request)
	{
		String content = request.getParameter("content");
		Formatter file;
		try {
			file = new Formatter("gioithieu.dat");
			file.format("%s", content);
			file.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/admin/page/gioithieu.htm";
	}
	
	@RequestMapping(value = "chinhsach", method = RequestMethod.GET)
	public String chinhsach(HttpServletRequest request)
	{
		String content = "";
		File x = new File("chinhsach.dat");
		try {
			if (x.exists())
			{
				Scanner scan = new Scanner(x);
				
				while(scan.hasNextLine()) {
		    		  content += scan.nextLine()+"\r\n";
		    	}
				scan.close();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error");
		}
		request.setAttribute("content", content);		
		return "admin/page/chinhsach";
	}
	
	@RequestMapping(value = "chinhsach", method = RequestMethod.POST)
	public String savePageCS(HttpServletRequest request)
	{
		String content = request.getParameter("content");
		Formatter file;
		try {
			file = new Formatter("chinhsach.dat");
			file.format("%s", content);
			file.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/admin/page/chinhsach.htm";
	}
}
