package com.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.BillReports;
import com.bean.ReceiptReport;
import com.bean.StaffReport;
import com.bean.StaffReport.MainReport;
import com.entity.Bill;
import com.entity.CTBill;
import com.entity.Receipt;
import com.entity.Staff;

@Transactional
@Controller
@RequestMapping("/admin/thongke/")
public class ThongKeController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("doanhthu")
	public String doanhthu(ModelMap model,@RequestParam( value = "tuNgay" ,defaultValue = "") String from,
			@RequestParam( value = "toiNgay",defaultValue = "") String to) {
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
		LocalDateTime now = LocalDateTime.now();  
		if(to.isEmpty() || to == null) {
		    
		    to = dtf.format(now);  
		}
		if(from.isEmpty() || from == null) {
		    now = now.minusMonths(1);
		    from = dtf.format(now);  
		}
		
		List<Bill> bills = getBills_byDate(from, to);
		List<BillReports> objectReports = new ArrayList<BillReports>();
		List<Bill> reportBills = new ArrayList<Bill>();
		
		Calendar cFrom = Calendar.getInstance();
		Calendar cTo = Calendar.getInstance();
		
		Date tmp_Date;
		try {
			tmp_Date = new SimpleDateFormat("yyyy-MM-dd").parse(from);
			cFrom.setTime(tmp_Date);
			
			tmp_Date = new SimpleDateFormat("yyyy-MM-dd").parse(to);
			cTo.setTime(tmp_Date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
		int tmp_money = 0, total_proudct =0;
		int id=0;
		while(cFrom.compareTo(cTo) <= 0)
		{
			String tmpDate = dateFormat.format(cFrom.getTime());
			for (int i=0; i< bills.size(); i++)
			{
				if (!bills.get(i).isStatus())
				{
					bills.remove(i);
					i--;
					continue;
				}
				
				Calendar cTmp = Calendar.getInstance();
				cTmp.setTime(bills.get(i).getDate());
				if (cTmp.compareTo(cFrom) == 0)
				{
					reportBills.add(bills.get(i));
					tmp_money += bills.get(i).getMoneyProduct();
					for(CTBill ct : bills.get(i).getCtBills()) {
						total_proudct += ct.getCount();
					}
					bills.remove(bills.get(i));
					i--;
					continue;
				}
			}
			
			ArrayList<Integer> integers = new ArrayList<>();
			integers.add(total_proudct);
			integers.add(tmp_money);
			BillReports report = new BillReports(id, tmpDate, reportBills, integers);
			objectReports.add(report);
			
			reportBills = new ArrayList<Bill>();
			tmp_money =0;
			total_proudct = 0;
			id++;
			cFrom.add(Calendar.DATE, 1);
		}
		
		model.addAttribute("objectReports", objectReports);
		model.addAttribute("tuNgay",from);
		model.addAttribute("toiNgay",to);
		
		return "admin/thongke/doanhthu";
	}
	
	@RequestMapping("doanhthu-thang")
	public String doanhthuThang(ModelMap model,@RequestParam( value = "tuNgay" ,defaultValue = "") String from,
			@RequestParam( value = "toiNgay",defaultValue = "") String to) {
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM");  
		LocalDateTime now = LocalDateTime.now();  
		if(to.isEmpty() || to == null) {
		    
		    to = dtf.format(now);  
		}
		if(from.isEmpty() || from == null) {
		    now = now.minusMonths(1);
		    from = dtf.format(now);  
		}
		
		List<Bill> bills = getBills_byMonth(from, to);
		List<BillReports> objectReports = new ArrayList<BillReports>();
		List<Bill> reportBills = new ArrayList<Bill>();
		
		Calendar cFrom = Calendar.getInstance();
		Calendar cTo = Calendar.getInstance();
		
		Date tmp_Date;
		try {
			tmp_Date = new SimpleDateFormat("yyyy-MM").parse(from);
			cFrom.setTime(tmp_Date);
			
			tmp_Date = new SimpleDateFormat("yyyy-MM").parse(to);
			cTo.setTime(tmp_Date);
			cTo.set(Calendar.DATE, cFrom.get(Calendar.DATE));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DateFormat dateFormat = new SimpleDateFormat("MM/yyyy");  
		int tmp_money = 0, total_proudct =0;
		int id=0;
		while(cFrom.compareTo(cTo) <= 0)
		{
			String tmpDate = dateFormat.format(cFrom.getTime());
			for (int i=0; i< bills.size(); i++)
			{
				if (!bills.get(i).isStatus())
				{
					bills.remove(i);
					i--;
					continue;
				}
				
				Calendar cTmp = Calendar.getInstance();
				cTmp.setTime(bills.get(i).getDate());
				cTmp.set(Calendar.DATE, cFrom.get(Calendar.DATE));
				if (cTmp.compareTo(cFrom) == 0)
				{
					reportBills.add(bills.get(i));
					tmp_money += bills.get(i).getMoneyProduct();
					for(CTBill ct : bills.get(i).getCtBills()) {
						total_proudct += ct.getCount();
					}
					bills.remove(bills.get(i));
					i--;
					continue;
				}
			}
			
			ArrayList<Integer> integers = new ArrayList<>();
			integers.add(total_proudct);
			integers.add(tmp_money);
			BillReports report = new BillReports(id, tmpDate, reportBills, integers);
			objectReports.add(report);
			
			reportBills = new ArrayList<Bill>();
			tmp_money =0;
			total_proudct = 0;
			id++;
			cFrom.add(Calendar.MONTH, 1);
		}
		
		model.addAttribute("objectReports", objectReports);
		model.addAttribute("tuNgay",from);
		model.addAttribute("toiNgay",to);
		
		return "admin/thongke/doanhthu-thang";
	}
	
	@RequestMapping("doanhthu-nam")
	public String doanhthuNam(ModelMap model,@RequestParam( value = "tuNgay" ,defaultValue = "") String from,
			@RequestParam( value = "toiNgay",defaultValue = "") String to) {
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy");  
		LocalDateTime now = LocalDateTime.now();  
		if(to.isEmpty() || to == null) {
		    
		    to = dtf.format(now);  
		}
		if(from.isEmpty() || from == null) {
		    now = now.minusMonths(1);
		    from = dtf.format(now);  
		}
		
		List<Bill> bills = getBills_byYear(from, to);
		List<BillReports> objectReports = new ArrayList<BillReports>();
		List<Bill> reportBills = new ArrayList<Bill>();
		
		Calendar cFrom = Calendar.getInstance();
		Calendar cTo = Calendar.getInstance();
		
		Date tmp_Date;
		try {
			tmp_Date = new SimpleDateFormat("yyyy").parse(from);
			cFrom.setTime(tmp_Date);
			
			tmp_Date = new SimpleDateFormat("yyyy").parse(to);
			cTo.setTime(tmp_Date);
			cTo.set(Calendar.MONTH, cFrom.get(Calendar.MONTH));
			cTo.set(Calendar.DATE, cFrom.get(Calendar.DATE));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy");  
		int tmp_money = 0, total_proudct =0;
		int id=0;
		while(cFrom.compareTo(cTo) <= 0)
		{
			String tmpDate = dateFormat.format(cFrom.getTime());
			for (int i=0; i< bills.size(); i++)
			{
				if (!bills.get(i).isStatus())
				{
					bills.remove(i);
					i--;
					continue;
				}
				
				Calendar cTmp = Calendar.getInstance();
				cTmp.setTime(bills.get(i).getDate());
				cTmp.set(Calendar.DATE, cFrom.get(Calendar.DATE));
				cTmp.set(Calendar.MONTH, cFrom.get(Calendar.MONTH));
				if (cTmp.compareTo(cFrom) == 0)
				{
					reportBills.add(bills.get(i));
					tmp_money += bills.get(i).getMoneyProduct();
					for(CTBill ct : bills.get(i).getCtBills()) {
						total_proudct += ct.getCount();
					}
					bills.remove(bills.get(i));
					i--;
					continue;
				}
			}
			
			ArrayList<Integer> integers = new ArrayList<>();
			integers.add(total_proudct);
			integers.add(tmp_money);
			BillReports report = new BillReports(id, tmpDate, reportBills, integers);
			objectReports.add(report);
			
			reportBills = new ArrayList<Bill>();
			tmp_money =0;
			total_proudct = 0;
			id++;
			cFrom.add(Calendar.YEAR, 1);
		}
		
		model.addAttribute("objectReports", objectReports);
		model.addAttribute("tuNgay",from);
		model.addAttribute("toiNgay",to);
		
		return "admin/thongke/doanhthu-nam";
	}
	
	@RequestMapping(value="thongKeNV")
	public String summaryEmployees(ModelMap model,@RequestParam( value = "tuNgay" ,defaultValue = "") String from,
			@RequestParam( value = "toiNgay",defaultValue = "") String to)
	{
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
		LocalDateTime now = LocalDateTime.now();  
		if(to.isEmpty() || to == null) {
		    
		    to = dtf.format(now);  
		}
		if(from.isEmpty() || from == null) {
		    now = now.minusMonths(1);
		    from = dtf.format(now);  
		}  
	    
	    Calendar cFrom = Calendar.getInstance();
		Calendar cTo = Calendar.getInstance();
		Date tmp_Date;
		try {
			tmp_Date = new SimpleDateFormat("yyyy-MM-dd").parse(from);
			cFrom.setTime(tmp_Date);
			
			tmp_Date = new SimpleDateFormat("yyyy-MM-dd").parse(to);
			cTo.setTime(tmp_Date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<Bill> bills = getBills_byDate(from, to);
		List<Staff> staffs = new ArrayList<>();
		int i;
		for (i=0; i< bills.size(); i++)
		{
			if (!bills.get(i).isStatus())
			{
				bills.remove(i);
				i--;
			}
			else
			{
				if (!staffs.contains(bills.get(i).getStaff()))
				{
					staffs.add(bills.get(i).getStaff());
				}
			}
			
		}
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  

		//List<SummaryNv> summaryNVList = new ArrayList();		
		List<StaffReport> staffReports = new ArrayList<>();
		
		int id=0;
		while(cFrom.compareTo(cTo) <= 0)
		{
			//set đối tương StaffReport
			StaffReport tmpStaffReport = new StaffReport();
			tmpStaffReport.setDate(dateFormat.format(cFrom.getTime()));
			
			List<MainReport> mainReports = new ArrayList<StaffReport.MainReport>();
			//vòng lặp lấy dữ liệu
			for (Staff staff : staffs) {
				List<Bill> tmpBills = new ArrayList<Bill>(); //lấy danh sách hóa đơn cùng ngày và cùng staff
				int tmp_money=0, total_proudct=0;
				MainReport mainReport = new MainReport();
				mainReport.setStaff(staff);
				
				for (i=0; i< bills.size(); i++)
				{				
					Calendar cTmp = Calendar.getInstance();
					cTmp.setTime(bills.get(i).getDate());
					if (cTmp.compareTo(cFrom) == 0 && bills.get(i).getStaff() == staff)
					{
						tmpBills.add(bills.get(i));
						tmp_money += bills.get(i).getMoneyProduct();
						for(CTBill ct : bills.get(i).getCtBills()) {
							total_proudct += ct.getCount();
						}
						bills.remove(bills.get(i));
						i--;
					}					
					
				}
				//mỗi ngày, mỗi nhân viên sẽ có mỗi mainReport
				ArrayList<Integer> integers = new ArrayList<>();
				integers.add(total_proudct);
				integers.add(tmp_money);
				
				mainReport.setBills(tmpBills);
				mainReport.setValue(integers);
				
				mainReports.add(mainReport);
			}	
			//add staffReport to list
			tmpStaffReport.setMainList(mainReports);
			staffReports.add(tmpStaffReport);
			
			//reset và cộng id
			id++;
			cFrom.add(Calendar.DATE, 1);
		}
		model.addAttribute("staffs", staffs);
		model.addAttribute("tuNgay",from);
		model.addAttribute("toiNgay",to);
		model.addAttribute("staffReports", staffReports);
		return "admin/thongke/thongKeNV";
	}
	
	@RequestMapping(value="thongKeNV-thang")
	public String summaryEmployeesMonth(ModelMap model,@RequestParam( value = "tuNgay" ,defaultValue = "") String from,
			@RequestParam( value = "toiNgay",defaultValue = "") String to)
	{
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM");  
		LocalDateTime now = LocalDateTime.now();  
		if(to.isEmpty() || to == null) {
		    
		    to = dtf.format(now);  
		}
		if(from.isEmpty() || from == null) {
		    now = now.minusMonths(1);
		    from = dtf.format(now);  
		}  
	    
	    Calendar cFrom = Calendar.getInstance();
		Calendar cTo = Calendar.getInstance();
		Date tmp_Date;
		try {
			tmp_Date = new SimpleDateFormat("yyyy-MM").parse(from);
			cFrom.setTime(tmp_Date);
			
			tmp_Date = new SimpleDateFormat("yyyy-MM").parse(to);
			cTo.setTime(tmp_Date);
			cTo.set(Calendar.DATE, cFrom.get(Calendar.DATE));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<Bill> bills = getBills_byMonth(from, to);
		List<Staff> staffs = new ArrayList<>();
		int i;
		for (i=0; i< bills.size(); i++)
		{
			if (!bills.get(i).isStatus())
			{
				bills.remove(i);
				i--;
			}
			else
			{
				if (!staffs.contains(bills.get(i).getStaff()))
				{
					staffs.add(bills.get(i).getStaff());
				}
			}
			
		}
		DateFormat dateFormat = new SimpleDateFormat("MM/yyyy");  
		List<StaffReport> staffReports = new ArrayList<>();
		
		int id=0;
		while(cFrom.compareTo(cTo) <= 0)
		{
			//set đối tương StaffReport
			StaffReport tmpStaffReport = new StaffReport();
			tmpStaffReport.setDate(dateFormat.format(cFrom.getTime()));
			
			List<MainReport> mainReports = new ArrayList<StaffReport.MainReport>();
			//vòng lặp lấy dữ liệu
			for (Staff staff : staffs) {
				List<Bill> tmpBills = new ArrayList<Bill>(); //lấy danh sách hóa đơn cùng ngày và cùng staff
				int tmp_money=0, total_proudct=0;
				MainReport mainReport = new MainReport();
				mainReport.setStaff(staff);
				
				for (i=0; i< bills.size(); i++)
				{				
					Calendar cTmp = Calendar.getInstance();
					cTmp.setTime(bills.get(i).getDate());
					cTmp.set(Calendar.DATE, cFrom.get(Calendar.DATE));
					if (cTmp.compareTo(cFrom) == 0 && bills.get(i).getStaff() == staff)
					{
						tmpBills.add(bills.get(i));
						tmp_money += bills.get(i).getMoneyProduct();
						for(CTBill ct : bills.get(i).getCtBills()) {
							total_proudct += ct.getCount();
						}
						bills.remove(bills.get(i));
						i--;
					}					
					
				}
				//mỗi ngày, mỗi nhân viên sẽ có mỗi mainReport
				ArrayList<Integer> integers = new ArrayList<>();
				integers.add(total_proudct);
				integers.add(tmp_money);
				
				mainReport.setBills(tmpBills);
				mainReport.setValue(integers);
				
				mainReports.add(mainReport);
			}	
			//add staffReport to list
			tmpStaffReport.setMainList(mainReports);
			staffReports.add(tmpStaffReport);
			
			//reset và cộng id
			id++;
			cFrom.add(Calendar.MONTH, 1);
		}
		model.addAttribute("staffs", staffs);
		model.addAttribute("tuNgay",from);
		model.addAttribute("toiNgay",to);
		model.addAttribute("staffReports", staffReports);
		return "admin/thongke/thongKeNV-thang";
	}
	
	@RequestMapping(value="thongKeNV-nam")
	public String summaryEmployeesYear(ModelMap model,@RequestParam( value = "tuNgay" ,defaultValue = "") String from,
			@RequestParam( value = "toiNgay",defaultValue = "") String to)
	{
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy");  
		LocalDateTime now = LocalDateTime.now();  
		if(to.isEmpty() || to == null) {
		    
		    to = dtf.format(now);  
		}
		if(from.isEmpty() || from == null) {
		    now = now.minusMonths(1);
		    from = dtf.format(now);  
		}  
	    
	    Calendar cFrom = Calendar.getInstance();
		Calendar cTo = Calendar.getInstance();
		Date tmp_Date;
		try {
			tmp_Date = new SimpleDateFormat("yyyy").parse(from);
			cFrom.setTime(tmp_Date);
			
			tmp_Date = new SimpleDateFormat("yyyy").parse(to);
			cTo.setTime(tmp_Date);
			cTo.set(Calendar.MONTH, cFrom.get(Calendar.MONTH));
			cTo.set(Calendar.DATE, cFrom.get(Calendar.DATE));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<Bill> bills = getBills_byYear(from, to);
		List<Staff> staffs = new ArrayList<>();
		int i;
		for (i=0; i< bills.size(); i++)
		{
			if (!bills.get(i).isStatus())
			{
				bills.remove(i);
				i--;
			}
			else
			{
				if (!staffs.contains(bills.get(i).getStaff()))
				{
					staffs.add(bills.get(i).getStaff());
				}
			}
			
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy");  
		List<StaffReport> staffReports = new ArrayList<>();
		
		int id=0;
		while(cFrom.compareTo(cTo) <= 0)
		{
			//set đối tương StaffReport
			StaffReport tmpStaffReport = new StaffReport();
			tmpStaffReport.setDate(dateFormat.format(cFrom.getTime()));
			
			List<MainReport> mainReports = new ArrayList<StaffReport.MainReport>();
			//vòng lặp lấy dữ liệu
			for (Staff staff : staffs) {
				List<Bill> tmpBills = new ArrayList<Bill>(); //lấy danh sách hóa đơn cùng ngày và cùng staff
				int tmp_money=0, total_proudct=0;
				MainReport mainReport = new MainReport();
				mainReport.setStaff(staff);
				
				for (i=0; i< bills.size(); i++)
				{				
					Calendar cTmp = Calendar.getInstance();
					cTmp.setTime(bills.get(i).getDate());
					cTmp.set(Calendar.DATE, cFrom.get(Calendar.DATE));
					cTmp.set(Calendar.MONTH, cFrom.get(Calendar.MONTH));
					if (cTmp.compareTo(cFrom) == 0 && bills.get(i).getStaff() == staff)
					{
						tmpBills.add(bills.get(i));
						tmp_money += bills.get(i).getMoneyProduct();
						for(CTBill ct : bills.get(i).getCtBills()) {
							total_proudct += ct.getCount();
						}
						bills.remove(bills.get(i));
						i--;
					}					
					
				}
				//mỗi ngày, mỗi nhân viên sẽ có mỗi mainReport
				ArrayList<Integer> integers = new ArrayList<>();
				integers.add(total_proudct);
				integers.add(tmp_money);
				
				mainReport.setBills(tmpBills);
				mainReport.setValue(integers);
				
				mainReports.add(mainReport);
			}	
			//add staffReport to list
			tmpStaffReport.setMainList(mainReports);
			staffReports.add(tmpStaffReport);
			
			//reset và cộng id
			id++;
			cFrom.add(Calendar.YEAR, 1);
		}
		model.addAttribute("staffs", staffs);
		model.addAttribute("tuNgay",from);
		model.addAttribute("toiNgay",to);
		model.addAttribute("staffReports", staffReports);
		return "admin/thongke/thongKeNV-nam";
	}
	
	private List<Bill> getBills_byDate(String from, String to){

		SimpleDateFormat formatter1 = new  SimpleDateFormat("yyyy-MM-dd");  
		
		Date fromDate; 
		Date toDate;
		try {
			fromDate = formatter1.parse(from);  
			toDate = formatter1.parse(to);  
			
		}
		catch(Exception e) {
			return new ArrayList<Bill>();
		}
		
		
		Session session = factory.getCurrentSession();
		String hql = "From Bill b where b.date >= :from and b.date <= :to ";
		Query query = session.createQuery(hql);
		
		query.setDate("from", fromDate);
		query.setDate("to", toDate);
		
		List<Bill> bills = query.list();
		
		return bills;
	}
	
	private List<Bill> getBills_byMonth(String from, String to){

		SimpleDateFormat formatter1 = new  SimpleDateFormat("yyyy-MM");  
		Date fromDate; 
		Date toDate;
		try {
			fromDate = formatter1.parse(from);  
			toDate = formatter1.parse(to);  
			toDate.setMonth(toDate.getMonth()+1);
			toDate.setDate(toDate.getDate()-1);
		}
		catch(Exception e) {
			return new ArrayList<Bill>();
		}
		
		
		Session session = factory.getCurrentSession();
		String hql = "From Bill b where b.date >= :from and b.date <= :to ";
		Query query = session.createQuery(hql);
		
		query.setDate("from", fromDate);
		query.setDate("to", toDate);
		
		List<Bill> bills = query.list();
		
		return bills;
	}
	
	private List<Bill> getBills_byYear(String from, String to){

		SimpleDateFormat formatter1 = new  SimpleDateFormat("yyyy");  
		Date fromDate; 
		Date toDate;
		try {
			fromDate = formatter1.parse(from);  
			toDate = formatter1.parse(to);  
			toDate.setYear(toDate.getYear()+1);
			toDate.setDate(toDate.getDate()-1);
		}
		catch(Exception e) {
			return new ArrayList<Bill>();
		}
		
		
		Session session = factory.getCurrentSession();
		String hql = "From Bill b where b.date >= :from and b.date <= :to ";
		Query query = session.createQuery(hql);
		
		query.setDate("from", fromDate);
		query.setDate("to", toDate);
		
		List<Bill> bills = query.list();
		
		return bills;
	}
	
	// ------------------------------------------------------ Thống kê phiếu nhập ----------------------------------------------
	@RequestMapping("thongKeNhapHang")
	public String thongkeNH(ModelMap model,@RequestParam( value = "tuNgay" ,defaultValue = "") String from,
			@RequestParam( value = "toiNgay",defaultValue = "") String to)
	{
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
		LocalDateTime now = LocalDateTime.now();  
		if(to.isEmpty() || to == null) {
		    
		    to = dtf.format(now);  
		}
		if(from.isEmpty() || from == null) {
		    now = now.minusMonths(1);
		    from = dtf.format(now);  
		} 
		Date fromDate = null; 
		Date toDate = null;
		
		SimpleDateFormat formatter1 = new  SimpleDateFormat("yyyy-MM-dd");  
		try {
			fromDate = formatter1.parse(from);  
			toDate = formatter1.parse(to);  
			
		}
		catch(Exception e) {
		}
		
		Session session = factory.getCurrentSession();
		String hql = "From Receipt r where r.date >= :from and r.date <= :to ";
		Query query = session.createQuery(hql);
		query.setDate("from", fromDate);
		query.setDate("to", toDate);
		
		List<Receipt> receipts = query.list();
		List<ReceiptReport> receiptReports = new ArrayList<ReceiptReport>();
		
		Calendar cFrom = Calendar.getInstance();
		Calendar cTo = Calendar.getInstance();
		Date tmp_Date;
		try {
			tmp_Date = new SimpleDateFormat("yyyy-MM-dd").parse(from);
			cFrom.setTime(tmp_Date);
			
			tmp_Date = new SimpleDateFormat("yyyy-MM-dd").parse(to);
			cTo.setTime(tmp_Date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int id=0;
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  
		while(cFrom.compareTo(cTo) <= 0)
		{
			ReceiptReport report = new ReceiptReport();
			report.setDate(dateFormat.format(cFrom.getTime()));
			List<Receipt> tmpReceipts = new ArrayList<Receipt>();
			int tmp =0; //tmp1: Số lượng loại hàng nhập
			
			for(int i=0; i<receipts.size();i++)
			{
				Calendar cTmp = Calendar.getInstance();
				cTmp.setTime(receipts.get(i).getDate());
				if (cFrom.compareTo(cTmp) == 0)
				{
					tmpReceipts.add(receipts.get(i));
					tmp += receipts.get(i).getCtPhieuNhaps().size();
					receipts.remove(i);
					i--;
				}
			}
			
			report.setId(id);
			report.setReceipts(tmpReceipts);
			report.setCountProduct(tmp);
			
			receiptReports.add(report);
			id++;
			cFrom.add(Calendar.DATE, 1);
		}
		model.addAttribute("tuNgay",from);
		model.addAttribute("toiNgay",to);
		model.addAttribute("receiptReports", receiptReports);
		return "admin/thongke/thongKeNhapHang";
	}
	
	@RequestMapping("thongKeNhapHang-thang")
	public String thongkeNHThang(ModelMap model,@RequestParam( value = "tuNgay" ,defaultValue = "") String from,
			@RequestParam( value = "toiNgay",defaultValue = "") String to)
	{
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM");  
		LocalDateTime now = LocalDateTime.now();  
		if(to.isEmpty() || to == null) {
		    
		    to = dtf.format(now);  
		}
		if(from.isEmpty() || from == null) {
		    now = now.minusMonths(1);
		    from = dtf.format(now);  
		} 
		Date fromDate = null; 
		Date toDate = null;
		
		SimpleDateFormat formatter1 = new  SimpleDateFormat("yyyy-MM");  
		try {
			fromDate = formatter1.parse(from);  
			toDate = formatter1.parse(to);  
			toDate.setMonth(toDate.getMonth()+1);
			toDate.setDate(toDate.getDate()-1);
		}
		catch(Exception e) {
		}
		
		Session session = factory.getCurrentSession();
		String hql = "From Receipt r where r.date >= :from and r.date <= :to ";
		Query query = session.createQuery(hql);
		query.setDate("from", fromDate);
		query.setDate("to", toDate);
		
		List<Receipt> receipts = query.list();
		List<ReceiptReport> receiptReports = new ArrayList<ReceiptReport>();
		
		Calendar cFrom = Calendar.getInstance();
		Calendar cTo = Calendar.getInstance();
		Date tmp_Date;
		try {
			tmp_Date = new SimpleDateFormat("yyyy-MM").parse(from);
			cFrom.setTime(tmp_Date);
			
			tmp_Date = new SimpleDateFormat("yyyy-MM").parse(to);
			cTo.setTime(tmp_Date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int id=0;
		DateFormat dateFormat = new SimpleDateFormat("MM/yyyy");  
		while(cFrom.compareTo(cTo) <= 0)
		{
			ReceiptReport report = new ReceiptReport();
			report.setDate(dateFormat.format(cFrom.getTime()));
			List<Receipt> tmpReceipts = new ArrayList<Receipt>();
			int tmp =0; //tmp1: Số lượng loại hàng nhập
			
			for(int i=0; i<receipts.size();i++)
			{
				Calendar cTmp = Calendar.getInstance();
				cTmp.setTime(receipts.get(i).getDate());
				cTmp.set(Calendar.DATE, cFrom.get(Calendar.DATE));
				if (cFrom.compareTo(cTmp) == 0)
				{
					tmpReceipts.add(receipts.get(i));
					tmp += receipts.get(i).getCtPhieuNhaps().size();
					receipts.remove(i);
					i--;
				}
			}
			
			report.setId(id);
			report.setReceipts(tmpReceipts);
			report.setCountProduct(tmp);
			
			receiptReports.add(report);
			id++;
			cFrom.add(Calendar.MONTH, 1);
		}
		model.addAttribute("tuNgay",from);
		model.addAttribute("toiNgay",to);
		model.addAttribute("receiptReports", receiptReports);
		return "admin/thongke/thongKeNhapHang-thang";
	}
	
	@RequestMapping("thongKeNhapHang-nam")
	public String thongkeNHNam(ModelMap model,@RequestParam( value = "tuNgay" ,defaultValue = "") String from,
			@RequestParam( value = "toiNgay",defaultValue = "") String to)
	{
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy");  
		LocalDateTime now = LocalDateTime.now();  
		if(to.isEmpty() || to == null) {
		    
		    to = dtf.format(now);  
		}
		if(from.isEmpty() || from == null) {
		    now = now.minusMonths(1);
		    from = dtf.format(now);  
		} 
		Date fromDate = null; 
		Date toDate = null;
		
		SimpleDateFormat formatter1 = new  SimpleDateFormat("yyyy");  
		try {
			fromDate = formatter1.parse(from);  
			toDate = formatter1.parse(to);  
			toDate.setYear(toDate.getYear()+1);
			toDate.setDate(toDate.getDate()-1);
		}
		catch(Exception e) {
		}
		
		Session session = factory.getCurrentSession();
		String hql = "From Receipt r where r.date >= :from and r.date <= :to ";
		Query query = session.createQuery(hql);
		query.setDate("from", fromDate);
		query.setDate("to", toDate);
		
		List<Receipt> receipts = query.list();
		List<ReceiptReport> receiptReports = new ArrayList<ReceiptReport>();
		
		Calendar cFrom = Calendar.getInstance();
		Calendar cTo = Calendar.getInstance();
		Date tmp_Date;
		try {
			tmp_Date = new SimpleDateFormat("yyyy").parse(from);
			cFrom.setTime(tmp_Date);
			
			tmp_Date = new SimpleDateFormat("yyyy").parse(to);
			cTo.setTime(tmp_Date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int id=0;
		DateFormat dateFormat = new SimpleDateFormat("yyyy");  
		while(cFrom.compareTo(cTo) <= 0)
		{
			ReceiptReport report = new ReceiptReport();
			report.setDate(dateFormat.format(cFrom.getTime()));
			List<Receipt> tmpReceipts = new ArrayList<Receipt>();
			int tmp =0; //tmp1: Số lượng loại hàng nhập
			
			for(int i=0; i<receipts.size();i++)
			{
				Calendar cTmp = Calendar.getInstance();
				cTmp.setTime(receipts.get(i).getDate());
				cTmp.set(Calendar.DATE, cFrom.get(Calendar.DATE));
				cTmp.set(Calendar.MONTH, cFrom.get(Calendar.MONTH));
				if (cFrom.compareTo(cTmp) == 0)
				{
					tmpReceipts.add(receipts.get(i));
					tmp += receipts.get(i).getCtPhieuNhaps().size();
					receipts.remove(i);
					i--;
				}
			}
			
			report.setId(id);
			report.setReceipts(tmpReceipts);
			report.setCountProduct(tmp);
			
			receiptReports.add(report);
			id++;
			cFrom.add(Calendar.YEAR, 1);
		}
		model.addAttribute("tuNgay",from);
		model.addAttribute("toiNgay",to);
		model.addAttribute("receiptReports", receiptReports);
		return "admin/thongke/thongKeNhapHang-nam";
	}
}
