package com.puppy.client.mypage.dao;

import java.util.List;

import com.puppy.client.member.vo.MemberVO;
import com.puppy.client.mypage.vo.MypageVO;
import com.puppy.client.notice.vo.NoticeVO;
import com.puppy.client.reservation.vo.ReservationVO;
import com.puppy.common.vo.PageRequest;
import com.puppy.common.vo.PetVO;

public interface MypageDAO {
	//펫관리
	public List<PetVO> petList(String m_id);
	public int petInsert(PetVO pvo);
	public PetVO petDetail(PetVO pvo);
	public int petUpdate(PetVO pvo);
	public int petDelete(int p_no);
	
	//예약관리
	//public List<ReservationVO> reservationList(String m_id);
	public int reservationCancel(ReservationVO rvo);
	public ReservationVO reservationDetail(ReservationVO rvo);
	public String reservationExtraservice(int r_extraService) throws Exception;
	//게시글 전체 건수를 반환
		public int count() throws Exception;
		//페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
		public List<ReservationVO> reservationList(MypageVO mvo) throws Exception;
	
	//내정보관리
	public MemberVO myDetail(MemberVO mvo);
	public int myUpdate(MemberVO mvo);
	
	
}
