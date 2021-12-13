package com.puppy.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.puppy.admin.notice.vo.NoticeVO;

@Repository
public class AdminNoticeDAOImpl implements AdminNoticeDAO {
	
	@Autowired
	private SqlSession session;
	

	//글목록 구현
	@Override
	public List<NoticeVO> noticeList() {
		
		return session.selectList("noticeList");
	}
	
	//글입력 구현
	@Override
	public int noticeAdd(NoticeVO nvo) {
		
		return session.insert("noticeAdd",nvo);
	}

}
