package com.puppy.admin.notice.dao;

import java.util.List;

import com.puppy.admin.notice.vo.NoticeVO;

public interface AdminNoticeDAO {
	
	public List<NoticeVO> noticeList();
	public int noticeAdd(NoticeVO nvo);

}
