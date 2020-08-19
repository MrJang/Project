package yjc.spring.bean;

import org.springframework.web.multipart.MultipartFile;

public class Canvas {
	
		private String can_title;
		private String can_date;
		private String can_img;
		private int can_category; 
		private int mem_num;
		private int can_num;
		private String mem_id;
		
		private int can_count;
		
		private MultipartFile uploadfile;
		private int pageNum;
		
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
		public int getCan_category() {
			return can_category;
		}
		public void setCan_category(int can_category) {
			this.can_category = can_category;
		}
		public int getPageNum() {
			return pageNum;
		}
		public void setPageNum(int pageNum) {
			this.pageNum = pageNum;
		}
		public int getMem_num() {
			return mem_num;
		}
		public void setMem_num(int mem_num) {
			this.mem_num = mem_num;
		}
		public MultipartFile getUploadfile() {
			return uploadfile;
		}
		public void setUploadfile(MultipartFile uploadfile) {
			this.uploadfile = uploadfile;
		}
		public int getCan_num() {
			return can_num;
		}
		public void setCan_num(int can_num) {
			this.can_num = can_num;
		}
		public String getMem_id() {
			return mem_id;
		}
		public void setMem_id(String mem_id) {
			this.mem_id = mem_id;
		}
		public String toString() {
			return " Canvas :  mem_num : [" +mem_num+ "] mem_id :[ "+mem_id +" ]  uploadfile : [" + uploadfile + "] can_img : [" + can_img  +"]";
		}
		public int getCan_count() {
			return can_count;
		}
		public void setCan_count(int can_count) {
			this.can_count = can_count;
		}
	
		
		
}
