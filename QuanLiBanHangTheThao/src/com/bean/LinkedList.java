package com.bean;

public class LinkedList {
	public String name;
	public String link;
	
	public LinkedList() {
	}

	public LinkedList(String name, String link) {
		this.name = name;
		this.link = link;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
}
