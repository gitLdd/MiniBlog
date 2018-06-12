package cn.code4j.MiniBlog.handlers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.commons.utils.MD5Util;
import cn.code4j.MiniBlog.service.ImodifyPersonMassageService;

@Controller
@RequestMapping("/mdfPersonMsg")
public class modifyPersonMsgHandler {

	@Autowired
	ImodifyPersonMassageService service;

	public void setService(ImodifyPersonMassageService service) {
		this.service = service;
	}

	/* 修改昵称 */
	@RequestMapping("/mdfNick.do")
	public void modifyPersonNick(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		/* 获取uid */
		String Uid = request.getParameter("uid");
		int uid = Integer.parseInt(Uid);
		/* 获取昵称 */
		String Nick = request.getParameter("nick");

		int result = service.updateNickByUid(uid, Nick);

		if (result == 1) {
			/* 更新session中用户的昵称 */
			User user = (User) session.getAttribute("user");
			user.setNick(Nick);
			session.setAttribute("user", user);
			response.getWriter().print("true");
		} else {
			response.getWriter().print("false");
		}

	}

	/* 修改性别 */
	@RequestMapping("/mdfSex.do")
	public void modifyPersonSex(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		/* 获取uid */
		String Uid = request.getParameter("uid");
		int uid = Integer.parseInt(Uid);
		/* 获取性别 */
		String Sex = request.getParameter("sex");

		int result = service.updateSexByUid(uid, Sex);

		if (result == 1) {
			/* 更新session中用户的性别 */
			User user = (User) session.getAttribute("user");
			user.setSex(Sex);
			session.setAttribute("user", user);
			response.getWriter().print("true");
		} else {
			response.getWriter().print("false");
		}

	}
	
	/*修改擅长*/
	@RequestMapping("/mdfShanChang.do")
	public void modifyPersonShanChang(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		/* 获取uid */
		String Uid = request.getParameter("uid");
		int uid = Integer.parseInt(Uid);
		/* 获取擅长 */
		String SC = request.getParameter("shanchang");

		int result = service.updateShanChangByUid(uid, SC);

		if (result == 1) {
			/* 更新session中用户的擅长 */
			User user = (User) session.getAttribute("user");
			user.setShanchang(SC);
			session.setAttribute("user", user);
			response.getWriter().print("true");
		} else {
			response.getWriter().print("false");
		}
	}

	/*修改个签*/
	@RequestMapping("/mdfGeQian.do")
	public void modifyPersonGeQian(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		/* 获取uid */
		String Uid = request.getParameter("uid");
		int uid = Integer.parseInt(Uid);
		/* 获取个签*/
		String GQ = request.getParameter("geqian");
		if(GQ.length() == 0){
			GQ = "这个人很神秘，没有添加个人描述";
		}
		int result = service.updateGeQianByUid(uid, GQ);
		
		if (result == 1) {
			/* 更新session中用户的个签 */
			User user = (User) session.getAttribute("user");
			user.setGeqian(GQ);
			session.setAttribute("user", user);
			response.getWriter().print("true");
		} else {
			response.getWriter().print("false");
		}
	}

	/*修改密码*/
	@RequestMapping("/mdfPassword.do")
	public String modifyPersonPWD(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		/* 获取uid */
		User user = (User)session.getAttribute("user");
		int uid = user.getUid();
		/* 获取密码*/
		String pwd = request.getParameter("pw1");
		/*加密*/
		pwd = MD5Util.md5Util(pwd);
		
		int result = service.updatePWDByUid(uid, pwd);
		System.err.println("进入处理器mdfPassword.do 更新结果为：" + result);
		
		if (result == 1) {
			session.removeAttribute("user");
		} else {
		}
		return "redirect:/jsp/index.jsp";
	}











}
