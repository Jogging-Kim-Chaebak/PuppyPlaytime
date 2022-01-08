package com.puppy.client.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.main.dao.MainDao;
import com.puppy.client.notice.vo.NoticeVO;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDao mainDao;
	
	@Override
	public List<NoticeVO> showRecentNotice() throws Exception {
		return mainDao.showRecentNotice();
	}

	@Override
	public List<CageRoomVO> showCageRooms() throws Exception {
		return mainDao.showCageRooms();
	}

}
