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
	
	/*@Autowired
	private MemberDao memberDao*/

	@Override
	public MemberVO m_idSelect(String m_id) {
		
		return loginDao.m_idSelect(m_id);
	}

	@Override
	public MemberVO loginSelect(String m_id, String m_pw) {
		MemberVO vo=null;
		MemberVO mvo=new MemberVO();
		vo=loginDao.loginSelect(mvo);
		return vo;
	}
	
	
	
	

}
