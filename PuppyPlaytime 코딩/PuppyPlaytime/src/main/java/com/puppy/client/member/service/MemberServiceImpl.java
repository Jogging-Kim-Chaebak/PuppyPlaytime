package com.puppy.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.client.member.dao.MemberDao;
import com.puppy.client.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	//등록처리
	@Override
	public void join(MemberVO mvo) throws Exception{
		memberDao.insert(mvo);
		
	}

	//아이디 중복체크
	@Override
	public MemberVO m_idConfirm(String id) throws Exception {
		return memberDao.m_idConfirm(id);
	}

	// 아이디 찾기
	@Override
	public MemberVO find_id(String m_email) throws Exception {
		return memberDao.find_id(m_email);
	}

	

	

	
}
