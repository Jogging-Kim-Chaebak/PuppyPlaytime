package com.puppy.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.puppy.client.notice.vo.NoticeVO;
import com.puppy.common.vo.PageRequest;

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
	
	//글목록 구현(삭제)
	/*
	 * @Override public List<NoticeVO> noticeList() {
	 * 
	 * return session.selectList(namespace + ".noticeList"); }
	 */
	
	//페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
	@Override
	public List<NoticeVO> noticeList(PageRequest pageRequest) throws Exception {
				
		return session.selectList(namespace + ".noticeList",pageRequest);
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
	
	//게시글 전체 건수를 반환
	@Override
	public int count() throws Exception {
			
		return (Integer)session.selectOne(namespace + ".noticeListCnt");
	}
	

}
