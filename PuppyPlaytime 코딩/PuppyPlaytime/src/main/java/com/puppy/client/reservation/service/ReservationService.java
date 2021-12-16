package com.puppy.client.reservation.service;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;

public interface ReservationService {

	public List<CageRoomVO> listRoom() throws Exception;

}
