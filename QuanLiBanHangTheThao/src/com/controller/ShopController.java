package com.controller;

import com.bean.Cart;
import com.bean.LinkedList;
import com.entity.Account;
import com.entity.Bill;
import com.entity.Brand;
import com.entity.CTBill;
import com.entity.CTHangHoa;
import com.entity.Comment;
import com.entity.Product;
import com.entity.ProductList;
import com.entity.Size;
import com.entity.WishList;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.websocket.server.PathParam;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	private static final int SHIP = 30000;
	
	@Autowired
	SessionFactory factory;
	@Autowired
	Mailer mailer;
	
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
	
	@ModelAttribute("myWishList")
	public List<WishList> withlist(HttpServletRequest request)
	{
		Session session = factory.getCurrentSession();
		List<WishList> list = null;
		if (checkCookie(request) != null)
		{
			Account account = (Account) session.get(Account.class, checkCookie(request).getUsername());
			list = new ArrayList<>(account.getWishLists());
		}
		
		return list;
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
	
	/*-------------------------------------------- PAGE ---------------------------------------------------*/
	//get time last modified
	String getLasttime(File file)
	{
		DateFormat dateFormat = new SimpleDateFormat("hh:mm:ss dd/MM/yyyy");  
		long time = file.lastModified(); 
		Date date = new Date(time);
		return dateFormat.format(date);
	}
	
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
		request.setAttribute("where", "GT");
		request.setAttribute("lastTime", getLasttime(x));	
		request.setAttribute("content", content);		
		return "/Shop/gioithieu";
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
		request.setAttribute("where", "CS");
		request.setAttribute("lastTime", getLasttime(x));	
		request.setAttribute("content", content);		
		return "/Shop/chinhsach";
	}

	/*--------------------------------------------------------------------------------------------------------*/
	
	@RequestMapping("wishlist")
	public String wishlist(ModelMap model, HttpServletRequest request)
	{
		Setup(model);
		request.setAttribute("where", "DSYT");
		return "/Shop/wishlist";
	}

	@RequestMapping(value = "contact", method = RequestMethod.GET)
	public String contact(HttpServletRequest request)
	{
		request.setAttribute("where", "LH");
		return "/Shop/contact";
	}
	
	@RequestMapping(value = "contact", method = RequestMethod.POST)
	public @ResponseBody String contactPost(HttpServletRequest request)
	{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		mailer.send(email, "n18dcat092@student.ptithcm.edu.vn", subject, "<strong> Họ và tên người gửi: " + name + "</strong>" +"<br>"+ message);
		
		return "";
	}
	
	@RequestMapping("index")
	public String index(ModelMap model, HttpServletRequest request)
	{
		Setup(model);
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
		size = list.size();
		List<Product> listFinal = new ArrayList<Product>();
		for (int i=0;i<size;i++)
		{
			if (i > 0 && i<= 12)
			{
				listFinal.add(list.get(i));
			}
		}
		request.setAttribute("here", "1" );
		request.setAttribute("countPage", (size/12)+1  );
		request.setAttribute("ProductFinal", listFinal);
		request.setAttribute("where", "TC");
		return "/Shop/index";
	}
	
	@RequestMapping(value = "index", params = { "page" })
	public String indexParam(ModelMap model, HttpServletRequest request, @PathParam("page") int page)
	{
		Setup(model);
		request.setAttribute("here", page );
		page--;
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
		size = list.size();
		List<Product> listFinal = new ArrayList<Product>();
		for (int i=0;i<size;i++)
		{
			if ( (i > (12*page)) && ( i<= (12* (page+1) )))
			{
				listFinal.add(list.get(i));
			}
		}
		request.setAttribute("countPage", (size/12)+1 );
		request.setAttribute("ProductFinal", listFinal);
		request.setAttribute("where", "TC");
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
		model.addAttribute("where", "GH");
		model.addAttribute("Money", AllMoney);
		model.addAttribute("Ship",	SHIP);
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
		
		size = listProducts.size();
		List<Product> listFinal = new ArrayList<Product>();
		for (int i=0;i<size;i++)
		{
			if (i > 0 && i<= 12)
			{
				listFinal.add(listProducts.get(i));
			}
		}
		
		model.addAttribute("here", "1" );
		model.addAttribute("link","shop"+id );
		model.addAttribute("countPage", (size/12)+1 );
		model.addAttribute("where", "DM");
		model.addAttribute("listProducts", listFinal);
		return "/Shop/shop";
	}
	
	@RequestMapping(value = "shop{id}", method = RequestMethod.GET, params = { "page" })
	public String shopProductParam(ModelMap model,@PathVariable("id") String id, @PathParam("page") int page)
	{
		Setup(model);
		model.addAttribute("here", page );
		page--;
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
		
		size = listProducts.size();
		List<Product> listFinal = new ArrayList<Product>();
		for (int i=0;i<size;i++)
		{
			if ( (i > (12*page)) && ( i<= (12* (page+1) )))
			{
				listFinal.add(listProducts.get(i));
			}
		}
		
		model.addAttribute("link","shop"+id );
		model.addAttribute("countPage", (size/12)+1 );
		model.addAttribute("where", "DM");
		model.addAttribute("listProducts", listFinal);
		return "/Shop/shop";
	}
	
	@RequestMapping(value = "search")
	public String search(HttpServletRequest request, ModelMap model)
	{
		Session session = factory.getCurrentSession();
		String keyword = request.getParameter("keyword");
		keyword = keyword.toLowerCase();
		String hql = "From Product";
		Query query = session.createQuery(hql);
		List<Product> products = query.list();
		List<Product> listProducts = new ArrayList<>();
		
		for (Product product : products) {
			if (product.getId().toLowerCase().contains(keyword) || product.getName().toLowerCase().contains(keyword))
			{
				if (!listProducts.contains(product))
				{
					listProducts.add(product);
				}
			}
		}
		model.addAttribute("keySearch", keyword);
		model.addAttribute("listProducts", listProducts);
		return "/Shop/search";
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
		
		size = listProducts.size();
		List<Product> listFinal = new ArrayList<Product>();
		for (int i=0;i<size;i++)
		{
			if (i > 0 && i<= 12)
			{
				listFinal.add(listProducts.get(i));
			}
		}
		model.addAttribute("here", "1" );
		model.addAttribute("link","brand"+id );
		model.addAttribute("countPage", (size/12)+1 );
		model.addAttribute("where", "DM");
		model.addAttribute("listProducts", listFinal);
		return "/Shop/shop";
	}
	
	@RequestMapping(value = "brand{id}", method = RequestMethod.GET, params = { "page" })
	public String shopBrandParam(ModelMap model,@PathVariable("id") String id, @PathParam("page") int page)
	{
		Setup(model);
		model.addAttribute("here", page );
		page--;
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
		
		size = listProducts.size();
		List<Product> listFinal = new ArrayList<Product>();
		for (int i=0;i<size;i++)
		{
			if ((i > (12*page)) && ( i<= (12* (page+1) )))
			{
				listFinal.add(listProducts.get(i));
			}
		}
		model.addAttribute("link","brand"+id );
		model.addAttribute("countPage", (size/12)+1 );
		model.addAttribute("where", "DM");
		model.addAttribute("listProducts", listFinal);
		return "/Shop/shop";
	}

	@RequestMapping(value ="SanPham-{id}", method = RequestMethod.GET)
	public String SingleProduct(ModelMap model,@PathVariable("id") String id)
	{
		Setup(model);
		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		product.setCT_HangHoa(new HashSet<CTHangHoa>(product.getCT_HangHoa()));
		product.setComments(new HashSet<Comment>(product.getComments()));
		model.addAttribute("detailProduct", product);
		return "/Shop/product-details";
	}
	
	// ---------------------------------------------------------------------------------------------------- Tạo đơn hàng ----------------------------------------------------------------------------------------------------

	
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
		bill.setTransportationFee(SHIP);
		
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
	
	// ---------------------------------------------------------------------------------------------------- Thêm bình luận ----------------------------------------------------------------------------------------------------

	
	@RequestMapping(value = "addComment",method = RequestMethod.POST)
	public @ResponseBody byte[] addCmt(HttpServletRequest request) throws UnsupportedEncodingException
	{
		String result ="";
		String idProduct = request.getParameter("id");
		Product product = new Product();
		product.setId(idProduct);
		String content = request.getParameter("content");
		
		Account account = checkCookie(request);
		Date date = new Date();
		Comment comment = new Comment(content, date, product, account);
		
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(comment);
			transaction.commit();
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
		}
		finally
		{
			session.close();
		}
		return result.getBytes("UTF-8");
	}
	
	// ---------------------------------------------------------------------------------------------------- Thêm vào danh sách yêu thích ----------------------------------------------------------------------------------------------------

	
	@RequestMapping(value = "addWishList",method = RequestMethod.POST)
	public @ResponseBody byte[] addWishList(HttpServletRequest request) throws UnsupportedEncodingException
	{	
		String result ="";
		Session session = factory.getCurrentSession();
		String id = request.getParameter("id");
		Product product = new Product();
		product.setId(id);
		
		Account account = (Account) session.get(Account.class, checkCookie(request).getUsername());
		List<WishList> list = new ArrayList<>(account.getWishLists());
		
		for (WishList wishList : list) {
			if (wishList.getSanPham().getId().equals(id))
				return result.getBytes("UTF-8");
		}
		
		WishList wishList = new WishList(account, product);
		account = checkCookie(request);

		
		
		session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(wishList);
			transaction.commit();
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
		}
		finally
		{
			session.close();
		}
		return result.getBytes("UTF-8");
	}
	
	@RequestMapping(value = "removeWishList",method = RequestMethod.POST)
	public @ResponseBody byte[] removeWishList(HttpServletRequest request) throws UnsupportedEncodingException
	{	
		String result ="";
		Session session = factory.getCurrentSession();
		String id = request.getParameter("id");		
		String username = checkCookie(request).getUsername();
		String hql = "From WishList where account.username = '"+username+"' AND sanPham.id = '" + id + "'";
		Query query = session.createQuery(hql);
		WishList wishList = (WishList) query.list().get(0);
		String idWishList = wishList.getId();
		
		session = factory.openSession();
		wishList = new WishList();
		wishList.setId(idWishList);
		
		Transaction transaction = session.beginTransaction();
		try {
			session.delete(wishList);
			transaction.commit();
		} catch (Exception e) {
			System.out.print(e);
			transaction.rollback();
		}
		finally
		{
			session.close();
		}
		return result.getBytes("UTF-8");
	}
	//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
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
