package com.puppy.client.inquiry.service;

import java.util.List;

import com.puppy.client.inquiry.vo.InquiryVO;

public interface InquiryService {

	public List<InquiryVO> inquiryList();

	public int inquiryInsert(InquiryVO ivo);

	public InquiryVO inquiryDetail(InquiryVO ivo);

	public int inquiryUpdate(InquiryVO ivo);

	public int inquiryDelete(int q_no);

	public List<InquiryVO> inquiryMyList(String m_id);
}
