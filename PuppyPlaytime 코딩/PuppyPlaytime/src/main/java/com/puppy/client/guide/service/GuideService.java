package com.puppy.client.guide.service;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.common.vo.ExtraServiceVO;


public interface GuideService {
	//룸 리스트 구현
	public List<CageRoomVO> roomList(CageRoomVO param) throws Exception;
	
	//부가서비스 리스트 구현 
	public List<ExtraServiceVO> extraServiceList(ExtraServiceVO param) throws Exception;
	
	// 룸 상세페이지 구현
	public CageRoomVO roomDetail(int no) throws Exception;
	 
}
