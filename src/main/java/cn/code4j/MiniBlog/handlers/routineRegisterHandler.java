package cn.code4j.MiniBlog.handlers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.commons.utils.MD5Util;
import cn.code4j.MiniBlog.service.IroutineRegisterService;

@Controller
@RequestMapping("/routineRegister")
public class routineRegisterHandler {

	@Autowired
	private IroutineRegisterService service;
	public void setService(IroutineRegisterService service) {
		this.service = service;
	}
	
	
	//用户昵称重复性检验
	@RequestMapping("/nickCheck.do")
	public void nickCheck(HttpServletRequest req, HttpServletResponse res) throws Exception{
		/*
		 * @RequestBody String nick 接收参数会出现中文乱码
		 *
		 */
		String uNick = req.getParameter("nick");
		//用户昵称处理
		uNick = uNick.replace("nick=", "");
		uNick = uNick.replace("%40", "@");
		//昵称重复性检验
		boolean result = service.uNickCheck(uNick);
		//返回验证结果
		if(result){
			/*被占用*/
			res.getWriter().print("true");
		}else{
			res.getWriter().print("false");
		}
	}
	
	//常规用户注册
	@RequestMapping("/register.do")
	public String register(User user, HttpServletRequest req, HttpServletResponse res){
		/*
		 * uid=null, 
		 * account=asamunaicha@qq.com, 
		 * password=asm937044, 
		 * sex=nv, 
		 * nick=阿萨姆奶茶, 
		 * shanchang=null, 
		 * geqian=统一阿萨姆奶茶, 
		 * fileName=null]
		 * */
		/*用户密码MD5加密*/
		String oldPWD = user.getPassword();
		String newPWD = MD5Util.md5Util(oldPWD);
		user.setPassword(newPWD);
		
		if(user.getSex().equals("nan")){
			user.setSex("男");
			user.setFileName("default_male");
		}else{
			user.setSex("女");
			user.setFileName("default_female");
		}
		if(user.getNick() == null || user.getNick() == ""){
			/*昵称为空，生成唯一的默认昵称*/
			String uuid = java.util.UUID.randomUUID().toString();
			String uuid5 = uuid.substring(0,6); 
			user.setNick("用户"+uuid5);
		}
		if(user.getShanchang() == null || user.getShanchang() == ""){
			/*擅长为空*/
			user.setShanchang("未知");
		}
		if(user.getGeqian() == null || user.getGeqian() == ""){
			/*个签为空*/
			user.setGeqian("这个人很神秘，没有添加个人描述");
		}
		
		/*注册用户*/
		int result = service.insertUser(user);
		
		if(result == 1){
			req.getSession().setAttribute("user", user);
			return "redirect:/transferPage/transferPage.jsp";
		}else{
			return "";
		}
		
	}
	




}





















