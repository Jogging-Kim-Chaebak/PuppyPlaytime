package com.puppy.client.login.service;

import com.puppy.client.member.vo.MemberVO;

public interface LoginService {
	//아이디 처리
	public MemberVO m_idSelect(String m_id) throws Exception;
		
	//로그인 처리 메서드
	public MemberVO userLogin(MemberVO mvo) throws Exception;

	


}
