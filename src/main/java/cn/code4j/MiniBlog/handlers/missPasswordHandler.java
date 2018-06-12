package cn.code4j.MiniBlog.handlers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.code4j.MiniBlog.commons.utils.Email;
import cn.code4j.MiniBlog.commons.utils.MD5Util;
import cn.code4j.MiniBlog.service.ImodifyPasswordService;

@Controller
@RequestMapping("/missPwd")
public class missPasswordHandler {
	
	@Autowired
	private ImodifyPasswordService service;
	public void setService(ImodifyPasswordService service) {
		this.service = service;
	}
	
	@RequestMapping("/sendCheckEmail.do")
	public void sendEmail(@RequestBody String uAc,HttpServletResponse res,HttpSession session) throws Exception{
		//用户账号处理
		uAc = uAc.replace("uAc=", "");
		uAc = uAc.replace("%40", "@");
		/*生成6位验证码*/
		int verificationCode = (int)((Math.random()*9+1)*100000);
		/*发送验证码*/
		Email.sendEmail(verificationCode, uAc);
		
		String yzm = Integer.toString(verificationCode);
		res.getWriter().print(yzm);
		
		System.err.println("发送给账号：" + uAc +" 验证码 " + verificationCode);
	}
	
	@RequestMapping("/jumpToSetPwd.do")
	public String jumpToSetPassword(HttpServletRequest request){
		String uEmail = request.getParameter("zhEmail");
		request.getSession().setAttribute("uEmail", uEmail);
		System.err.println("验证通过,账号为：" + uEmail);
		
		return "redirect:/jsp/setThePwd.jsp";
	}
	
	@RequestMapping("/setPwd.do")
	public String setPassword(HttpServletRequest request){
		String uEmail = (String) request.getSession().getAttribute("uEmail");
		String setPwd = request.getParameter("pwd1");
		String newPwd = MD5Util.md5Util(setPwd);
		
		System.err.println("setPwd.do->uEmail= " + uEmail);
		
		service.modifyPassword(uEmail,newPwd);
		
		return "redirect:/jsp/login.jsp";
	}
	
}
