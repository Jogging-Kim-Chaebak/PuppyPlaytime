package com.puppy.client.login.dao;

import com.puppy.client.member.vo.MemberVO;

public interface LoginDao {
	
	//아이디처리
	public MemberVO m_idSelect(String m_id) throws Exception;
	
	//로그인 처리 메서드
	public MemberVO loginSelect(MemberVO mvo) throws Exception;

	// 아이디로 이메일 불러오기
	public String findRealEmail(String id);
}
