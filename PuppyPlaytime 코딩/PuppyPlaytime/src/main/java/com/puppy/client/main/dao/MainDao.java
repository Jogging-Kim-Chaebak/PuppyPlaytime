package com.puppy.client.main.dao;

import java.util.List;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.notice.vo.NoticeVO;

public interface MainDao {

	// 공지사항 불러오기
	public List<NoticeVO> showRecentNotice() throws Exception;

	// 룸 사진 불러오기
	public List<CageRoomVO> showCageRooms() throws Exception;
	
}
