package com.puppy.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.puppy.client.notice.vo.NoticeVO;

@Repository
public class AdminNoticeDAOImpl implements AdminNoticeDAO {
	
	@Autowired
	private SqlSession session;
	
	//글입력 구현
	@Override
	public int noticeAdd(NoticeVO nvo) {
		
		return session.insert("noticeAdd",nvo);
	}
	
	//글목록 구현
	@Override
	public List<NoticeVO> noticeList() {
		
		return session.selectList("noticeList");
	}

	//글상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		
		return (NoticeVO)session.selectOne("noticeDetail",nvo);
	}

	//글삭제 구현
	@Override
	public int noticeDelete(int n_no) {
		
		return session.delete("noticeDelete",n_no);
	}

}
