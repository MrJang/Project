package yjc.wdb.safe.bean;

import java.sql.Timestamp;

//자녀업체 신청, 신청,업체 게시판, 후기 게시판, 스케줄러
//답글없음
//작성번호,id,제목,내용,출발지,목적지,시간,신청분류,특이사항,작성날짜,조회수,분류,별점
public class ChildrenBean {
	
	
	
	
	private int num;
	private String id;
	private String departure;
	private String destination;
	private String start_time;
	private String stop_time;
	private String crime_time;
	private int readcount;
	private int category;
	private String e_id;
	private String subject;
	private String content;
	private String request;
	private String report;
	private Timestamp reg_date;
	private String s_star;
	private String star_average;
	
	
	private String notice;
	private String member_count;
	private String current_count;
	private String start_date;
	private String end_date;
	private int e_num;
	private int cafe_select;

	
	//이거슨 기간 설정
	private String start_year;
	private String start_month;
	private String start_day;
	
	private String end_year;
	private String end_month;
	private String end_day;
	
	//신청기간이 끝날때 끝낫다고 값넘겨주는 변수;
	
	private String finish;
	private String ch_name;
	private String ch_pass;
	
	
	
	
	
	public String getCh_name() {
		return ch_name;
	}
	public void setCh_name(String ch_name) {
		this.ch_name = ch_name;
	}
	public String getCh_pass() {
		return ch_pass;
	}
	public void setCh_pass(String ch_pass) {
		this.ch_pass = ch_pass;
	}
	public String getFinish() {
		return finish;
	}
	public void setFinish(String finish) {
		this.finish = finish;
	}
	public String getStart_year() {
		return start_year;
	}
	public void setStart_year(String start_year) {
		this.start_year = start_year;
	}
	public String getStart_month() {
		return start_month;
	}
	public void setStart_month(String start_month) {
		this.start_month = start_month;
	}
	public String getStart_day() {
		return start_day;
	}
	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}
	public String getEnd_year() {
		return end_year;
	}
	public void setEnd_year(String end_year) {
		this.end_year = end_year;
	}
	public String getEnd_month() {
		return end_month;
	}
	public void setEnd_month(String end_month) {
		this.end_month = end_month;
	}
	public String getEnd_day() {
		return end_day;
	}
	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}
	public int getCafe_select() {
		return cafe_select;
	}
	public void setCafe_select(int cafe_select) {
		this.cafe_select = cafe_select;
	}
	public String getCurrent_count() {
		return current_count;
	}
	public void setCurrent_count(String current_count) {
		this.current_count = current_count;
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
	
	public String getDeparture() {
		return departure;
	}
	public void setDeparture(String departure) {
		this.departure = departure;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	
	
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getStop_time() {
		return stop_time;
	}
	public void setStop_time(String stop_time) {
		this.stop_time = stop_time;
	}
	public String getCrime_time() {
		return crime_time;
	}
	public void setCrime_time(String crime_time) {
		this.crime_time = crime_time;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
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
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
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
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getMember_count() {
		return member_count;
	}
	public void setMember_count(String member_count) {
		this.member_count = member_count;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	
	
	
	
}
