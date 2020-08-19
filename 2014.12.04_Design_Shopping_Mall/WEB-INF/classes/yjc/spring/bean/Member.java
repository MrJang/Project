package yjc.spring.bean;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	
	
	private int login_check;
	private int mem_num;
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_addr;
	private String mem_email;
	private String mem_img;
	private String mem_phone;
	private String mem_auth;
	private String mem_gender;
	private String mem_post;
	private String last_login;
	
	private String phone_1;
	private String phone_2;
	private String phone_3;
	
	private String post1;
	private String post2;
	
	
	private String bank;
	private String account;
	
	private int p_count;
	
	private String dsh_back;
	private String dsh_logo;
	private String dsh_num;
	private int des_num;
	private String des_introduce;
	
	
	private MultipartFile mem_uploadfile;
	
	private String url;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_img() {
		return mem_img;
	}
	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_auth() {
		return mem_auth;
	}
	public void setMem_auth(String mem_auth) {
		this.mem_auth = mem_auth;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	
	public MultipartFile getMem_uploadfile() {
		return mem_uploadfile;
	}
	public void setMem_uploadfile(MultipartFile mem_uploadfile) {
		this.mem_uploadfile = mem_uploadfile;
	}


	
	
	
	
	
	
	public String toString() {
		return " mem_num : [" +mem_num+ "] mem_id : [" +mem_id+ "] 권한 : [" +mem_auth+ "]  비밀번호 : [" +mem_pw+ "]  mem_uploadfile : [" + mem_uploadfile + "] mem_img : [" + mem_img +"]" ;
	}
	
	
	
	public String getPhone_1() {
		return phone_1;
	}
	public void setPhone_1(String phone_1) {
		this.phone_1 = phone_1;
	}
	public String getPhone_2() {
		return phone_2;
	}
	public void setPhone_2(String phone_2) {
		this.phone_2 = phone_2;
	}
	public String getPhone_3() {
		return phone_3;
	}
	public void setPhone_3(String phone_3) {
		this.phone_3 = phone_3;
	}
	public String getMem_post() {
		return mem_post;
	}
	public void setMem_post(String mem_post) {
		this.mem_post = mem_post;
	}
	public String getPost1() {
		return post1;
	}
	public void setPost1(String post1) {
		this.post1 = post1;
	}
	public String getPost2() {
		return post2;
	}
	public void setPost2(String post2) {
		this.post2 = post2;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getLogin_check() {
		return login_check;
	}
	public void setLogin_check(int login_check) {
		this.login_check = login_check;
	}
	public String getLast_login() {
		return last_login;
	}
	public void setLast_login(String last_login) {
		this.last_login = last_login;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public String getDsh_back() {
		return dsh_back;
	}
	public void setDsh_back(String dsh_back) {
		this.dsh_back = dsh_back;
	}
	public String getDsh_logo() {
		return dsh_logo;
	}
	public void setDsh_logo(String dsh_logo) {
		this.dsh_logo = dsh_logo;
	}
	public String getDsh_num() {
		return dsh_num;
	}
	public void setDsh_num(String dsh_num) {
		this.dsh_num = dsh_num;
	}
	public int getDes_num() {
		return des_num;
	}
	public void setDes_num(int des_num) {
		this.des_num = des_num;
	}
	public String getDes_introduce() {
		return des_introduce;
	}
	public void setDes_introduce(String des_introduce) {
		this.des_introduce = des_introduce;
	}
	
	
}

