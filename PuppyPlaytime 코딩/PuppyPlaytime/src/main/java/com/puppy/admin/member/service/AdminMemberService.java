package com.puppy.admin.member.service;

import java.util.List;

import com.puppy.client.member.vo.MemberVO;
import com.puppy.common.vo.PageRequest;

public interface AdminMemberService {

	public List<MemberVO> adminMemberList(PageRequest pageRequest);

	public int adminMemberDisabled(String m_id);

	public int count();

}
