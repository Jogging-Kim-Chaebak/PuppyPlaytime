package com.puppy.admin.reservation.service;

import java.util.List;

import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.common.vo.PageRequest;

public interface AdminReservationService {

	public List<ReservationVO> newReservationList(PageRequest pageRequest);

	public List<ReservationVO> reservationList(PageRequest pageRequest);

	public ReservationVO reservationDetail(int parseInt);

	public int reservationApproval(ReservationVO param);

	public int reservationCancel(ReservationVO param);

	public List<ReservationVO> todayReservationList(ReservationVO param);

	public int count();
	
	public int count2();
}
