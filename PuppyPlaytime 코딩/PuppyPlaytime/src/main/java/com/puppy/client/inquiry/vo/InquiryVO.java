package com.puppy.client.inquiry.vo;

public class InquiryVO {

	private int q_no = 0; // 글번호
	private String m_id = ""; // 작성자
	private String q_title = ""; // 제목
	private String q_content = ""; // 내용
	private String q_regdate = ""; // 작성일
	
	public InquiryVO() {
		super();
	}
	
	public InquiryVO(int q_no, String m_id, String q_title, String q_content) {
		super();
		this.q_no = q_no;
		this.m_id = m_id;
		this.q_title = q_title;
		this.q_content = q_content;
	}
	
	public InquiryVO(int q_no, String m_id, String q_title, String q_content, String q_regdate) {
		super();
		this.q_no = q_no;
		this.m_id = m_id;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_regdate = q_regdate;
	}
	
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_regdate() {
		return q_regdate;
	}
	public void setQ_regdate(String q_regdate) {
		this.q_regdate = q_regdate;
	}
	
}
