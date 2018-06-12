package cn.code4j.MiniBlog.commons.beans;

public class Tag_page {
	private String tag;
	private Integer uid;
	private Integer pageSize;
	private Integer pageStarIndex;
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPageStarIndex() {
		return pageStarIndex;
	}
	public void setPageStarIndex(Integer pageStarIndex) {
		this.pageStarIndex = pageStarIndex;
	}
	
}
