package com.puppy.admin.room.dao;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;

public interface CageRoomDAO {

	public List<CageRoomVO> roomList(CageRoomVO param);

	public CageRoomVO roomDetail(int no);

	public int roomAdd(CageRoomVO param);

	public int roomDisabled(CageRoomVO param);

}
