package com.puppy.client.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.puppy.client.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace="query.member";
	//회원가입 처리
	@Override
	public void insert(MemberVO mvo) throws Exception {
		session.insert(namespace+".insert",mvo);
	
	}
	//아이디 중복체크
	@Override
	public MemberVO m_idConfirm(String id) throws Exception {
		return session.selectOne(namespace+".m_idConfirm",id);
	}
	
	// 아이디 찾기
	@Override
	public MemberVO find_id(String m_email) throws Exception {
	
		return session.selectOne(namespace+".find_id",m_email);
	}

	
	

	
}
