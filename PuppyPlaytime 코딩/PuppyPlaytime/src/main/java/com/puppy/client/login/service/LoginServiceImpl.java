package com.puppy.client.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.client.login.dao.LoginDao;
import com.puppy.client.member.vo.MemberVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDao loginDao;
	
	//아이디 처리
	@Override
	public MemberVO m_idSelect(String m_id) throws Exception {
		return loginDao.m_idSelect(m_id);
	}

	//로그인 처리 메서드
	@Override
	public MemberVO userLogin(MemberVO mvo) throws Exception {
		mvo=loginDao.loginSelect(mvo);
		return mvo;
	}

	@Override
	public String findRealEmail(String m_id) throws Exception {
		return loginDao.findRealEmail(m_id);
	}
}
