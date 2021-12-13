package com.puppy.client.login.service;

import com.puppy.client.member.vo.MemberVO;

public interface LoginService {
	public MemberVO m_idSelect(String m_id);
	public MemberVO loginSelect(String m_id, String m_pw);

}
