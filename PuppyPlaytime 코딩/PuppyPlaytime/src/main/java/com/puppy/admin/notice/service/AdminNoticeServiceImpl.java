package com.puppy.admin.notice.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.notice.dao.AdminNoticeDAO;
import com.puppy.client.notice.vo.NoticeVO;

@Service
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {
	
	@Autowired
	private AdminNoticeDAO noticeDao;
	
	//글입력 구현
	@Override
	public int noticeAdd(NoticeVO nvo) {
		int result = 0;
		try {
			result = noticeDao.noticeAdd(nvo);
		}catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}
	
	//글 목록 구현
	@Override
	public List<NoticeVO> noticeList() {
		List<NoticeVO> myList = null;
		myList = noticeDao.noticeList();
		return myList;
	}

	//글상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
	
		return detail;
	}
	
	//글삭제 구현
	@Override
	public int noticeDelete(int n_no) {
	
		int result = 0;
		try {
			result = noticeDao.noticeDelete(n_no);
			
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
