package com.puppy.client.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.dao.ReservationDAO;
import com.puppy.common.vo.PetVO;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDAO reservationDAO;
	
	// 룸 정보에서 룸리스트 띄워주기
	@Override
	public List<CageRoomVO> listRoom() throws Exception {
		return reservationDAO.listRoom();
	}
	
	// 상세 예약 창에서 펫 등록
	@Override
	public void petRegister(PetVO petVO) throws Exception{
		reservationDAO.petRegister(petVO);
	}
}
