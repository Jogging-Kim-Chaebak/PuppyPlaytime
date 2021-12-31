package com.puppy.client.reservation.vo;

import java.util.Date;

public class ReserveDate {
	private String startDate;
	private String endDate;
	private Date startReservation;
	private Date endReservation;
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Date getStartReservation() {
		return startReservation;
	}
	public void setStartReservation(Date startReservation) {
		this.startReservation = startReservation;
	}
	public Date getEndReservation() {
		return endReservation;
	}
	public void setEndReservation(Date endReservation) {
		this.endReservation = endReservation;
	}
}
