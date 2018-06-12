package cn.code4j.MiniBlog.commons.beans;

public class User {
    private Integer uid;

    private String account;

    private String password;

    private String sex;

    private String nick;

    private String shanchang;

    private String geqian;
    
    private String fileName;

    public User() {}
    public User(String account, String password) {
		super();
		this.account = account;
		this.password = password;
	}
    
    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick == null ? null : nick.trim();
    }

    public String getShanchang() {
        return shanchang;
    }

    public void setShanchang(String chanchang) {
        this.shanchang = chanchang == null ? null : chanchang.trim();
    }

    public String getGeqian() {
        return geqian;
    }

    public void setGeqian(String geqian) {
        this.geqian = geqian == null ? null : geqian.trim();
    }
    
    public void setFileName(String fileName) {
		this.fileName = fileName;
	}
    
    public String getFileName() {
		return fileName;
	}
    
	@Override
	public String toString() {
		return "User [uid=" + uid + ", account=" + account + ", password=" + password + ", sex=" + sex + ", nick="
				+ nick + ", shanchang=" + shanchang + ", geqian=" + geqian + ", fileName=" + fileName + "]";
	}
    
}