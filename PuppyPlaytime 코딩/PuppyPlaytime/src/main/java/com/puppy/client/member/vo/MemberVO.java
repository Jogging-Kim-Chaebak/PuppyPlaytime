package com.puppy.client.member.vo;

import java.sql.Date;

public class MemberVO {

   private String m_id;// 아이디
   private String m_pw;// 비밀번호
   private String m_name;// 이름
   private String m_birth;// 생년월일
   private String m_email;// 이메일 주소
   private String m_phone;// 전화번호
   private String m_address;// 주소
   private String m_optional;// 선택약관
   private String m_required1;// 필수약관1
   private String m_required2;// 필수약관2
   private String m_status;// 회원상태
   private Date m_regdate;//가입일
   
   public MemberVO() {
      super();
   }

   public MemberVO(String m_id, String m_pw, String m_name, String m_birth, String m_email, String m_phone,
         String m_address, String m_optional, String m_required1, String m_required2, String m_status,
         Date m_regdate) {
      super();
      this.m_id = m_id;
      this.m_pw = m_pw;
      this.m_name = m_name;
      this.m_birth = m_birth;
      this.m_email = m_email;
      this.m_phone = m_phone;
      this.m_address = m_address;
      this.m_optional = m_optional;
      this.m_required1 = m_required1;
      this.m_required2 = m_required2;
      this.m_status = m_status;
      this.m_regdate = m_regdate;
   }


   public String getM_id() {
      return m_id;
   }

   public void setM_id(String m_id) {
      this.m_id = m_id;
   }

   public String getM_pw() {
      return m_pw;
   }

   public void setM_pw(String m_pw) {
      this.m_pw = m_pw;
   }

   public String getM_name() {
      return m_name;
   }

   public void setM_name(String m_name) {
      this.m_name = m_name;
   }

   public String getM_birth() {
      return m_birth;
   }

   public void setM_birth(String m_birth) {
      this.m_birth = m_birth;
   }

   public String getM_email() {
      return m_email;
   }

   public void setM_email(String m_email) {
      this.m_email = m_email;
   }

   public String getM_phone() {
      return m_phone;
   }

   public void setM_phone(String m_phone) {
      this.m_phone = m_phone;
   }

   public String getM_address() {
      return m_address;
   }

   public void setM_address(String m_address) {
      this.m_address = m_address;
   }

   public String getM_optional() {
      return m_optional;
   }

   public void setM_optional(String m_optional) {
      this.m_optional = m_optional;
   }

   public String getM_required1() {
      return m_required1;
   }

   public void setM_required1(String m_required1) {
      this.m_required1 = m_required1;
   }

   public String getM_required2() {
      return m_required2;
   }

   public void setM_required2(String m_required2) {
      this.m_required2 = m_required2;
   }

   public String getM_status() {
      return m_status;
   }

   public void setM_status(String m_status) {
      this.m_status = m_status;
   }

   public Date getM_regdate() {
      return m_regdate;
   }

   public void setM_regdate(Date m_regdate) {
      this.m_regdate = m_regdate;
   }

   @Override
   public String toString() {
      return "MemberVO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_birth=" + m_birth
            + ", m_email=" + m_email + ", m_phone=" + m_phone + ", m_address=" + m_address + ", m_optional="
            + m_optional + ", m_required1=" + m_required1 + ", m_required2=" + m_required2 + ", m_status="
            + m_status + ", m_regdate=" + m_regdate + "]";
   }
}