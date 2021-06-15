package com.bean;

import java.util.ArrayList;
import java.util.List;

import com.entity.Bill;
import com.entity.Staff;

public class StaffReport extends ObjectReport {

	public static class MainReport
	{
		private Staff staff;
		private ArrayList<Integer> value;
		private List<Bill> bills;
		public Staff getStaff() {
			return staff;
		}
		public void setStaff(Staff staff) {
			this.staff = staff;
		}
		public ArrayList<Integer> getValue() {
			return value;
		}
		public void setValue(ArrayList<Integer> value) {
			this.value = value;
		}
		public List<Bill> getBills() {
			return bills;
		}
		public void setBills(List<Bill> bills) {
			this.bills = bills;
		}
		public MainReport() {
			// TODO Auto-generated constructor stub
		}
		public MainReport(Staff staff, ArrayList<Integer> value, List<Bill> bills) {
			super();
			this.staff = staff;
			this.value = value;
			this.bills = bills;
		}
		
	}
	
	private List<MainReport> mainList;

	public StaffReport() {
		// TODO Auto-generated constructor stub
	}
	
	public StaffReport(int id, String date, List<MainReport> mainList) {
		super(id, date);
		this.mainList = mainList;
	}

	public List<MainReport> getMainList() {
		return mainList;
	}

	public void setMainList(List<MainReport> mainList) {
		this.mainList = mainList;
	}
}
