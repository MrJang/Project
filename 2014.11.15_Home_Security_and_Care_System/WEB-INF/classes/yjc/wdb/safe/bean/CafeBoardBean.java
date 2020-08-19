package yjc.wdb.safe.bean;

import java.sql.Timestamp;

public class CafeBoardBean {
	
	
	private int num;
	private String id;
	private String e_id;
	private String subject;
	private String content;
	private Timestamp reg_date;
	private int readcount;
	private int board_cate;
	private int cafe_num;
	private String s_star;
	private String star_average;
	private String cafe_select;
	
	
	
	public String getCafe_select() {
		return cafe_select;
	}
	public void setCafe_select(String cafe_select) {
		this.cafe_select = cafe_select;
	}
	public String getS_star() {
		return s_star;
	}
	public void setS_star(String s_star) {
		this.s_star = s_star;
	}
	public String getStar_average() {
		return star_average;
	}
	public void setStar_average(String star_average) {
		this.star_average = star_average;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getBoard_cate() {
		return board_cate;
	}
	public void setBoard_cate(int board_cate) {
		this.board_cate = board_cate;
	}
	public int getCafe_num() {
		return cafe_num;
	}
	public void setCafe_num(int cafe_num) {
		this.cafe_num = cafe_num;
	}

	
}
