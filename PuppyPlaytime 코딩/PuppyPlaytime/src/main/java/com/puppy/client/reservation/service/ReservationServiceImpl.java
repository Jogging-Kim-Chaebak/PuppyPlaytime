package com.puppy.client.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.dao.ReservationDAO;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDAO reservationDAO;
	
	@Override
	public List<CageRoomVO> listRoom() throws Exception {
		return reservationDAO.listRoom();
	}
}
