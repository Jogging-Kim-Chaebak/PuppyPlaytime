package com.puppy.client.mypage.service;

import java.util.List;

import com.puppy.common.vo.PetVO;

public interface MypageService {
	public List<PetVO> petList();
	public int petInsert(PetVO pvo);
	public PetVO petDetail(PetVO pvo);
	public int petUpdate(PetVO pvo);
	public int petDelete(int p_no);
	
}
