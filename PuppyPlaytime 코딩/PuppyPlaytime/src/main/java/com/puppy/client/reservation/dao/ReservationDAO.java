package com.puppy.client.reservation.dao;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;

public interface ReservationDAO {

	List<CageRoomVO> listRoom() throws Exception;

}
