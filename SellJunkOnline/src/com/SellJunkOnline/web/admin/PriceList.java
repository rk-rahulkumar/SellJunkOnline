package com.SellJunkOnline.web.admin;

public class PriceList {

	private int id;
	private String JunkName,Price,Unit;
	public String getUnit() {
		return Unit;
	}
	public void setUnit(String unit) {
		Unit = unit;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getJunkName() {
		return JunkName;
	}
	public void setJunkName(String junkName) {
		JunkName = junkName;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	
	
	
	
}
