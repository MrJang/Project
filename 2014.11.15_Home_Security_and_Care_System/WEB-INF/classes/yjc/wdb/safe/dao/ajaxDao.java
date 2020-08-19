package yjc.wdb.safe.dao;

public class ajaxDao {
	
	boolean duplicated;
	String availableId;
	
	public boolean isDuplicated(){
		return duplicated;
	}

	public String getAvailableId() {
		return availableId;
	}

	public void setAvailableId(String availableId) {
		this.availableId = availableId;
	}

	public void setDuplicated(boolean duplicated) {
		this.duplicated = duplicated;
	}

	
	
	
	

}
