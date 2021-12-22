package com.puppy.client.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.client.mypage.dao.MypageDAO;
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

}
