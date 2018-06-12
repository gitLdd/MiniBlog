package cn.code4j.MiniBlog.handlers;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.commons.utils.MD5Util;
import cn.code4j.MiniBlog.service.ILoginService;


@Controller
@RequestMapping("/Verification")
public class LoginHandler {

	@Autowired
	private ILoginService service;

	public void setService(ILoginService service) {
		this.service = service;
	}

	@RequestMapping("/login.do")
	public String login(@RequestParam Map<String, Object> map, HttpServletRequest request, HttpServletResponse response ) {
		/*--------------------------------------------------------------------------------------*/
		/*获取用户跳转到登录页面之前的页面URL 三种情况
		 * 1.正常 例如 http://localhost:8888/MiniBlog/jsp/blog_single.jsp
		 * 2.用户账号或者密码错误 http://localhost:8888/MiniBlog/errorPage/loginError.jsp
		 * 3.用户直接访问的登陆页面 requestUrl=""
		 * */
		String requestUrl = (String) map.get("sourceURL");
		String jumpUrl = "redirect:/jsp/index.jsp";
		if(!requestUrl.equals("xx")){
			/*用户登录2次以及以上，防止跳转url变成loginError.jsp，所以先存起来*/
			request.getSession().setAttribute("realURL", requestUrl);
			/*处理一下*/
			jumpUrl = requestUrl.replace("http://localhost:8888/MiniBlog/", "redirect:/");
		}else{
			String xxx = (String)request.getSession().getAttribute("realURL");
			if(xxx != null){
				jumpUrl = xxx.replace("http://localhost:8888/MiniBlog/", "redirect:/");
			}
		}
		/*--------------------------------------------------------------------------------------*/
		
		// 获取用户输入的账号密码
		String account = (String) map.get("userAccount");
		String password = (String) map.get("userPassword");
		// 实例化User对象
		User user = new User();
		/*用户密码MD5加密*/
		String newPWD = MD5Util.md5Util(password);
		
		user.setAccount(account);
		user.setPassword(newPWD);
		
		User getUser = service.findUserByMsg(user);
		
		if (getUser != null) {
			// 将登陆用户放入session域中
			request.getSession().setAttribute("user", getUser);
			// 发送自动登录的coocik by 卢欣达
			String autoLoginTime = (String) map.get("cbox");
			if(autoLoginTime != null){
				Cookie ck = new Cookie("autologin", account+"-"+password);
				ck.setMaxAge(Integer.parseInt(autoLoginTime));
				ck.setPath(request.getContextPath());
				response.addCookie(ck);
			}
			System.out.println(jumpUrl);
			return jumpUrl;
		}else{
			return "redirect:/errorPage/loginError.jsp";
		}

	}
}










