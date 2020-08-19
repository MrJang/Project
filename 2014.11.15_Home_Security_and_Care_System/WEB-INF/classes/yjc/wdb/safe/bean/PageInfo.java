package yjc.wdb.safe.bean;

import java.util.List;

public class PageInfo {
	private int numOfChildrens;
	private int currentPage;
	private int startRow;
	private int endRow;
	private int pageCount;
	private int startPage;
	private int endPage;
	private String bottomPartOfHtml;
	
	//자녀안전귀가
	private List<ChildrenBean> Childrens;
	private List<memberBean> Members;
	private String id;
	
	//쪽지
	private List<MessageBean> Messages;
	private String start;
	private String end;
	private String start_time;
	private String end_time;
	//카페
	private int numOfGroups;
	private List<CafeBoardBean> Groups;
	private int cafe_num;
	private int board_cate;
	
	//후기 게시판
	private List<CafeBoardBean> Reviews;
	
	
	
	
	
	public List<CafeBoardBean> getReviews() {
		return Reviews;
	}
	public void setReviews(List<CafeBoardBean> reviews) {
		Reviews = reviews;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNumOfChildrens() {
		return numOfChildrens;
	}
	public void setNumOfChildrens(int numOfChildrens) {
		this.numOfChildrens = numOfChildrens;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getBottomPartOfHtml() {
		return bottomPartOfHtml;
	}
	public void setBottomPartOfHtml(String bottomPartOfHtml) {
		this.bottomPartOfHtml = bottomPartOfHtml;
	}
	public List<ChildrenBean> getChildrens() {
		return Childrens;
	}
	public void setChildrens(List<ChildrenBean> childrens) {
		Childrens = childrens;
	}
	
	
	public List<memberBean> getMembers() {
		return Members;
	}
	public void setMembers(List<memberBean> members) {
		Members = members;
	}
	public List<MessageBean> getMessages() {
		return Messages;
	}
	public void setMessages(List<MessageBean> messages) {
		Messages = messages;
	}
	
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public int getNumOfGroups() {
		return numOfGroups;
	}
	public void setNumOfGroups(int numOfGroups) {
		this.numOfGroups = numOfGroups;
	}
	public List<CafeBoardBean> getGroups() {
		return Groups;
	}
	public void setGroups(List<CafeBoardBean> groups) {
		Groups = groups;
	}
	public int getCafe_num() {
		return cafe_num;
	}
	public void setCafe_num(int cafe_num) {
		this.cafe_num = cafe_num;
	}
	public int getBoard_cate() {
		return board_cate;
	}
	public void setBoard_cate(int board_cate) {
		this.board_cate = board_cate;
	}
	
	
	
	
	
	
	
	
	

}
