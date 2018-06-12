package cn.code4j.MiniBlog.handlers;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.commons.utils.MD5Util;
import cn.code4j.MiniBlog.service.IfastRegisterService;

@Controller
@RequestMapping("/register")
public class fastRegisterHandler {
	
	@Autowired
	private IfastRegisterService service;
	
	public void setService(IfastRegisterService service) {
		this.service = service;
	}
	
	//用户邮箱重复性检验
	@RequestMapping("/fastRegister01.do")
	public void fastRegister01(@RequestBody String uEmail,HttpServletResponse response) throws Exception{
		//用户账号处理
		String account = uEmail.replace("account=", "");
		account = account.replace("%40", "@");
		System.err.println("验证账号是否存在： " + account);
		//账号重复性检验
		boolean result = service.repeatabilityTest(account);
		//返回验证结果
		if(result){
			response.getWriter().print("true");
		}else{
			response.getWriter().print("false");
		}
	}
	
	//用户注册(快速注册)
	@RequestMapping("/fastRegister02.do")
	public String register(String uEmail, HttpSession session){
		User user = new User(uEmail,uEmail);
		/*用户密码MD5加密*/
		String oldPWD = user.getPassword();
		String newPWD = MD5Util.md5Util(oldPWD);
		user.setPassword(newPWD);
		/*默认信息设置*/
		String uuid = java.util.UUID.randomUUID().toString();
		String uuid5 = uuid.substring(0,6); 
		user.setNick("用户"+uuid5);
		user.setSex("男");
		user.setFileName("default_male");
		
		int result = service.userRegister(user);

		user = service.findUserByEmail(uEmail);

		if(result == 1){
			session.setAttribute("user", user);
			return "redirect:/transferPage/transferPage.jsp";
		}else{
			return "";
		}
		
	}

}












