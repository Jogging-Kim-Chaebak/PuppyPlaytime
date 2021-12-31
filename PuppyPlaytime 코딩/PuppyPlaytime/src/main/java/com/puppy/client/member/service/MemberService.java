package com.puppy.client.member.service;

import com.puppy.client.member.vo.MemberVO;

public interface MemberService {

	// 회원가입 처리
	public void join(MemberVO mvo) throws Exception;

	// 아이디 중복 체크
	public MemberVO m_idConfirm(String id) throws Exception;

	// 아이디 찾기
	public MemberVO find_id(String m_email) throws Exception;

	// 비밀번호 아이디와 이메일 확인 메서드
	public MemberVO find_pw(MemberVO mvo) throws Exception;
	
	//비밀번호 수정 페이지
	public MemberVO read(MemberVO mvo) throws Exception;

	// 비밀번호 수정 팝업 등록 페이지
	public void update(MemberVO mvo)throws Exception;

	

	

}
