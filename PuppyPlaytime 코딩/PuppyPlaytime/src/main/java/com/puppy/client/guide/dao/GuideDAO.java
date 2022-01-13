package com.puppy.client.guide.dao;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.common.vo.ExtraServiceVO;

public interface GuideDAO {
	//룸 리스트 구현
	public List<CageRoomVO> roomList() throws Exception;
	
	//부가서비스 리스트 구현 
	public List<ExtraServiceVO> extraList(ExtraServiceVO param) throws Exception;
	// 룸 상세페이지 구현
	public CageRoomVO roomDetail(int no) throws Exception;
	 
}
