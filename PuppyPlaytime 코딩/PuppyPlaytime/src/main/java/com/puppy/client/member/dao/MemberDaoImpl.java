package com.puppy.client.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.puppy.client.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Inject
	private SqlSession session;

	private static final String namespace = "query.member";

	// 회원가입 처리
	@Override
	public void insert(MemberVO mvo) throws Exception {
		session.insert(namespace + ".insert", mvo);

	}

	// 아이디 중복체크
	@Override
	public MemberVO m_idConfirm(String id) throws Exception {
		return session.selectOne(namespace + ".m_idConfirm", id);
	}

	// 아이디 찾기
	@Override
	public MemberVO find_id(String m_email) throws Exception {
		return (MemberVO) session.selectOne(namespace + ".find_id", m_email);
	}

	// 아이디와 이메일 확인 메서드
	@Override
	public MemberVO find_pw(MemberVO mvo) throws Exception {
		return (MemberVO) session.selectOne(namespace + ".find_pw", mvo);
	}

	// 비밀번호 수정 페이지
	@Override
	public MemberVO read(MemberVO mvo) throws Exception {
		return (MemberVO) session.selectOne(namespace + ".read", mvo);
	}

	// 비밀번호 수정 팝업 페이지
	@Override
	public void update(MemberVO mvo) throws Exception {
		// System.out.println("aaaaaaaaa"+mvo.getM_pw());
		session.update(namespace + ".update", mvo);

	}

	// 이메일 리스트 받아오기
	@Override
	public List<String> getEmailList() throws Exception {
		return session.selectList(namespace+".getEmailList");
	}

}
