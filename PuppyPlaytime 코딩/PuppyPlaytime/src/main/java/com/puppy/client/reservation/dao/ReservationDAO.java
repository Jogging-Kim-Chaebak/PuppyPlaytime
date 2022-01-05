package com.puppy.client.reservation.dao;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.client.reservation.vo.ReserveDate;
import com.puppy.common.vo.ExtraServiceVO;
import com.puppy.common.vo.PetVO;

public interface ReservationDAO {

	// 룸 리스트 띄워주기
	public List<CageRoomVO> listRoom(ReserveDate rDate) throws Exception;

	// cage 상세 정보 띄우기
	public CageRoomVO cageDetail(int c_no) throws Exception;

	// 실제 예약 완료
	public void requestReservation(ReservationVO rvo) throws Exception;

	// 펫 불러오기
	public List<PetVO> importPetList(String m_id) throws Exception;

	// 펫 상세 불러오기
	public PetVO importPetDetail(int p_no) throws Exception;

	// 아무 펫 한마리 불러오기
	public PetVO importOnePet(String m_id) throws Exception;

	// 부가서비스 띄워주기
	public List<ExtraServiceVO> listExtraService(int c_no) throws Exception;
	
	// 예약 룸 건수를 반환한다.
	public int roomCount(ReserveDate rDate) throws Exception;

}
