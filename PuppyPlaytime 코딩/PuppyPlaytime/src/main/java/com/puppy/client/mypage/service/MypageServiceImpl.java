package com.puppy.client.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.client.member.vo.MemberVO;
import com.puppy.client.mypage.dao.MypageDAO;
import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.common.vo.ExtraServiceVO;
import com.puppy.common.vo.PetVO;

@Service
@Transactional
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypageDAO;
	 
	//펫목록 구현
	@Override
	public List<PetVO> petList(String m_id) {
		List<PetVO> myList=null;
		myList=mypageDAO.petList(m_id);
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

	//예약 리스트 구현(예약정보)
	@Override
	public List<ReservationVO> reservationList(String m_id) {
		return mypageDAO.reservationList(m_id);
	}
	
	//예약 상세보기 구현(예약정보)
	@Override
	public ReservationVO reservationDetail(ReservationVO rvo) {
		ReservationVO detail = null;
		detail = mypageDAO.reservationDetail(rvo);
		return detail;
	}
	
	//예약 상세보기 구현(부가서비스)
	@Override
	public String reservationExtraservice(int r_extraService) throws Exception {
		return mypageDAO.reservationExtraservice(r_extraService);
	}
	
	//예약 취소 구현
	@Override
	public int reservationCancel(ReservationVO rvo) {
		int result=0;
		try {
			result=mypageDAO.reservationCancel(rvo);
		}catch(Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
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
