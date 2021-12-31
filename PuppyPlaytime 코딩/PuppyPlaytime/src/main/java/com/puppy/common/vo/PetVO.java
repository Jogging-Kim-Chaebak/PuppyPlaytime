package com.puppy.common.vo;

import org.springframework.web.multipart.MultipartFile;

public class PetVO {
	private int p_no = 0; // 펫번호
	private String p_picture = ""; // 강아지사진
	private String p_name = ""; // 이름
	private String p_dogbreed = ""; // 견종
	private String p_gender = ""; // 성별
	private String p_weight = ""; // 체중
	private String p_unique = ""; // 특이사항
	private String m_id = ""; // 회원 아이디
	
	//파일 업로드를 위한 속성
	private MultipartFile file;	// 첨부파일
	
	
	
	public PetVO() {
		super();
	}

	public PetVO(int p_no, String p_picture, String p_name, String p_dogbreed, String p_gender, String p_weight,
			String p_unique, String m_id) {
		super();
		this.p_no = p_no;
		this.p_picture = p_picture;
		this.p_name = p_name;
		this.p_dogbreed = p_dogbreed;
		this.p_gender = p_gender;
		this.p_weight = p_weight;
		this.p_unique = p_unique;
		this.m_id = m_id;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_picture() {
		return p_picture;
	}

	public void setP_picture(String p_picture) {
		this.p_picture = p_picture;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_dogbreed() {
		return p_dogbreed;
	}

	public void setP_dogbreed(String p_dogbreed) {
		this.p_dogbreed = p_dogbreed;
	}

	public String getP_gender() {
		return p_gender;
	}

	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}

	public String getP_weight() {
		return p_weight;
	}

	public void setP_weight(String p_weight) {
		this.p_weight = p_weight;
	}

	public String getP_unique() {
		return p_unique;
	}

	public void setP_unique(String p_unique) {
		this.p_unique = p_unique;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
	
}
