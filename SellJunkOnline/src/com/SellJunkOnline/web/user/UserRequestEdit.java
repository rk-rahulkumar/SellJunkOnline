package com.SellJunkOnline.web.user;

public class UserRequestEdit {
	
	int req_id;
	String Address,City,State,PickUpDate,Slot;
	public int getReq_id() {
		return req_id;
	}
	public void setReq_id(int req_id) {
		this.req_id = req_id;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getPickUpDate() {
		return PickUpDate;
	}
	public void setPickUpDate(String pickUpDate) {
		PickUpDate = pickUpDate;
	}
	public String getSlot() {
		return Slot;
	}
	public void setSlot(String slot) {
		Slot = slot;
	}

}
