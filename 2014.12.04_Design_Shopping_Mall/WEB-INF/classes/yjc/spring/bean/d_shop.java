package yjc.spring.bean;

import org.springframework.web.multipart.MultipartFile;



public class d_shop  {
	
		private String dsh_back;
		private String dsh_logo;
		private String dsh_num;
		public  int des_num;
		private String mem_id;
		private int dsh_boardnum;
		private int dsh_category;
		private String dsh_date;
		private String dsh_writer;
		private String dsh_title;
		private String dsh_content;
		private String dsh_readcount;
//		---------이건 구매목록 부
		private int p_num;
		private int p_price;
		private String p_status;
		private String p_date;
		private String p_receiver;
		private String p_amount;
		
		
		
		public String getP_amount() {
			return p_amount;
		}
		public void setP_amount(String p_amount) {
			this.p_amount = p_amount;
		}





		private int day_sales;

		
		public int getP_num() {
			return p_num;
		}
		public void setP_num(int p_num) {
			this.p_num = p_num;
		}
		public int getP_price() {
			return p_price;
		}
		public void setP_price(int p_price) {
			this.p_price = p_price;
		}
		public String getP_status() {
			return p_status;
		}
		public void setP_status(String p_status) {
			this.p_status = p_status;
		}
		public String getP_date() {
			return p_date;
		}
		public void setP_date(String p_date) {
			this.p_date = p_date;
		}
		
		
		
		

		private MultipartFile uploadfile;
		
		
		public MultipartFile getUploadfile() {
			return uploadfile;
		}
		public void setUploadfile(MultipartFile uploadfile) {
			this.uploadfile = uploadfile;
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
		public int getDsh_boardnum() {
			return dsh_boardnum;
		}
		public void setDsh_boardnum(int dsh_boardnum) {
			this.dsh_boardnum = dsh_boardnum;
		}
		public int getDsh_category() {
			return dsh_category;
		}
		public void setDsh_category(int dsh_category) {
			this.dsh_category = dsh_category;
		}
		public String getDsh_date() {
			return dsh_date;
		}
		public void setDsh_date(String dsh_date) {
			this.dsh_date = dsh_date;
		}
		public String getDsh_writer() {
			return dsh_writer;
		}
		public void setDsh_writer(String dsh_writer) {
			this.dsh_writer = dsh_writer;
		}
		public String getDsh_title() {
			return dsh_title;
		}
		public void setDsh_title(String dsh_title) {
			this.dsh_title = dsh_title;
		}
		public String getDsh_content() {
			return dsh_content;
		}
		public void setDsh_content(String dsh_content) {
			this.dsh_content = dsh_content;
		}
		public String getDsh_readcount() {
			return dsh_readcount;
		}
		public void setDsh_readcount(String dsh_readcount) {
			this.dsh_readcount = dsh_readcount;
		}
		
		
				
		public String toString() {
			return " 보드번호 : [" +dsh_boardnum+ "] 내용 : [" +dsh_content+"] ";
					}
		public String getMem_id() {
			return mem_id;
		}
		public void setMem_id(String mem_id) {
			this.mem_id = mem_id;
		}
		public int getDes_num() {
			return des_num;
		}
		public void setDes_num(int des_num) {
			this.des_num = des_num;
		}
		public String getP_receiver() {
			return p_receiver;
		}
		public void setP_receiver(String p_receiver) {
			this.p_receiver = p_receiver;
		}
		public int getDay_sales() {
			return day_sales;
		}
		public void setDay_sales(int day_sales) {
			this.day_sales = day_sales;
		}
	
}
