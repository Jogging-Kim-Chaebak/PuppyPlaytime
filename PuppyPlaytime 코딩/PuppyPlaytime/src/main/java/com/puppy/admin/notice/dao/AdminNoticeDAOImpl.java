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
	
	private static final String namespace = "query.adminNotice";
	
	//글입력 구현
	@Override
	public int noticeAdd(NoticeVO nvo) {
		
		return session.insert(namespace + ".noticeAdd",nvo);
	}
	
	//글목록 구현
	@Override
	public List<NoticeVO> noticeList() {
		
		return session.selectList(namespace + ".noticeList");
	}

	//글상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		
		return (NoticeVO)session.selectOne(namespace + ".noticeDetail",nvo);
	}

	//글삭제 구현
	@Override
	public int noticeDelete(int n_no) {
		
		return session.delete(namespace + ".noticeDelete",n_no);
	}
	
	
	
	//글목록 리스트 전달
	@Override
	public List<NoticeVO> getNoticeList() throws Exception {
		
		return session.selectList(namespace + ".getNoticeList");
	}
	
	//글수정 구현
	@Override
	public int update(NoticeVO nvo) throws Exception {
			
		return session.update(namespace+ ".noticeUpdate",nvo);
	}
	

}
