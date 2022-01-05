package com.puppy.admin.reply.vo;

import java.sql.Date;

public class ReplyVO {

	private int reply_no; // 댓글번호
	private int q_no; // 문의게시판 글번호
	private String reply_regdate; // 댓글 작성일
	private String reply_content; // 댓글내용
	private String reply_title; // 댓글 제목
	private String reply_registrant; // 댓글 등록자 (관리자)
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getReply_regdate() {
		return reply_regdate;
	}
	public void setReply_regdate(String reply_regdate) {
		this.reply_regdate = reply_regdate;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_title() {
		return reply_title;
	}
	public void setReply_title(String reply_title) {
		this.reply_title = reply_title;
	}
	public String getReply_registrant() {
		return reply_registrant;
	}
	public void setReply_registrant(String reply_registrant) {
		this.reply_registrant = reply_registrant;
	}
	
}
