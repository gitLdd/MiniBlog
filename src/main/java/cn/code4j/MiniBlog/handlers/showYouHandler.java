package cn.code4j.MiniBlog.handlers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/showYou")
public class showYouHandler {

	@RequestMapping("/blogShow.do")
	public String blogShow(String blog, String blogTitle, HttpServletRequest req){
		String theTitle = blogTitle;
		//width="100%"换成 white-space="nowrap" align="center"
		String theBlog = blog.replace("width=\"100%\"", "white-space=\"nowrap\" align=\"center\"");
		//<tr>换成<tr style="text-align:center">
		//theBlog = theBlog.replace("<tr>", "<tr style=\"text-align:center\">");
		req.setAttribute("title", theTitle);
		req.setAttribute("html", theBlog);
		return "/jsp/blog_single.jsp";
		
	}
}
