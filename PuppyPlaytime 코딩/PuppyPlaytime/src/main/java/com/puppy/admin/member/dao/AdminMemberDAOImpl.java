package com.puppy.admin.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.puppy.client.member.vo.MemberVO;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {
	
	@Inject
	private SqlSession SqlSession;
	
	private static final String namespace = "query.adminMember";
	@Override
	public List<MemberVO> adminMemberList(MemberVO param) {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+".adminMemberList",param);
	}

	@Override
	public int adminMemberDisabled(String m_id) {
		// TODO Auto-generated method stub
		return SqlSession.update(namespace+".adminMemberDisabled",m_id);
	}

}
