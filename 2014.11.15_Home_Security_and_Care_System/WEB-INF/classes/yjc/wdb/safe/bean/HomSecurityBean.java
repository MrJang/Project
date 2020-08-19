package yjc.wdb.safe.bean;

import java.sql.Timestamp;

public class HomSecurityBean {
	private int num;
	private String id;
	private Timestamp reg_date;
	private int category;
	private String notice;
	private String cirme_kind;
	private String crime_time;
	private Timestamp regdate;
	private int time;
	private String walt;
	private String price;
	public String getWalt() {
		return walt;
	}
	public void setWalt(String walt) {
		this.walt = walt;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getNum() {
		return num;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
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
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getCirme_kind() {
		return cirme_kind;
	}
	public void setCirme_kind(String cirme_kind) {
		this.cirme_kind = cirme_kind;
	}
	public String getCrime_time() {
		return crime_time;
	}
	public void setCrime_time(String crime_time) {
		this.crime_time = crime_time;
	}
	
	

}
