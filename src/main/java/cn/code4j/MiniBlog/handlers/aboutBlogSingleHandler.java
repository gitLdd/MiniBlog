package cn.code4j.MiniBlog.handlers;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.code4j.MiniBlog.commons.beans.Blog;
import cn.code4j.MiniBlog.commons.beans.Comment;
import cn.code4j.MiniBlog.commons.beans.ReleaseDateByMonth;
import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.commons.vo.Comment_StrTime;
import cn.code4j.MiniBlog.commons.vo.newestBlog;
import cn.code4j.MiniBlog.service.IaboutBlogService;
import cn.code4j.MiniBlog.service.IaboutBlogSingleService;

@Controller
@RequestMapping("/aboutBlogSingle")
public class aboutBlogSingleHandler {
	private static final String TIME = "EEE MMM dd HH:mm:ss zzz yyyy";
	
	@Autowired
	private IaboutBlogService aboutBlogservice;	//需要其中的方法获取侧边栏信息
	public void setService(IaboutBlogService aboutBlogservice) {
		this.aboutBlogservice = aboutBlogservice;
	}
	@Autowired
	private IaboutBlogSingleService blogSingleService;
	public void setBlogSingleService(IaboutBlogSingleService blogSingleService) {
		this.blogSingleService = blogSingleService;
	}

	/* 查询博客处理器 */
	@RequestMapping("/requestBlogSingle.do")
	public String requestBlogByTid(@Param("tid") Integer tid, @Param("bloggerId") Integer bloggerId, HttpSession session) throws Exception {
		// 头部显示博主信息
		// 根据uid查询该用户的信息
		User blogger = aboutBlogservice.getUserById(bloggerId);
		session.setAttribute("blogger", blogger);
		
		// 侧边栏显示信息
		// 1.根据月份汇总博文分布情况
		List<ReleaseDateByMonth> dateByMonth = aboutBlogservice.getdateByMonth(bloggerId);
		session.setAttribute("dateByMonth", dateByMonth);
		// 2.获取标签
		// 2.1 获取Labels
		List<String> labels = aboutBlogservice.getLabelsByUid(bloggerId);
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
		
		// 博文详情
		Blog Blog = blogSingleService.getBlogByTid(tid);
		newestBlog blog = new newestBlog();
		/* 转换日期格式 */
		// 美国时间类型Date转String
		String date = Blog.getReleasedate().toString();
		SimpleDateFormat sdf = new SimpleDateFormat(TIME, Locale.US);
		Date d = sdf.parse(date);
		String formatDate = new SimpleDateFormat("yyyy-MM-dd").format(d);
		blog.setTid(Blog.getTid());
		blog.setUid(Blog.getUid());
		blog.setTitle(Blog.getTitle());
		blog.setReleasedate(formatDate);
		blog.setZannum(Blog.getZannum());
		blog.setTalknum(Blog.getTalknum());
		blog.setLabel(Blog.getLabel());
		blog.setText(Blog.getText());
		blog.setUnick(Blog.getUnick());


		// 评论
		List<Comment> Comments = blogSingleService.getCommentsByTid(tid);
		List<Comment_StrTime> comments = new ArrayList<Comment_StrTime>();
		/* 转换日期格式 */
		for (Comment comment : Comments){
			// 美国时间类型Date转String
			date = comment.getTime().toString();
			d = sdf.parse(date);
			formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d);
			Comment_StrTime c = new Comment_StrTime();
			c.setTid(comment.getTid());
			c.setCid(comment.getCid());
			c.setTime(formatDate);
			c.setUnick(comment.getUnick());
			c.setUfilename(comment.getUfilename());
			c.setUid(comment.getUid());
			c.setText(comment.getText());
			comments.add(c);
		}
		
		//将数据放入session域中
		session.setAttribute("comments", comments);
		session.setAttribute("blog", blog);
		
		return "redirect:/jsp/blog_single.jsp";
		
	}
	
	/* 添加评论 */
	@RequestMapping("/addComment.do")
	public String addComment(String comment,HttpSession session){
		// 评论的人
		User user = (User) session.getAttribute("user");
		// 博文的博主
		User blogger = (User) session.getAttribute("blogger");
		// 评论的博文
		newestBlog blog = (newestBlog) session.getAttribute("blog");
		// 获取当前时间
		Date date = new Date();// 获得系统时间.
		String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		Timestamp nowtime = Timestamp.valueOf(nowTime);// 转为数据库类型
		
		Comment com = new Comment();
		com.setText(comment);
		com.setTid(blog.getTid());
		com.setTime(nowtime);
		com.setUfilename(user.getFileName());
		com.setUid(user.getUid());
		com.setUnick(user.getNick());
		
		// 添加评论
		blogSingleService.addComment(com);
		// 评论数加1
		blogSingleService.talkNumj1(blog.getTid());
		
		
		return "redirect:/aboutBlogSingle/requestBlogSingle.do?tid="+blog.getTid()+"&bloggerId="+blogger.getUid();
	}
	
	
}
