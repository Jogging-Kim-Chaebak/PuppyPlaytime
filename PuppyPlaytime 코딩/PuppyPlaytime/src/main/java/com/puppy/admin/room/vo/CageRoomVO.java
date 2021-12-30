package com.puppy.admin.room.vo;

public class CageRoomVO {
	private int c_no; // 케이지 번호
	private String c_kind; // 케이지 종류
	private String c_type; // 케이지 유형
	private int c_price; // 케이지 가격
	private String c_explain; // 케이지 설명
	private String c_picture; // 케이지 사진
	private String c_status; // 케이지 상태
	
	public CageRoomVO() {
		super();
	}

	public CageRoomVO(int c_no, String c_kind, String c_type, int c_price, String c_explain, String c_picture,
			String c_status, String c_usestatus) {
		super();
		this.c_no = c_no;
		this.c_kind = c_kind;
		this.c_type = c_type;
		this.c_price = c_price;
		this.c_explain = c_explain;
		this.c_picture = c_picture;
		this.c_status = c_status;
	}
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_kind() {
		return c_kind;
	}
	public void setC_kind(String c_kind) {
		this.c_kind = c_kind;
	}
	public String getC_type() {
		return c_type;
	}
	public void setC_type(String c_type) {
		this.c_type = c_type;
	}
	public int getC_price() {
		return c_price;
	}
	public void setC_price(int c_price) {
		this.c_price = c_price;
	}
	public String getC_explain() {
		return c_explain;
	}
	public void setC_explain(String c_explain) {
		this.c_explain = c_explain;
	}
	public String getC_picture() {
		return c_picture;
	}
	public void setC_picture(String c_picture) {
		this.c_picture = c_picture;
	}
	public String getC_status() {
		return c_status;
	}
	public void setC_status(String c_status) {
		this.c_status = c_status;
	}
	
}
