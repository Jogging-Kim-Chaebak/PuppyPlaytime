package com.puppy.admin.notice.service;

import java.util.List;

import com.puppy.client.notice.vo.NoticeVO;

public interface AdminNoticeService {
	public List<NoticeVO> noticeList();
	public int noticeAdd(NoticeVO nvo);
	public NoticeVO noticeDetail(NoticeVO nvo);
	public int noticeDelete(int n_no);
	
}
