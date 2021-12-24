package com.puppy.client.member.dao;

import com.puppy.client.member.vo.MemberVO;

public interface MemberDao {

	//회원가입
	public void insert(MemberVO mvo) throws Exception;

	//아이디 중복체크
	public MemberVO m_idConfirm(String id) throws Exception;

	// 아이디 찾기
	public MemberVO find_id(String m_email) throws Exception;

	
	

	
	

	
}
