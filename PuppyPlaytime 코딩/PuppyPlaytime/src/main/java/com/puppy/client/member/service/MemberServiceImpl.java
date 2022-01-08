package com.puppy.client.member.service;

import java.util.List;

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

	// 아이디와 이메일 확인 메서드
	@Override
	public MemberVO find_pw(MemberVO mvo) throws Exception {
		return memberDao.find_pw(mvo);
	}
	
	//비밀번호 수정 페이지
	@Override
	public MemberVO read(MemberVO mvo) throws Exception {
		return memberDao.read(mvo);
	}

	// 비밀번호 수정 팝업 페이지
	@Override
	public void update(MemberVO mvo) throws Exception {
		 memberDao.update(mvo);
	}

	// 이메일 리스트 받아오기
	@Override
	public List<String> getEmailList() throws Exception {
		return memberDao.getEmailList();
	}
}
