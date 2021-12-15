package com.puppy.client.notice.vo;

import java.util.Date;

public class NoticeVO {

	
	   private int n_no = 0;
	   private String n_regdate ="";
	   private String n_content ="";
	   private String n_title ="";
	   private String n_registrant ="";
	   
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(String n_regdate) {
		this.n_regdate = n_regdate;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_registrant() {
		return n_registrant;
	}
	public void setN_registrant(String n_registrant) {
		this.n_registrant = n_registrant;
	}
	   
}