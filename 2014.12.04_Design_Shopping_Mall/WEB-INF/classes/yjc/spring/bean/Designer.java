package yjc.spring.bean;

public class Designer {
	private int des_num;
	private int ach_num;
	private int shp_num;
	private int mem_num;
	private String des_account;
	
	private String des_introduce;
	
	
	public int getAch_num() {
		return ach_num;
	}
	public void setAch_num(int ach_num) {
		this.ach_num = ach_num;
	}
	public int getShp_num() {
		return shp_num;
	}
	public void setShp_num(int shp_num) {
		this.shp_num = shp_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getDes_num() {
		return des_num;
	}
	public void setDes_num(int des_num) {
		this.des_num = des_num;
	}
	public String getDes_account() {
		return des_account;
	}
	public void setDes_account(String des_account) {
		this.des_account = des_account;
	}
	

	public String toString() {
		return "des_num ["+des_num +"] ach_num ["+ach_num+"] shp_num ["+shp_num+"] mem_num ["+mem_num+"] des_account ["+des_account+"]";
	}
	public String getDes_introduce() {
		return des_introduce;
	}
	public void setDes_introduce(String des_introduce) {
		this.des_introduce = des_introduce;
	}	
	
}
