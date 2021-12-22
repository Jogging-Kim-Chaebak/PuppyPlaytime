package com.puppy.client.reservation.dao;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.common.vo.PetVO;

public interface ReservationDAO {

	// 룸 리스트 띄워주기
	public List<CageRoomVO> listRoom() throws Exception;
	
	// 상세 예약 창에서 펫 등록
	public void petRegister(PetVO pvo) throws Exception;

}
