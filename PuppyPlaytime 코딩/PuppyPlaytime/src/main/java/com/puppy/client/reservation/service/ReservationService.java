package com.puppy.client.reservation.service;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.common.vo.PetVO;

public interface ReservationService {

	// 룸 정보에서 룸리스트 띄워주기
	public List<CageRoomVO> listRoom() throws Exception;

	// 상세 예약 창에서 펫 등록
	public void petRegister(PetVO petVO) throws Exception;

}
