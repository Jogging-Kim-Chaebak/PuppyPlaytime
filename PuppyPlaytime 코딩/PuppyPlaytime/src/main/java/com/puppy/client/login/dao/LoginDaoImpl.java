package com.puppy.client.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.puppy.client.member.vo.MemberVO;

@Repository
public class LoginDaoImpl implements LoginDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public MemberVO m_idSelect(String m_id) {
		
		return (MemberVO) session.selectOne("m_idSelect",m_id);
	}

	@Override
	public MemberVO loginSelect(MemberVO mvo) {
		
		return (MemberVO) session.selectOne("loginSelect",mvo);
	}

}
