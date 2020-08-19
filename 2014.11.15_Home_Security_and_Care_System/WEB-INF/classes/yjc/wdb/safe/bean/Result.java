package yjc.wdb.safe.bean;

public class Result {
	private boolean duplicated;
	private String recommendedName;
	
	public boolean isDuplicated() {
		return duplicated;
	}

	
	public void setDuplicated(boolean duplicated) {
		this.duplicated = duplicated;
	}


	public String getRecommendedName() {
		return recommendedName;
	}
	public void setRecommendedName(String recommendedName) {
		this.recommendedName = recommendedName;
	}
}
