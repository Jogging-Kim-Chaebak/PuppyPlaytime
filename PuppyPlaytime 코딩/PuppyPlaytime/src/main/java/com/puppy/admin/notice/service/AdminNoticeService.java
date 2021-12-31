package com.puppy.admin.notice.service;

import java.util.List;

import com.puppy.client.notice.vo.NoticeVO;

public interface AdminNoticeService {
	//목록 페이지
	public List<NoticeVO> noticeList() throws Exception;
	//등록 처리
	public int noticeAdd(NoticeVO nvo) throws Exception;
	//글 상세보기(수정 페이지)
	public NoticeVO noticeDetail(NoticeVO nvo) throws Exception;
	//글 삭제
	public int noticeDelete(int n_no) throws Exception;
	//수정목록처리
	public List<NoticeVO> getNoticeList() throws Exception;
	//수정 처리
	public int noticeModify(NoticeVO nvo) throws Exception;
}
