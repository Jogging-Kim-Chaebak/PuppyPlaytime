package com.puppy.admin.notice.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.notice.dao.AdminNoticeDAO;
import com.puppy.client.notice.vo.NoticeVO;
import com.puppy.common.vo.PageRequest;

@Service
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {
	
	@Autowired
	private AdminNoticeDAO noticeDao;
	
	//글입력 구현
	@Override
	public int noticeAdd(NoticeVO nvo) throws Exception{
		int result = 0;
		try {
			result = noticeDao.noticeAdd(nvo);
		}catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}
	
	//글 목록 구현(삭제)
	/*
	 * @Override public List<NoticeVO> noticeList() throws Exception{ List<NoticeVO>
	 * myList = null; myList = noticeDao.noticeList(); return myList; }
	 */

	//글상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) throws Exception{
		NoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
	
		return detail;
	}
	
	//글삭제 구현
	@Override
	public int noticeDelete(int n_no) throws Exception{
	
		int result = 0;
		try {
			result = noticeDao.noticeDelete(n_no);
			
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}


	//수정목록조회 구현
	@Override
	public List<NoticeVO> getNoticeList(PageRequest pageRequest) throws Exception {
		
		return noticeDao.getNoticeList();
	}
	
	//수정 처리
	@Override
	public int noticeModify(NoticeVO nvo) throws Exception {
		int result = 0;
		try {
			result = noticeDao.update(nvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
			
	}
	
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<NoticeVO> noticeList(PageRequest pageRequest) throws Exception {
				
		return noticeDao.noticeList(pageRequest);
	}
			
	// 게시글 전체 건수를 반환한다.
	@Override
	public int count() throws Exception {
				
		return noticeDao.count();
	}
	
	
}
