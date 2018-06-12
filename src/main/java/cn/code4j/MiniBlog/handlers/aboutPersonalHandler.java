package cn.code4j.MiniBlog.handlers;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.code4j.MiniBlog.commons.beans.ReleaseDateByMonth;
import cn.code4j.MiniBlog.commons.vo.Page;
import cn.code4j.MiniBlog.commons.vo.newestBlog;
import cn.code4j.MiniBlog.service.IaboutBlogService;

@Controller
@RequestMapping("/aboutPersonal")
public class aboutPersonalHandler {

	@Autowired
	private IaboutBlogService aboutBlogservice;
	public void setAboutBlogservice(IaboutBlogService aboutBlogservice) {
		this.aboutBlogservice = aboutBlogservice;
	}
	
	/*访问myBlog.jsp*/
	@RequestMapping("/requestMyBlog.do")
	public String reqMyBlog(@Param("uid") Integer uid, @Param("pageno") Integer pageno, HttpSession session) throws Exception {
		// 侧边栏显示信息
		// 1.根据月份汇总博文分布情况
		List<ReleaseDateByMonth> dateByMonth = aboutBlogservice.getdateByMonth(uid);
		session.setAttribute("dateByMonth", dateByMonth);
		// 2.获取标签
		// 2.1 获取Labels
		List<String> labels = aboutBlogservice.getLabelsByUid(uid);
		// 2.2 拼接成一个字符串
		String label = "";
		for (String a : labels) {
			label += a;
			label += " ";
		}
		// 2.3 根据空格分割字符串
		String[] Labels = label.split(" ");
		// 2.4 去重
		List<String> list = new LinkedList<String>();
		for (int i = 0; i < Labels.length; i++) {
			if (!list.contains(Labels[i])) {
				list.add(Labels[i]);
			}
		}
		session.setAttribute("tags", list);

		// 主要显示信息
		// 根据uid查询该用户所有博客
		Page<newestBlog> uidsBlogs = aboutBlogservice.getBloggersBlogs(uid, pageno);

		// 将数据存放至域对象中
		session.setAttribute("page", uidsBlogs);
		
		return "redirect:/jsp/myBlog.jsp";
	}
	
	/* 删除博客 */
	@RequestMapping("/deleteBlog.do")
	public void deleteBlog(@RequestBody String tid, HttpServletResponse response) throws IOException{
		System.err.println(tid);
		// 博客tid处理
		String Tid = tid.replace("tid=", "");
		Integer tId = Integer.parseInt(Tid);
		
		// 执行删除操作
		int result = aboutBlogservice.deleteBlogByTid(tId);
		
		if(result == 1){
			response.getWriter().print("true");
		} else {
			response.getWriter().print("false");
		}
		
	}
	
	
	

}
