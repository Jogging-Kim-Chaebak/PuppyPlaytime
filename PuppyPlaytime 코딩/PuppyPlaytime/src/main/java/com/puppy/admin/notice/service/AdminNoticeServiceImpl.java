package com.puppy.admin.notice.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.notice.dao.AdminNoticeDAO;
import com.puppy.admin.notice.vo.NoticeVO;

@Service
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	private AdminNoticeDAO noticeDao;
	
	
	
	//글 입력 구현
	@Override
	public int noticeAdd(NoticeVO nvo) {
		
		int result = 0;
		try {
			result = noticeDao.noticeAdd(nvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
	}
	
	//글목록 구현
	@Override
	public List<NoticeVO> noticeList() {
		List<NoticeVO> nList = null;
		nList = noticeDao.noticeList();
		return nList;
	}

}
