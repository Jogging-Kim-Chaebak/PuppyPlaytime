package com.puppy.admin.room.service;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;


public interface CageRoomService {

	public List<CageRoomVO> roomList(CageRoomVO param);

	public CageRoomVO roomDetail(int no);

	public int roomAdd(CageRoomVO param);

	public int roomDisabled(CageRoomVO param);

}
