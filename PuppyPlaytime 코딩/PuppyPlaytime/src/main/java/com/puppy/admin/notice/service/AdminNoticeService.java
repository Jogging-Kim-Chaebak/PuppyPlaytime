package com.puppy.admin.notice.service;

import java.util.List;

import com.puppy.admin.notice.vo.NoticeVO;

public interface AdminNoticeService {
	public List<NoticeVO> noticeList();
	public int noticeAdd(NoticeVO nvo);
}
