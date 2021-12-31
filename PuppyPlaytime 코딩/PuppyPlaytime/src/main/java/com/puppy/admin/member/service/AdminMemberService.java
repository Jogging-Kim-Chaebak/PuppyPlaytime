package com.puppy.admin.member.service;

import java.util.List;

import com.puppy.client.member.vo.MemberVO;

public interface AdminMemberService {

	public List<MemberVO> adminMemberList(MemberVO param);

	public int adminMemberDisabled(String m_id);

}
