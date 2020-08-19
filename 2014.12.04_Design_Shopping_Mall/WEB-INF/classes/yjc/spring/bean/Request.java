package yjc.spring.bean;

import org.springframework.web.multipart.MultipartFile;

public class Request {
	private int req_num;
	private String req_name;
	private String req_category;
	private String req_img;
	private int req_price;
	private String req_date;
	private String req_sender;
	private String req_receiver;
	private String req_content;
	private String req_content_date;
	private int req_process;
	private int sender_mod;
	private int receiver_mod;
	private String size1;
	private String size2;
	private String size3;
	private String size4;
	private String size5;
	private String size6;
	private String feedback;
	private String feedback_date;
	private int r_count;
	private String uploadimg;
	private MultipartFile uploadfile;
	
	private int can_category; 
	private String can_title;
	private String can_date;
	private String can_img;
	
	
	public int getReq_num() {
		return req_num;
	}
	public void setReq_num(int req_num) {
		this.req_num = req_num;
	}
	public String getReq_name() {
		return req_name;
	}
	public void setReq_name(String req_name) {
		this.req_name = req_name;
	}
	public String getReq_category() {
		return req_category;
	}
	public void setReq_category(String req_category) {
		this.req_category = req_category;
	}
	public String getReq_img() {
		return req_img;
	}
	public void setReq_img(String req_img) {
		this.req_img = req_img;
	}
	public int getReq_price() {
		return req_price;
	}
	public void setReq_price(int req_price) {
		this.req_price = req_price;
	}
	public String getReq_date() {
		return req_date;
	}
	public void setReq_date(String req_date) {
		this.req_date = req_date;
	}
	public String getReq_sender() {
		return req_sender;
	}
	public void setReq_sender(String req_sender) {
		this.req_sender = req_sender;
	}
	public String getReq_receiver() {
		return req_receiver;
	}
	public void setReq_receiver(String req_receiver) {
		this.req_receiver = req_receiver;
	}
	public String getReq_content() {
		return req_content;
	}
	public void setReq_content(String req_content) {
		this.req_content = req_content;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	
	

	
	public String toString() {
		return " req_num : [" +req_num+ "] req_sender : [" +req_sender+ "] req_category : [" +req_category+ "]  req_price : [" + req_price + "] req_date : [" + req_date+"] req_name ["+req_name+"] req_receiver : [" +req_receiver+ "]" ;
	}
	
//	req_img : [" +req_img+ "]
	public String getUploadimg() {
		return uploadimg;
	}
	public void setUploadimg(String uploadimg) {
		this.uploadimg = uploadimg;
	}
	public int getReq_process() {
		return req_process;
	}
	public void setReq_process(int req_process) {
		this.req_process = req_process;
	}
	
	
	public String getSize1() {
		return size1;
	}
	public void setSize1(String size1) {
		this.size1 = size1;
	}
	public String getSize2() {
		return size2;
	}
	public void setSize2(String size2) {
		this.size2 = size2;
	}
	public String getSize3() {
		return size3;
	}
	public void setSize3(String size3) {
		this.size3 = size3;
	}
	public String getSize4() {
		return size4;
	}
	public void setSize4(String size4) {
		this.size4 = size4;
	}
	public String getSize5() {
		return size5;
	}
	public void setSize5(String size5) {
		this.size5 = size5;
	}
	public String getSize6() {
		return size6;
	}
	public void setSize6(String size6) {
		this.size6 = size6;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public String getFeedback_date() {
		return feedback_date;
	}
	public void setFeedback_date(String feedback_date) {
		this.feedback_date = feedback_date;
	}
	public String getReq_content_date() {
		return req_content_date;
	}
	public void setReq_content_date(String req_content_date) {
		this.req_content_date = req_content_date;
	}
	public int getR_count() {
		return r_count;
	}
	public void setR_count(int r_count) {
		this.r_count = r_count;
	}
	public int getCan_category() {
		return can_category;
	}
	public void setCan_category(int can_category) {
		this.can_category = can_category;
	}
	public String getCan_title() {
		return can_title;
	}
	public void setCan_title(String can_title) {
		this.can_title = can_title;
	}
	public String getCan_date() {
		return can_date;
	}
	public void setCan_date(String can_date) {
		this.can_date = can_date;
	}
	public String getCan_img() {
		return can_img;
	}
	public void setCan_img(String can_img) {
		this.can_img = can_img;
	}
	public int getSender_mod() {
		return sender_mod;
	}
	public void setSender_mod(int sender_mod) {
		this.sender_mod = sender_mod;
	}
	public int getReceiver_mod() {
		return receiver_mod;
	}
	public void setReceiver_mod(int receiver_mod) {
		this.receiver_mod = receiver_mod;
	}
	

}
