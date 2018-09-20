package com.hk.toCheckFinal.dtos;

public class HcLoginDto {

   
   private int seq; //식별번호
   private String id; //사용자 아이디
   private String name; // 사용자 이름
   private String password; // 비밀번호
   private String address; //사용자 주소
   private String phone; //전화번호
   private String email; //이메일
   private String enabled; //삭제여부
   private String role; // 등급
   private String question; // 질문
   private String answer; //답변


   public HcLoginDto() {
      super();
   }

   public HcLoginDto(int seq, String id, String name, String password, String address, String phone, String email,
         String enabled, String role, String question, String answer) {
      super();
      this.seq = seq;
      this.id = id;
      this.name = name;
      this.password = password;
      this.address = address;
      this.phone = phone;
      this.email = email;
      this.enabled = enabled;
      this.role = role;
      this.question = question;
      this.answer = answer;
   }


   
   public int getSeq() {
      return seq;
   }

   public void setSeq(int seq) {
      this.seq = seq;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getEnabled() {
      return enabled;
   }

   public void setEnabled(String enabled) {
      this.enabled = enabled;
   }

   public String getRole() {
      return role;
   }

   public void setRole(String role) {
      this.role = role;
   }

   public String getQuestion() {
      return question;
   }

   public void setQuestion(String question) {
      this.question = question;
   }

   public String getAnswer() {
      return answer;
   }

   public void setAnswer(String answer) {
      this.answer = answer;
   }

   @Override
   public String toString() {
      return "HcLoginDto [seq=" + seq + ", id=" + id + ", name=" + name + ", password=" + password + ", address="
            + address + ", phone=" + phone + ", email=" + email + ", enabled=" + enabled + ", role=" + role
            + ", question=" + question + ", answer=" + answer + "]";
   }


   
   
   
}

