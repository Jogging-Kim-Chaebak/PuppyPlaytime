package com.puppy.client.main.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.puppy.admin.room.vo.CageRoomVO;
import com.puppy.client.notice.vo.NoticeVO;

@Repository
public class MainDaoImpl implements MainDao{

	@Inject
	private SqlSession session;
	
	private static final String namespace = "query.main";
	
	// 공지사항 불러오기
	@Override
	public List<NoticeVO> showRecentNotice() throws Exception {
		return session.selectList(namespace +".showRecentNotice");
	}

	// 룸 사진 불러오기
	@Override
	public List<CageRoomVO> showCageRooms() throws Exception {
		return session.selectList(namespace +".showCageRooms");
	}
}