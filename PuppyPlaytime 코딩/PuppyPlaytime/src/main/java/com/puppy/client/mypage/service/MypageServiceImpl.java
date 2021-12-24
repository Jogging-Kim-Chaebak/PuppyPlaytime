package com.puppy.client.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.client.member.vo.MemberVO;
import com.puppy.client.mypage.dao.MypageDAO;
import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.common.vo.PetVO;

@Service
@Transactional
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypageDAO;
	 
	//펫목록 구현
	@Override
	public List<PetVO> petList() {
		List<PetVO> myList=null;
		myList=mypageDAO.petList();
		return myList;
	}

	//펫등록 구현
	@Override
	public int petInsert(PetVO pvo) {
		return mypageDAO.petInsert(pvo);
	}

	//펫 수정 구현
	@Override
	public int petUpdate(PetVO pvo) {
		int result=0;
		try {
			result=mypageDAO.petUpdate(pvo);
		}catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}

	//펫 삭제 구현
	@Override
	public int petDelete(int p_no) {
		
		int result=0;
		try {
			result=mypageDAO.petDelete(p_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}

	//펫 상세 구현
	@Override
	public PetVO petDetail(PetVO pvo) {
		
		PetVO detail = null;
		detail = mypageDAO.petDetail(pvo);
		return detail;
		
	}

	//예약 리스트 구현
	@Override
	public List<ReservationVO> reservationList() {
		List<ReservationVO> list=null;
		list=mypageDAO.reservationList();
		return list;
	}

	//내정보 구현
	@Override
	public MemberVO myDetail(MemberVO mvo) {
		MemberVO detail = null;
		detail = mypageDAO.myDetail(mvo);
		return detail;
	}

	//내정보 수정 구현
	@Override
	public int myUpdate(MemberVO mvo) {
		int result=0;
		try {
			result=mypageDAO.myUpdate(mvo);
		}catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}

}
