package yjc.spring.bean;

import org.springframework.web.multipart.MultipartFile;

public class product {
	private int pro_num;
	private String pro_name;
	private int pro_category;
	private int pro_price;
	private MultipartFile img_stream_1;
	private MultipartFile img_stream_2;
	private MultipartFile img_stream_3;
	private String pro_img;
	private String pro_img_2;
	private String pro_img_3;
	private String pro_size;
	private int pro_amount;
	private String pro_date;
	private String pro_explain;
	private int des_num;
	private MultipartFile uploadfile;
	
	
	
	private int minus_amount;
	private int plus_amount;
	private int cart_num;
	private String search_category;
	private String search_content;
	private String mem_name;
	private String mem_img;
	private String mem_phone;
	private String des_account;
	
	
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getPro_explain() {
		return pro_explain;
	}
	public void setPro_explain(String pro_explain) {
		this.pro_explain = pro_explain;
	}

	
	public String getSearch_content() {
		return search_content;
	}
	public void setSearch_content(String search_content) {
		this.search_content = search_content;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_category() {
		return pro_category;
	}
	public void setPro_category(int pro_category) {
		this.pro_category = pro_category;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_img() {
		return pro_img;
	}
	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}
	public String getPro_size() {
		return pro_size;
	}
	public void setPro_size(String pro_size) {
		this.pro_size = pro_size;
	}
	public int getPro_amount() {
		return pro_amount;
	}
	public void setPro_amount(int pro_amount) {
		this.pro_amount = pro_amount;
	}
	public String getPro_date() {
		return pro_date;
	}
	public void setPro_date(String pro_date) {
		this.pro_date = pro_date;
	}
	public int getDes_num() {
		return des_num;
	}
	public void setDes_num(int des_num) {
		this.des_num = des_num;
	}

	public int getMinus_amount() {
		return minus_amount;
	}
	public void setMinus_amount(int minus_amount) {
		this.minus_amount = minus_amount;
	}
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public String getSearch_category() {
		return search_category;
	}
	public void setSearch_category(String search_category) {
		this.search_category = search_category;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
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
	public int getPlus_amount() {
		return plus_amount;
	}
	public void setPlus_amount(int plus_amount) {
		this.plus_amount = plus_amount;
	}
	public String getDes_account() {
		return des_account;
	}
	public void setDes_account(String des_account) {
		this.des_account = des_account;
	}
	public String getPro_img_2() {
		return pro_img_2;
	}
	public void setPro_img_2(String pro_img_2) {
		this.pro_img_2 = pro_img_2;
	}
	public String getPro_img_3() {
		return pro_img_3;
	}
	public void setPro_img_3(String pro_img_3) {
		this.pro_img_3 = pro_img_3;
	}
	public MultipartFile getImg_stream_1() {
		return img_stream_1;
	}
	public void setImg_stream_1(MultipartFile img_stream_1) {
		this.img_stream_1 = img_stream_1;
	}
	public MultipartFile getImg_stream_2() {
		return img_stream_2;
	}
	public void setImg_stream_2(MultipartFile img_stream_2) {
		this.img_stream_2 = img_stream_2;
	}
	public MultipartFile getImg_stream_3() {
		return img_stream_3;
	}
	public void setImg_stream_3(MultipartFile img_stream_3) {
		this.img_stream_3 = img_stream_3;
	}
	
}
