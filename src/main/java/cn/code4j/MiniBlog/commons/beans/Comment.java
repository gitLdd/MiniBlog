package cn.code4j.MiniBlog.commons.beans;

import java.util.Date;

public class Comment {
    private Integer cid;

    private Integer tid;

    private Integer uid;

    private String text;

    private Date time;

    private String unick;

    private String ufilename;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
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
        this.text = text == null ? null : text.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getUnick() {
        return unick;
    }

    public void setUnick(String unick) {
        this.unick = unick == null ? null : unick.trim();
    }

    public String getUfilename() {
        return ufilename;
    }

    public void setUfilename(String ufilename) {
        this.ufilename = ufilename == null ? null : ufilename.trim();
    }

	@Override
	public String toString() {
		return "Comment [cid=" + cid + ", tid=" + tid + ", uid=" + uid + ", text=" + text + ", time=" + time
				+ ", unick=" + unick + ", ufilename=" + ufilename + "]";
	}
    
    
}