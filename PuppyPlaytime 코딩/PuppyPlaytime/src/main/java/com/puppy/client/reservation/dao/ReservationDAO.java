package com.puppy.client.reservation.dao;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.common.vo.PetVO;

public interface ReservationDAO {

	// 룸 리스트 띄워주기
	public List<CageRoomVO> listRoom() throws Exception;
	
	// 상세 예약 창에서 펫 등록
	public void petRegister(PetVO pvo) throws Exception;

	// cage 상세 정보 띄우기
	public CageRoomVO cageDetail(int c_no) throws Exception;

	// 실제 예약 완료
	public void requestReservation(ReservationVO rvo) throws Exception;

	// 펫 불러오기
	public List<PetVO> importPetList(String m_id) throws Exception;

	// 펫 상세 불러오기
	public PetVO importPetDetail(String p_no) throws Exception;

}
