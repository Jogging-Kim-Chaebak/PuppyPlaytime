package com.puppy.client.member.service;

import com.puppy.client.member.vo.MemberVO;

public interface MemberService {

	//회원가입 처리
	 public void join(MemberVO mvo) throws Exception;

	 //아이디 중복 체크
	public MemberVO m_idConfirm(String id) throws Exception;

	// 아이디 찾기
	public MemberVO find_id(String m_email) throws Exception;


	

	
	

	
	
	
}
