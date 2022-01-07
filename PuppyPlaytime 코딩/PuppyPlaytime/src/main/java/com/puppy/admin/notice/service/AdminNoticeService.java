package com.puppy.admin.notice.service;

import java.util.List;

import com.puppy.client.notice.vo.NoticeVO;
import com.puppy.common.vo.PageRequest;

public interface AdminNoticeService {
	//목록 페이지(삭제)
	//public List<NoticeVO> noticeList() throws Exception;
	
	//등록 처리
	public int noticeAdd(NoticeVO nvo) throws Exception;
	//글 상세보기(수정 페이지)
	public NoticeVO noticeDetail(NoticeVO nvo) throws Exception;
	//글 삭제
	public int noticeDelete(int n_no) throws Exception;
	//수정목록처리
	public List<NoticeVO> getNoticeList(PageRequest pageRequest) throws Exception;
	//수정 처리
	public int noticeModify(NoticeVO nvo) throws Exception;
	//게시글 전체 건수를 반환한다
	public int count() throws Exception;
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시물 목록을 반환한다.
	public List<NoticeVO> noticeList(PageRequest pageRequest) throws Exception;
	
}
