package com.puppy.admin.room.service;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.common.vo.PageRequest;


public interface CageRoomService {

	public List<CageRoomVO> roomList(PageRequest pageRequest);

	public CageRoomVO roomDetail(int no);

	public int roomAdd(CageRoomVO param);

	public int roomDisabled(CageRoomVO param);

	public int count();

}
