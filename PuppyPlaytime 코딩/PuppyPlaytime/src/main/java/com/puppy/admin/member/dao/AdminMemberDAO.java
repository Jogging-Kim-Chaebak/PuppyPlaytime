package com.puppy.admin.member.dao;

import java.util.List;

import com.puppy.client.member.vo.MemberVO;

public interface AdminMemberDAO {

	public List<MemberVO> adminMemberList(MemberVO param);

	public int adminMemberDisabled(String m_id);

		
}
