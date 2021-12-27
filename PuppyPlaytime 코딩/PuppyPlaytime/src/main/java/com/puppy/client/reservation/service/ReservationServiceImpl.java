package com.puppy.client.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.dao.ReservationDAO;
import com.puppy.client.reservation.vo.ReservationVO;
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

	// cage 정보 불러오기
	@Override
	public CageRoomVO cageDetail(int c_no) throws Exception {
		return reservationDAO.cageDetail(c_no);
	}

	// 실제 예약 완료
	@Override
	public void requestReservation(ReservationVO rvo) throws Exception {
		reservationDAO.requestReservation(rvo);
	}

	// 펫 불러오기
	@Override
	public List<PetVO> importPetList(String m_id) throws Exception {
		return reservationDAO.importPetList(m_id);
	}
	
	// 펫 상세 불러오기
	@Override
	public PetVO importPetDetail(String p_no) throws Exception {
		return reservationDAO.importPetDetail(p_no);
	}
}
