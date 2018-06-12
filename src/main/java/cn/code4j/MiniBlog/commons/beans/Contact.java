package cn.code4j.MiniBlog.commons.beans;

public class Contact {
	private String name;
	private String youxiang;
	private String message;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getYouxiang() {
		return youxiang;
	}
	public void setYouxiang(String youxiang) {
		this.youxiang = youxiang;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	@Override
	public String toString() {
		return "Contact [name=" + name + ", youxiang=" + youxiang + ", message=" + message + "]";
	}
	public Contact(String name, String youxiang, String message) {
		super();
		this.name = name;
		this.youxiang = youxiang;
		this.message = message;
	}
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

	
}
