package yjc.wdb.safe.bean;

import java.sql.Timestamp;

public class CafeBean {
	
	 
	
	 private int c_num;
	 private String c_name;
	 private String id;
	 private String c_image;
	 private String c_info;
	 private Timestamp since_date;
	 private String c_member;
	 private int board_num;
	 
	 
	 
	 
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getC_member() {
		return c_member;
	}
	public void setC_member(String c_member) {
		this.c_member = c_member;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getC_image() {
		return c_image;
	}
	public void setC_image(String c_image) {
		this.c_image = c_image;
	}
	public String getC_info() {
		return c_info;
	}
	public void setC_info(String c_info) {
		this.c_info = c_info;
	}
	public Timestamp getSince_date() {
		return since_date;
	}
	public void setSince_date(Timestamp since_date) {
		this.since_date = since_date;
	}
	

	 
}
