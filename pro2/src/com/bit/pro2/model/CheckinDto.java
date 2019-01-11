package com.bit.pro2.model;

public class CheckinDto {
	private int stunum, checkchk;
	private String checkdate, checkin, checkout;
	
	public CheckinDto(){
		
	}

	public int getStunum() {
		return stunum;
	}

	public void setStunum(int stunum) {
		this.stunum = stunum;
	}

	public int getCheckchk() {
		return checkchk;
	}

	public void setCheckchk(int checkchk) {
		this.checkchk = checkchk;
	}

	public String getCheckdate() {
		return checkdate;
	}

	public void setCheckdate(String checkdate) {
		this.checkdate = checkdate;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	
}
