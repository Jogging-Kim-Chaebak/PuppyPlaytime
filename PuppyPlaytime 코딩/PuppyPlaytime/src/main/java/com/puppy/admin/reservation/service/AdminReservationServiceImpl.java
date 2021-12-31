package com.puppy.admin.reservation.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.reservation.dao.AdminReservationDAO;
import com.puppy.client.reservation.vo.ReservationVO;

@Service
@Transactional
public class AdminReservationServiceImpl implements AdminReservationService {

	@Autowired
	private AdminReservationDAO reservationDAO;
	
	@Override
	public List<ReservationVO> newReservationList(ReservationVO param) {
		List<ReservationVO> list = new ArrayList<ReservationVO>();
		list = reservationDAO.newReservationList(param);
		return list;
	}

	@Override
	public List<ReservationVO> reservationList(ReservationVO param) {
		List<ReservationVO> list = new ArrayList<ReservationVO>();
		list = reservationDAO.reservationList(param);
		return list;
	}

	@Override
	public ReservationVO reservationDetail(int parseInt) {
		// TODO Auto-generated method stub
		return reservationDAO.reservationDetail(parseInt);
	}

	@Override
	public int reservationApproval(ReservationVO param) {
		// TODO Auto-generated method stub
		return reservationDAO.reservationApproval(param);
	}

	@Override
	public int reservationCancel(ReservationVO param) {
		// TODO Auto-generated method stub
		return reservationDAO.reservationCancel(param);
	}

	@Override
	public List<ReservationVO> todayReservationList(ReservationVO param) {
		List<ReservationVO> list = new ArrayList<ReservationVO>();
		list = reservationDAO.todayReservationList(param);
		return list;
	}

}
