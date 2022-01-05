package com.puppy.client.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.dao.ReservationDAO;
import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.client.reservation.vo.ReserveDate;
import com.puppy.common.vo.ExtraServiceVO;
import com.puppy.common.vo.PetVO;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDAO reservationDAO;
	
	// 룸 정보에서 룸리스트 띄워주기
	@Override
	public List<CageRoomVO> listRoom(ReserveDate rDate) throws Exception {
		return reservationDAO.listRoom(rDate);
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
	public PetVO importPetDetail(int p_no) throws Exception {
		return reservationDAO.importPetDetail(p_no);
	}
	
	// 아무 펫 한마리 불러오기
	@Override
	public PetVO importOnePet(String m_id) throws Exception {
		return reservationDAO.importOnePet(m_id);
	}

	// 부가서비스 띄워주기
	@Override
	public List<ExtraServiceVO> listExtraService(int c_no) throws Exception {
		return reservationDAO.listExtraService(c_no);
	}
	
	// 예약 룸 건수를 반환한다.
	@Override
	public int roomCount(ReserveDate rDate) throws Exception {
		return reservationDAO.roomCount(rDate);
	}
}
