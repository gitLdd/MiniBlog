package cn.code4j.MiniBlog.commons.vo;


public class Comment_StrTime {
	private Integer cid;

    private Integer tid;

    private Integer uid;

    private String text;

    private String time;

    private String unick;

    private String ufilename;

    public Integer getCid() {
        return cid;
    }

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getUnick() {
		return unick;
	}

	public void setUnick(String unick) {
		this.unick = unick;
	}

	public String getUfilename() {
		return ufilename;
	}

	public void setUfilename(String ufilename) {
		this.ufilename = ufilename;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}
    
}
