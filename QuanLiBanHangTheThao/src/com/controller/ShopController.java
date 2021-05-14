package com.controller;

import com.bean.LinkedList;
import com.entity.Product;
import com.entity.ProductList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Transactional
@Controller
public class ShopController {
	@Autowired
	SessionFactory factory;
	
	@ModelAttribute("Products")
	public List<Product> getProducts()
	{
		Session session = factory.getCurrentSession();
		String hql = "From Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}
	
	@ModelAttribute("product")
	public List<ProductList> getProductLists()
	{
		Session session = factory.getCurrentSession();
		String hql ="FROM ProductList";
		Query query = session.createQuery(hql);
		List<ProductList> productlist= query.list();
		return productlist;
	}
	
	public void Setup(ModelMap model) 
	{
		LinkedList Login = new LinkedList("Đăng nhập", "login.htm");
		LinkedList Cart = new LinkedList("Giỏ hàng của tôi", "#");
		LinkedList Checkout = new LinkedList("Thanh toán", "checkout.htm");
		LinkedList Account =  new LinkedList("Tài khoản", "#");
		LinkedList Withlist = new LinkedList("Danh sách yêu thích", "#");
		
		Map<String, LinkedList> list= new HashMap<>();
		list.put("login", Login);
		list.put("cart", Cart);
		list.put("checkout", Checkout);
		list.put("account", Account);
		list.put("withlist", Withlist);
		
		model.addAttribute("MapLink",list);
		
		List<String> LanguageList = new ArrayList<String>();
		LanguageList.add("Tiếng việt");
		
		model.addAttribute("Language", LanguageList);
		
		List<String> currencyList = new ArrayList<String>();
		currencyList.add("VND");

		model.addAttribute("Currency", currencyList);
		
		List<LinkedList> menu = new ArrayList<LinkedList>();
		
		LinkedList home = new LinkedList("Trang chủ", "index.htm");
		LinkedList storepage = new LinkedList("Trang cửa hàng", "shop.htm");
		LinkedList product = new LinkedList("Sản phẩm", "single-product.htm");
		LinkedList cart = new LinkedList("Giỏ hàng", "cart.htm");
		LinkedList thanhtoan = new LinkedList("Thanh toán","checkout.htm");
		
		menu.add(home);
		menu.add(storepage);
		menu.add(product);
		menu.add(cart);
		menu.add(thanhtoan);
		
		model.addAttribute("Menu",menu);
	}
	

	
	@RequestMapping("index")
	public String index(ModelMap model)
	{
		Setup(model);
		return "/Shop/index";
	}

	@RequestMapping("checkout")
	public String checkout(ModelMap model)
	{
		Setup(model);
		return "/Shop/checkout";
	}
	
	@RequestMapping("cart")
	public String cart(ModelMap model)
	{
		Setup(model);
		return "/Shop/cart";
	}
	
	@RequestMapping(value = "shop{id}", method = RequestMethod.GET)
	public String shop(ModelMap model,@PathVariable("id") String id)
	{
		Setup(model);
		Session session = factory.getCurrentSession();
		ProductList productList = (ProductList) session.get(ProductList.class, id);
		List<Product> listProducts = new ArrayList<>(productList.getProducts());
		model.addAttribute("listProducts", listProducts);
		return "/Shop/shop";
	}

	@RequestMapping("single-product")
	public String SingleProduct(ModelMap model)
	{
		Setup(model);
		return "/Shop/single-product";
	}
}
