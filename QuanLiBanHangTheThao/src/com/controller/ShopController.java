package com.controller;

import com.bean.Cart;
import com.bean.LinkedList;
import com.entity.Account;
import com.entity.Bill;
import com.entity.Brand;
import com.entity.CTBill;
import com.entity.CTHangHoa;
import com.entity.Product;
import com.entity.ProductList;
import com.entity.Size;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

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
		int size = list.size();
		for (int i=0;i<size;i++)
		{
			if (!list.get(i).getStatus())
			{
				list.remove(i);
				size = list.size();
				i--;
			}
		}
		return list;
	}
	
	@ModelAttribute("listBrand")
	public List<Brand> listBrand()
	{
		Session session = factory.getCurrentSession();
		String hql ="FROM Brand";
		Query query = session.createQuery(hql);
		List<Brand> list= query.list();
		return list;
	}
	
	@ModelAttribute("myCartItems")
	public List<Cart> cartItems(HttpSession httpSession)
	{
		List<Cart> cartItems = (List<Cart>) httpSession.getAttribute("myCartItems");
		if (cartItems == null)
			cartItems = new ArrayList<Cart>();
		httpSession.setAttribute("myCartItems", cartItems);
		return cartItems;
	}
	
	
	
	@ModelAttribute("productList")
	public List<ProductList> getProductLists()
	{
		Session session = factory.getCurrentSession();
		String hql ="FROM ProductList";
		Query query = session.createQuery(hql);
		List<ProductList> productlist= query.list();
		return productlist;
	}
	
	@RequestMapping("Menu")
	public List<LinkedList> listMenu()
	{
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
		return menu;
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
	public String cart(ModelMap model,HttpSession httpSession)
	{
		Setup(model);
		List<Cart> cartItems = (List<Cart>) httpSession.getAttribute("myCartItems");
		if (cartItems == null)
			cartItems = new ArrayList<Cart>();
		float AllMoney = 0;
		Bill bill = new Bill();
		
		for (Cart cart : cartItems) {
			float temp = cart.getProduct().getMaHangHoa().getMoney() ;
			AllMoney += temp * cart.getCount();
		}
		
		model.addAttribute("Money", AllMoney);
		return "/Shop/cart";
	}
	
	@RequestMapping(value = "shop{id}", method = RequestMethod.GET)
	public String shopProduct(ModelMap model,@PathVariable("id") String id)
	{
		Setup(model);
		Session session = factory.getCurrentSession();
		ProductList productList = (ProductList) session.get(ProductList.class, id);
		List<Product> listProducts = new ArrayList<>(productList.getProducts());
		
//		Loại bỏ sự trùng lặp sản phẩm
		int size = listProducts.size();
		for (int i=0; i< size ; i++)
		{
			for (int j=i+1; j < size; j++)
			{
				if (listProducts.get(i).getId().equals(listProducts.get(j).getId()))
				{
					listProducts.remove(j);
					size = listProducts.size();
					j--;
				}
			}
		}
		
		for (int i=0;i<size;i++)
		{
			if (!listProducts.get(i).getStatus())
			{
				listProducts.remove(i);
				size = listProducts.size();
				i--;
			}
		}
		
		model.addAttribute("listProducts", listProducts);
		return "/Shop/shop";
	}
	
	@RequestMapping(value = "brand{id}", method = RequestMethod.GET)
	public String shopBrand(ModelMap model,@PathVariable("id") String id)
	{
		Setup(model);
		Session session = factory.getCurrentSession();
		Brand brand = (Brand) session.get(Brand.class, id);
		List<Product> listProducts = new ArrayList<>(brand.getProducts());
		
//		Loại bỏ sự trùng lặp sản phẩm
		int size = listProducts.size();
		for (int i=0; i< size ; i++)
		{
			for (int j=i+1; j < size; j++)
			{
				if (listProducts.get(i).getId().equals(listProducts.get(j).getId()))
				{
					listProducts.remove(j);
					size = listProducts.size();
					j--;
				}
			}
		}
		
		for (int i=0;i<size;i++)
		{
			if (!listProducts.get(i).getStatus())
			{
				listProducts.remove(i);
				size = listProducts.size();
				i--;
			}
		}
		
		model.addAttribute("listProducts", listProducts);
		return "/Shop/shop";
	}

	@RequestMapping(value ="SanPham-{id}", method = RequestMethod.GET)
	public String SingleProduct(ModelMap model,@PathVariable("id") String id)
	{
		Setup(model);
		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		model.addAttribute("detailProduct", product);
		return "/Shop/product-details";
	}
	
	@RequestMapping(value = "addCart", method = RequestMethod.POST)
	public @ResponseBody String addToCart(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
	{
		List<Cart> cartItems = (List<Cart>) httpSession.getAttribute("myCartItems");
		if (cartItems == null)
			cartItems = new ArrayList<Cart>();
		Session session = factory.getCurrentSession();
		String size = request.getParameter("size");
		String id = request.getParameter("id");
		int Count = Integer.valueOf(request.getParameter("count"));
		if (Count == 0)
			return String.valueOf(cartItems.size());
		
		if (size.isEmpty())
			size = "5";
		
		for (Cart cart : cartItems) {
			if (cart.getProduct().getMaHangHoa().getId().equals(id) && cart.getProduct().getSize().getId().equals(size))
			{
				if ((cart.getCount() + Count) <= cart.getProduct().getSoLuong())
					cart.setCount(cart.getCount() + Count);
				return String.valueOf(cartItems.size());
			}
		}
		String hql = "From CTHangHoa where MaHangHoa.id= '"+id+"' and size.id='"+size+"'";
		Query query = session.createQuery(hql);
		
		CTHangHoa hangHoa = (CTHangHoa) query.list().get(0);
		Cart cart = new Cart(hangHoa, Count);
		cartItems.add(cart);
		httpSession.setAttribute("myCartItems", cartItems);
		return String.valueOf(cartItems.size());
	}
	
	@RequestMapping(value = "editCart",method = RequestMethod.POST)
	public @ResponseBody String editCart(HttpSession httpSession, HttpServletRequest request)
	{
		int money =0;
		String productId = request.getParameter("id_product");
		String sizeId = request.getParameter("size_product");
		int count = Integer.valueOf(request.getParameter("count_product"));
		List<Cart> cartItems = (List<Cart>) httpSession.getAttribute("myCartItems");
		for (int i=0; i<cartItems.size();i++)
		{
			CTHangHoa ctHangHoa = cartItems.get(i).getProduct();
			if (ctHangHoa.getMaHangHoa().getId().equals(productId) && ctHangHoa.getSize().getId().equals(sizeId))
			{
				cartItems.get(i).setCount(count);
			}
			money += ctHangHoa.getMaHangHoa().getMoney() * cartItems.get(i).getCount();
		}
		return String.valueOf(money);
	}
	
	@RequestMapping(value = "removeItem",method = RequestMethod.POST)
	public @ResponseBody String removeItem(HttpSession httpSession, HttpServletRequest request)
	{
		String productId = request.getParameter("id_product");
		String sizeId = request.getParameter("size_product");
		List<Cart> cartItems = (List<Cart>) httpSession.getAttribute("myCartItems");
		for (int i=0; i<cartItems.size();i++)
		{
			CTHangHoa ctHangHoa = cartItems.get(i).getProduct();
			if (ctHangHoa.getMaHangHoa().getId().equals(productId) && ctHangHoa.getSize().getId().equals(sizeId))
			{
				cartItems.remove(i);
				break;
			}
		}
		httpSession.setAttribute("myCartItems", cartItems);
		return "";
	}
	
	@RequestMapping(value = "pay",method = RequestMethod.POST)
	public @ResponseBody String pay(HttpSession httpSession, HttpServletRequest request)
	{
		int money =0;
		String address = request.getParameter("address") + ", " + request.getParameter("district") + ", " + request.getParameter("province");
		List<Cart> cartItems = (List<Cart>) httpSession.getAttribute("myCartItems");
		for (int i=0; i<cartItems.size();i++)
		{
			CTHangHoa ctHangHoa = cartItems.get(i).getProduct();
			
			money += ctHangHoa.getMaHangHoa().getMoney() * cartItems.get(i).getCount();
		}
		Date date = new Date();
		
		Bill bill = new Bill();
		bill.setAddress(address);
		bill.setDate(date);
		bill.setStatus(false);
		bill.setMoneyProduct(money);
		bill.setTransportationFee(0);
		bill.setAccount(checkCookie(request));
		bill.setStaff(null);
		
		Session session = factory.openSession(); 
		Transaction transaction = session.beginTransaction();

		try {
			session.save(bill);
			for (Cart cart : cartItems) {
				
				CTBill ctBill = new CTBill();
				ctBill.setBill(bill);
				ctBill.setcTHangHoa(cart.getProduct());
				ctBill.setCount(cart.getCount());
				ctBill.setPromotion(cart.getProduct().getMaHangHoa().getDiscount());			
				ctBill.setUnitPrice(cart.getProduct().getMaHangHoa().getPrice());
				session.save(ctBill);
				
				
				CTHangHoa ctHangHoa = new CTHangHoa(cart.getProduct().getMaHangHoa(), cart.getProduct().getSize());
				ctHangHoa.setSoLuong(cart.getProduct().getSoLuong() - cart.getCount());
				session.update(ctHangHoa);

			}
			transaction.commit();
			cartItems = new ArrayList<Cart>();
			httpSession.setAttribute("myCartItems", cartItems);
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
			// TODO: handle exception
		}
		finally {
			session.close();
		}
		
		
		
		return String.valueOf(money);
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
}
