package com.puppy.admin.notice.dao;

import java.util.List;

import com.puppy.client.notice.vo.NoticeVO;
import com.puppy.common.vo.PageRequest;

public interface AdminNoticeDAO {
	//글 목록(삭제)
	//public List<NoticeVO> noticeList() throws Exception;
	
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
	//게시글 전체 건수를 반환
	public int count() throws Exception;
	//페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	public List<NoticeVO> noticeList(PageRequest pageRequest) throws Exception;


	
}
