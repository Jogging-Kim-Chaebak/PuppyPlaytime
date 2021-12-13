package com.puppy.client.login.dao;

import com.puppy.client.member.vo.MemberVO;

public interface LoginDao {
	public MemberVO m_idSelect(String m_id);
	public MemberVO loginSelect(MemberVO mvo);


}
