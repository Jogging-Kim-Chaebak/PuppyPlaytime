package com.puppy.client.inquiry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.puppy.client.inquiry.dao.InquiryDao;
import com.puppy.client.inquiry.vo.InquiryVO;

@Service
@Transactional
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryDao inquiryDao;
	
	// 리스트
	@Override
	public List<InquiryVO> inquiryList() {
		List<InquiryVO> myList = null;
		myList = inquiryDao.inquiryList();
		return myList;
	}

	// 글쓰기
	@Override
	public int inquiryInsert(InquiryVO ivo) {
		int result = 0;
		
		try {
			result = inquiryDao.inquiryInsert(ivo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 상세보기
	@Override
	public InquiryVO inquiryDetail(InquiryVO ivo) {
		InquiryVO detail = null;
		detail = inquiryDao.inquiryDetail(ivo);
		return detail;
	}

	// 글수정 구현
	@Override
	public int inquiryUpdate(InquiryVO ivo) {
		int result = 0;
		try {
			result = inquiryDao.inquiryUpdate(ivo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 글삭제
	@Override
	public int inquiryDelete(int q_no) {
		int result = 0;
		try {
			result = inquiryDao.inquirtDelete(q_no);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 사용자 문의내역 자신의 문의내역만 보이게 하기
	@Override
	public List<InquiryVO> inquiryMyList(String userId) {
		
		return inquiryDao.inquiryMyList(userId);
	}

}
