package com.puppy.client.reservation.service;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.common.vo.PetVO;

public interface ReservationService {

	// 룸 정보에서 룸리스트 띄워주기
	public List<CageRoomVO> listRoom() throws Exception;

	// C_no 를 기반으로 cage 정보 얻어오기
	public CageRoomVO cageDetail(int c_no) throws Exception;
	
	// 예약 완료
	public void requestReservation(ReservationVO rvo) throws Exception;

	// 펫 불러오기
	public List<PetVO> importPetList(String m_id) throws Exception;
	
	// 펫 상세보기
	public PetVO importPetDetail(String p_no) throws Exception;
}
