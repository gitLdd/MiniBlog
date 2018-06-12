package cn.code4j.MiniBlog.commons.vo;

import java.util.ArrayList;
import java.util.List;

// limit startIndex, pageSize
// Page类为VO对象 即Value Object对象，
// 用于完成java类与jsp页面的数据传递
public class Page<T> {
	private int pageno;				// 当前页的页码
	private int pageStartIndex;		// 当前页的起始索引
	private int pageSize;			// 页面大小
	private int totalRows;			// 总记录数
	private int totalPages;			// 总页码
	private List<T> datas;	// 当前页所包含的具体数据
	
	public Page(){
		// 默认
		this.pageno = 1;
		this.pageSize = 3;
		this.datas = new ArrayList<T>();
	}

	public Page(int pageno, int pageSize) {
		this();
		if(pageno <= 0){
			pageno = 1;
		}
		if(pageSize <=0){
			pageSize = 3;
		}
		this.pageno = pageno;
		this.pageSize = pageSize;
	}

	public int getPageno() {
		return pageno;
	}

	public void setPageno(int pageno) {
		this.pageno = pageno;
	}

	public int getPageStartIndex() {
		return (pageno -1) * pageSize;
	}

	public void setPageStartIndex(int pageStartIndex) {
		this.pageStartIndex = pageStartIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getTotalPages() {
		if(totalRows % pageSize == 0){
			totalPages = totalRows / pageSize;
		} else {
			totalPages = totalRows / pageSize + 1;
		}
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	@Override
	public String toString() {
		return "Page [pageno=" + pageno + ", pageStartIndex=" + pageStartIndex + ", pageSize=" + pageSize
				+ ", totalRows=" + totalRows + ", totalPages=" + totalPages + ", datas=" + datas + "]";
	}
	
}
