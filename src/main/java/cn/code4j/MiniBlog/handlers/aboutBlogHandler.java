package cn.code4j.MiniBlog.handlers;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.code4j.MiniBlog.commons.beans.Blog;
import cn.code4j.MiniBlog.commons.beans.ReleaseDateByMonth;
import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.commons.vo.Page;
import cn.code4j.MiniBlog.commons.vo.newestBlog;
import cn.code4j.MiniBlog.service.IaboutBlogService;
import cn.code4j.MiniBlog.service.IreqIndexService;

@Controller
@RequestMapping("/aboutBlog")
public class aboutBlogHandler {
	private static final String TIME = "EEE MMM dd HH:mm:ss zzz yyyy";
	
	@Autowired
	private IaboutBlogService service;
	@Autowired
	private IreqIndexService indexService;	//需要其中的getNewestBlog方法获取最新博文
	
	public void setService(IaboutBlogService service) {
		this.service = service;
	}
	public void setService(IreqIndexService indexService) {
		this.indexService = indexService;
	}
	
	/*发布博客处理器*/
	@RequestMapping("/releaseBlog.do")
	public String releaseBlog(String blog, String blogTitle, String labels, HttpServletRequest req){
		Blog releaseBlog = new Blog();
		User user = (User)req.getSession().getAttribute("user");
		//获取文章正文
		//width="100%"换成 white-space="nowrap" align="center"
		String text = blog.replace("width=\"100%\"", "white-space=\"nowrap\" align=\"center\"");
		//获取当前时间
		Date date = new Date();//获得系统时间.
		String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		Timestamp nowtime = Timestamp.valueOf(nowTime);//转为数据库类型
		if(labels != "" && labels != null){
			releaseBlog.setLabel(labels);
		}else{
			releaseBlog.setLabel("无");
		}
		
		//为博客属性赋值
		releaseBlog.setTitle(blogTitle);
		releaseBlog.setText(text);
		releaseBlog.setUid(user.getUid());
		releaseBlog.setReleasedate(nowtime);
		releaseBlog.setZannum(0);
		releaseBlog.setTalknum(0);
		
		//存入数据库
		service.releaseBlog(releaseBlog);
		
		//跳转至该用户的博客页面
		return "redirect:/aboutPersonal/requestMyBlog.do?uid="+user.getUid()+"&pageno=1";
	}
	
	/*查询博客处理器*/
	@RequestMapping(value="/requestBlog.do", produces=MediaType.TEXT_PLAIN_VALUE + ";charset=utf-8")
	public String requestBlog(@Param("uid") Integer uid,@Param("pageno")Integer pageno,@Param("yearMonth")String yearMonth, HttpSession session) throws Exception{
		System.out.println(yearMonth);
		
		//侧边栏显示信息
		//1.根据月份汇总博文分布情况
		List<ReleaseDateByMonth> dateByMonth = service.getdateByMonth(uid);
		session.setAttribute("dateByMonth", dateByMonth);
		//2.获取标签
		//2.1 获取Labels
		List<String> labels = service.getLabelsByUid(uid);
		//2.2 拼接成一个字符串
		String label = "";
		for(String a:labels){
			label += a;
			label += " ";
		}
		//2.3 根据空格分割字符串
		String[] Labels = label.split(" ");
		//2.4 去重
		List<String> list = new LinkedList<String>();  
        for(int i = 0; i < Labels.length; i++) {  
            if(!list.contains(Labels[i])) {
                list.add(Labels[i]);  
            }  
        }  
        session.setAttribute("tags", list);
		
        // 主要显示信息
        if (yearMonth != null) {
        	session.setAttribute("type", 1 );
        	/*将用户选择的月份放入session域，供换页链接用*/
        	session.setAttribute("selectMonth", yearMonth);
        	
			/* 根据月份和uid查询博文 */
        	if(uid!=0){
        		// 根据uid查询该用户的信息
        		User blogger = service.getUserById(uid);
        		session.setAttribute("blogger", blogger);
        	}else{
        		session.setAttribute("blogger", null );
        	}
			// 根据月份和uid查询该用户所有博客
        	// 将xxxx年yy月转换为xxxxyy
        	String regex = "[\u4e00-\u9fa5]";
        	String yearmonth = yearMonth.replaceAll(regex, "");
        	Integer Ym = Integer.parseInt(yearmonth);
			Page<newestBlog> monthUidBlogs = service.getBlogsByMonthUid(uid, Ym, pageno);

			// 将数据存放至域对象中
			session.setAttribute("page", monthUidBlogs);
        	
		} else {
			session.setAttribute("type", 0 );
			/*根据uid是否等于0 查询全站最新20篇博客或uid的所有博客*/
			if (uid == 0) {
				// 查询最新的20篇博客
				session.removeAttribute("blogger");
				// 1.最新博文NewestBlog(Blog类型)
				List<Blog> NewestBlogs = indexService.getNewestBlog(20);
				// newestBlog日期类型为String
				List<newestBlog> newestBlogs = new ArrayList<newestBlog>();
				/* 转换日期格式 */
				for (Blog blog : NewestBlogs) {
					// 美国时间类型Date转String
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
					/*-----------2017-12-28 8:51:37-----------*/
					e.setUnick(blog.getUnick());
					/*-----------2017-12-28 8:51:37-----------*/
					newestBlogs.add(e);
				}
				// 将数据存放至域对象中
				session.setAttribute("newestBlogs", newestBlogs);
			} else {
				// 根据uid查询该用户的信息
				User blogger = service.getUserById(uid);
				// 根据uid查询该用户所有博客
				Page<newestBlog> uidsBlogs = service.getBloggersBlogs(uid, pageno);

				// 将数据存放至域对象中
				session.setAttribute("blogger", blogger);
				session.setAttribute("page", uidsBlogs);
			}
		}
		return "redirect:/jsp/blog.jsp";
	}
	
	/* 根据标签查询博文 */
	@RequestMapping("/requestBlogByTag.do")
	public String requestBlogByTag(@Param("uid") Integer uid, @Param("pageno") Integer pageno, @Param("tag") String tag, HttpSession session) throws Exception{
		// 侧边栏显示信息
		// 1.根据月份汇总博文分布情况
		List<ReleaseDateByMonth> dateByMonth = service.getdateByMonth(uid);
		session.setAttribute("dateByMonth", dateByMonth);
		// 2.获取标签
		// 2.1 获取Labels
		List<String> labels = service.getLabelsByUid(uid);
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
		if(uid == 0){
			session.setAttribute("blogger", null);
			session.setAttribute("topTitle", "全站_标签包含‘"+tag+"’的博文");
		} else {
			// 根据uid查询该用户的信息
			User blogger = service.getUserById(uid);
			session.setAttribute("blogger", blogger);
			session.setAttribute("topTitle", blogger.getNick()+"_标签包含‘"+tag+"’的博文");
		}	
		// 根据tag和uid查询该用户所有博客
		Page<newestBlog> tagsBlogs = service.getBlogsByTag(uid, pageno, tag);/*此处出错！！！！！！！！！*/
		// 将数据存放至域对象中
		session.setAttribute("page", tagsBlogs);
		session.setAttribute("selectTag", tag);
		
		return "redirect:/jsp/blog_Tag.jsp";
	}

}
