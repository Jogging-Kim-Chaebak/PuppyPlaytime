package com.puppy.admin.notice.dao;

import java.util.List;

import com.puppy.client.notice.vo.NoticeVO;

public interface AdminNoticeDAO {
	//글 목록
	public List<NoticeVO> noticeList() throws Exception;
	//글 추가
	public int noticeAdd(NoticeVO nvo) throws Exception;
	//글 상세페이지
	public NoticeVO noticeDetail(NoticeVO nvo) throws Exception;
	//글 삭제
	public int noticeDelete(int n_no) throws Exception;
	//글 수정
	public int update(NoticeVO nvo) throws Exception;
	//수정목록 조회
	public List<NoticeVO> getNoticeList() throws Exception;

	
}
