package cn.code4j.MiniBlog.handlers;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LogoutHandler {
	
	@RequestMapping("/logout.do")
	public Void logOut(HttpSession session, HttpServletResponse res) throws Exception {
		session.removeAttribute("user");
		res.getWriter().print("true");
		return null;
	}
}










