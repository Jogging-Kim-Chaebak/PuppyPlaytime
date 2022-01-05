package com.puppy.client.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.notice.dao.AdminNoticeDAO;
import com.puppy.client.notice.dao.NoticeDAO;
import com.puppy.client.notice.domain.PageRequest;
import com.puppy.client.notice.vo.NoticeVO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDao;
	
	
	//글목록 구현
	@Override
	public List<NoticeVO> noticeList() throws Exception {
		List<NoticeVO> myList = null;
		myList = noticeDao.noticeList();
		return myList;
	}
	//글상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) throws Exception {
		NoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
	
		return detail;
	}
	
	//게시글 전체 건수를 반환한다.
	@Override
	public int count() throws Exception {
		
		return noticeDao.count();
	}
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<NoticeVO> list(PageRequest pageRequest) throws Exception {
		
		return noticeDao.list(pageRequest);
	}

}
