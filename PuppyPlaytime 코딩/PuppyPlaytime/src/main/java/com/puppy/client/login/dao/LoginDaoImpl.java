package com.puppy.client.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.puppy.client.member.vo.MemberVO;

@Repository
public class LoginDaoImpl implements LoginDao{
	
	@Autowired
	private SqlSession session;

	//아이디처리
	@Override
	public MemberVO m_idSelect(String m_id) throws Exception{
		
		return (MemberVO) session.selectOne("m_idSelect",m_id);
	}

	//로그인 처리 메서드
	@Override
	public MemberVO loginSelect(MemberVO mvo) throws Exception {
		
		return (MemberVO) session.selectOne("loginSelect",mvo);
	}

	// 아이디로 이메일 불러오기
	@Override
	public String findRealEmail(String m_id) {
		return session.selectOne("findRealEmail", m_id);
	}
}
