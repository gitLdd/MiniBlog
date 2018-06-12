package cn.code4j.MiniBlog.handlers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.code4j.MiniBlog.commons.beans.Blog;
import cn.code4j.MiniBlog.commons.beans.UserCustom;
import cn.code4j.MiniBlog.commons.vo.newestBlog;
import cn.code4j.MiniBlog.service.IreqIndexService;

@Controller
public class reqIndexHandler {
	private static final String TIME = "EEE MMM dd HH:mm:ss zzz yyyy";
	
	@Autowired
	private IreqIndexService service;
	
	public void setService(IreqIndexService service) {
		this.service = service;
	}
	
	@RequestMapping("/reqIndex.do")
	public String requestIndexHandler(HttpServletRequest req,HttpServletResponse res) throws Exception{
		//需要三项数据,获取后放到request域对象中
		//1.最新博文NewestBlog(Blog类型)
		List<Blog> NewestBlogs = service.getNewestBlog(10);
		//newestBlog日期类型为String
		List<newestBlog> newestBlogs = new ArrayList<newestBlog>();
		
		//2.热门博文HotBlog(Blog类型)
		List<Blog> HotBlogs = service.getHotBlog();
		
		//3.热门博主HotBloger(User类型)
		List<UserCustom> HotBlogers = service.getHotBloger();
		
		/*转换日期格式*/
		for(Blog blog:NewestBlogs){
			//美国时间类型Date转String
			String date = blog.getReleasedate().toString();
			SimpleDateFormat sdf = new SimpleDateFormat(TIME, Locale.US);
			Date d = sdf.parse(date);
			String formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
			newestBlog e = new newestBlog();
			e.setTid(blog.getTid());
			e.setUid(blog.getUid());
			e.setTitle(blog.getTitle());
			e.setReleasedate(formatDate);
			e.setZannum(blog.getZannum());
			e.setTalknum(blog.getTalknum());
			e.setLabel(blog.getLabel());
			e.setText(blog.getText());
			newestBlogs.add(e);
		}

		//将数据存放至会话域中
		req.getSession().setAttribute("NewestBlogs", newestBlogs);
		req.getSession().setAttribute("HotBlogs", HotBlogs);
		req.getSession().setAttribute("HotBlogers", HotBlogers);
		req.setAttribute("Flag", "true");
		
		System.err.println("请求数据......");
		
		/*return "redirect:/jsp/index.jsp";*/
		/*使用请求转发，使得requestScope中存在Flag 免得进入死循环*/
		return "/jsp/index.jsp";
		
	}
}
