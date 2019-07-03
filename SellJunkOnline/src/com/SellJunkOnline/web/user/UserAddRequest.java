package com.SellJunkOnline.web.user;

public class UserAddRequest {

	private int id;
	private String Address,PickUpDate,Slot,Email,State,City;
	
	
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
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
	
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
	
	
	
	
	
}
