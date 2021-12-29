package com.puppy.client.guide.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.guide.dao.GuideDAO;
import com.puppy.common.vo.ExtraServiceVO;

@Service
@Transactional
public class GuideServiceImpl implements GuideService {
	
	@Autowired
	private GuideDAO guideDao;
	
	
	//룸 리스트 구현
	@Override
	public List<CageRoomVO> roomList(CageRoomVO param) throws Exception{
		List<CageRoomVO> roomList= new ArrayList<CageRoomVO>();
		roomList = guideDao.roomList(param);
		return roomList;
	}

	
	 //부가서비스 리스트 구현
	  @Override 
	  public List<ExtraServiceVO> extraServiceList() throws Exception {
		  List<ExtraServiceVO> exList= null; 
		  exList = guideDao.extraList();
		  return exList;
	  
	}

	// 룸 상세페이지 구현
	@Override
	public CageRoomVO roomDetail(int no) throws Exception {
		
		CageRoomVO detail = null;
		detail = guideDao.roomDetail(no);
		return detail;
	}


	

}
