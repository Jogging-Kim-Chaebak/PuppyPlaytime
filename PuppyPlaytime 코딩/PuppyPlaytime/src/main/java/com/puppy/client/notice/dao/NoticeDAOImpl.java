package com.puppy.client.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.puppy.client.notice.domain.PageRequest;
import com.puppy.client.notice.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "query.notice";
	
	//글목록 구현
	@Override
	public List<NoticeVO> noticeList() throws Exception {
		
		return session.selectList(namespace + ".noticeList");
	}
	//글상세페이지 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) throws Exception {
		
		return (NoticeVO)session.selectOne(namespace + ".noticeDetail",nvo);
	}
	//게시글 전체 건수를 반환
	@Override
	public int count() throws Exception {
		
		return (Integer)session.selectOne(namespace + ".noticeListCnt");
	}
	
	@Override
	public List<NoticeVO> list(PageRequest pageRequest) throws Exception {
		
		return session.selectList(namespace + ".pageRequest",pageRequest);
	}

}
