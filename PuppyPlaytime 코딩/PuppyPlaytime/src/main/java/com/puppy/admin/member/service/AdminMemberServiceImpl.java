package com.puppy.admin.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.admin.member.dao.AdminMemberDAO;
import com.puppy.client.member.vo.MemberVO;
import com.puppy.common.vo.PageRequest;

@Service
@Transactional
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	@Override
	public List<MemberVO> adminMemberList(PageRequest pageRequest) {
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = adminMemberDAO.adminMemberList(pageRequest);
		return list;
	}

	@Override
	public int adminMemberDisabled(String m_id) {
		// TODO Auto-generated method stub
		return adminMemberDAO.adminMemberDisabled(m_id);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return adminMemberDAO.count();
	}

}
