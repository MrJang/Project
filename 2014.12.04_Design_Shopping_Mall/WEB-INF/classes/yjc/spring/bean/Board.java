package yjc.spring.bean;


import org.springframework.web.multipart.MultipartFile;

public class Board  {
	
		private int bod_num;
		private String bod_title;
		private String bod_content;
		private String bod_recommend;
		private int bod_readcount;
		private String bod_date;
		private String bod_img;
		private String bod_img2;
		private String bod_img3;
		private int bod_img_category;
		private int bod_category; 
		private int cmm_num;
		private String mem_id;
		private MultipartFile uploadfile;
		private int pageNum;
		private String can_count;
		private int bod_des_category;
		private int bod_price;
		

		public int getPageNum() {
			return pageNum;
		}
		public void setPageNum(int pageNum) {
			this.pageNum = pageNum;
		}
		
		public int getBod_num() {
			return bod_num;
		}
		public void setBod_num(int bod_num) {
			this.bod_num = bod_num;
		}
		public String getBod_title() {
			return bod_title;
		}
		public void setBod_title(String bod_title) {
			this.bod_title = bod_title;
		}
		public String getBod_content() {
			return bod_content;
		}
		public void setBod_content(String bod_content) {
			this.bod_content = bod_content;
		}
		public String getBod_recommend() {
			return bod_recommend;
		}
		public void setBod_recommend(String bod_recommend) {
			this.bod_recommend = bod_recommend;
		}
		public int getBod_readcount() {
			return bod_readcount;
		}
		public void setBod_readcount(int bod_readcount) {
			this.bod_readcount = bod_readcount;
		}
		public String getBod_date() {
			return bod_date;
		}
		public void setBod_date(String bod_date) {
			this.bod_date = bod_date;
		}
		
		public int getBod_category() {
			return bod_category;
		}
		public void setBod_category(int bod_category) {
			this.bod_category = bod_category;
		}
		public int getCmm_num() {
			return cmm_num;
		}
		public void setCmm_num(int cmm_num) {
			this.cmm_num = cmm_num;
		}
		public String getMem_id() {
			return mem_id;
		}
		public void setMem_id(String mem_id) {
			this.mem_id = mem_id;
		}
		public MultipartFile getUploadfile() {
			return uploadfile;
		}
		public void setUploadfile(MultipartFile uploadfile) {
			this.uploadfile = uploadfile;
		}
		public String getBod_img() {
			return bod_img;
		}
		public void setBod_img(String bod_img) {
			this.bod_img = bod_img;
		}
		
//		public String toString() {
//			return "bod_content - "+bod_content +"bod_title - "+bod_title;
//		}
		public String getCan_count() {
			return can_count;
		}
		public void setCan_count(String can_count) {
			this.can_count = can_count;
		}
		public int getBod_des_category() {
			return bod_des_category;
		}
		public void setBoard_des_category(int bod_des_category) {
			this.bod_des_category = bod_des_category;
		}
		public String getBod_img2() {
			return bod_img2;
		}
		public void setBod_img2(String bod_img2) {
			this.bod_img2 = bod_img2;
		}
		public String getBod_img3() {
			return bod_img3;
		}
		public void setBod_img3(String bod_img3) {
			this.bod_img3 = bod_img3;
		}
		public int getBod_img_category() {
			return bod_img_category;
		}
		public void setBod_img_category(int bod_img_category) {
			this.bod_img_category = bod_img_category;
		}
		public int getBod_price() {
			return bod_price;
		}
		public void setBod_price(int bod_price) {
			this.bod_price = bod_price;
		}
		
		
}
