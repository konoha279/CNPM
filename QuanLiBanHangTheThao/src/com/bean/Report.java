package com.bean;

import java.util.Date;
import java.util.List;

public interface Report {
	public List<ObjectReport> objectReports(Date date, int value);
}
