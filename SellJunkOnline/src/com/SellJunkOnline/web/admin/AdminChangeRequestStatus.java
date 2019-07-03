package com.SellJunkOnline.web.admin;

public class AdminChangeRequestStatus {
	
	int req_id;
	String Status;

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public int getReq_id() {
		return req_id;
	}

	public void setReq_id(int req_id) {
		this.req_id = req_id;
	}
	

}
