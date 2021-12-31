package com.puppy.client.inquiry.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.puppy.client.inquiry.vo.InquiryVO;

@Repository
public class InquiryDaoImpl implements InquiryDao {

	@Autowired
	private SqlSession session;
	
	// 리스트
	@Override
	public List<InquiryVO> inquiryList() {
		return session.selectList("inquiryList");
	}

	// 글쓰기
	@Override
	public int inquiryInsert(InquiryVO ivo) {
		return session.insert("inquiryInsert", ivo);
	}

	//상세보기
	@Override
	public InquiryVO inquiryDetail(InquiryVO ivo) {
		return (InquiryVO)session.selectOne("inquiryDetail", ivo);
	}

	//글수정
	@Override
	public int inquiryUpdate(InquiryVO ivo) {
		return session.update("inquiryUpdate",ivo);
	}

	//글삭제
	@Override
	public int inquirtDelete(int q_no) {
		return session.delete("inquiryDelete", q_no);
	}

	//비밀번호
	@Override
	public int memberPw(String m_pw, int q_no) {
	
		return session.selectOne(m_pw);
	}

}
