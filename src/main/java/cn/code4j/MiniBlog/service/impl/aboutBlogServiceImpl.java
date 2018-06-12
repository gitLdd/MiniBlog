package cn.code4j.MiniBlog.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import cn.code4j.MiniBlog.commons.beans.Blog;
import cn.code4j.MiniBlog.commons.beans.ReleaseDateByMonth;
import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.commons.beans.Tag_page;
import cn.code4j.MiniBlog.commons.beans.Tag_uid;
import cn.code4j.MiniBlog.commons.vo.Page;
import cn.code4j.MiniBlog.commons.vo.newestBlog;
import cn.code4j.MiniBlog.dao.IAboutBlogDao;
import cn.code4j.MiniBlog.service.IaboutBlogService;

public class aboutBlogServiceImpl implements IaboutBlogService {
	private static final String TIME = "EEE MMM dd HH:mm:ss zzz yyyy";
	
	private IAboutBlogDao dao;
	public void setDao(IAboutBlogDao dao) {
		this.dao = dao;
	}
	
	@Override
	public int releaseBlog(Blog releaseBlog) {
		int result = dao.insertBlog(releaseBlog);
		return result;
	}

	@Override
	public User getUserById(Integer uid) {
		return dao.getUserById(uid);
	}

	@Override
	public Page<newestBlog> getBloggersBlogs(Integer uid,Integer pageno) throws Exception {
		Page<newestBlog> page = new Page<>();
		page.setPageno(pageno);	// 初始化当前页码
		page.setPageSize(10);	// 初始化每页数据数
		
		// 初始化totalRows(总记录数)
		int totalRows = dao.selectBlogTotalByUid(uid);
		page.setTotalRows(totalRows);
		
		// 初始化当前页所包含的栏目具体详情datas
		Map<String, Integer> map = new HashMap<>();
		map.put("pageStartIndex", page.getPageStartIndex()); //页面数据起始索引
		map.put("pageSize", page.getPageSize());			 //页面大小
		map.put("uid", uid);								 
		List<Blog> datas = dao.getBlogsByUid(map);
		/*转换日期格式*/
		/*转换日期格式*/
		//newestBlog日期类型为String
		List<newestBlog> newestBlogs = new ArrayList<newestBlog>();
		for(Blog blog:datas){
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
		page.setDatas(newestBlogs);
		return page;
}

	//根据月份汇总博文分布情况
	@Override
	public List<ReleaseDateByMonth> getdateByMonth(Integer uid) {
		return dao.getdateByMonth(uid);
	}

	//根据uid获取标签
	@Override
	public List<String> getLabelsByUid(Integer uid) {
		return dao.getLabelsByUid(uid);
	}

	//根据月份和uid获取博文
	@Override
	public Page<newestBlog> getBlogsByMonthUid(Integer uid, Integer yearmonth, Integer pageno) throws Exception {
		Page<newestBlog> page = new Page<>();
		page.setPageno(pageno);	// 初始化当前页码
		page.setPageSize(10);	// 初始化每页数据数
		
		// 初始化totalRows(总记录数)
		Map<String, Integer> map0 = new HashMap<>();
		map0.put("uid", uid);
		map0.put("yearMonth", yearmonth);
		int totalRows = dao.selectBlogTotalByMonthUid(map0);
		page.setTotalRows(totalRows);
		
		// 初始化当前页所包含的栏目具体详情datas
		Map<String, Integer> map = new HashMap<>();
		map.put("pageStartIndex", page.getPageStartIndex()); //页面数据起始索引
		map.put("pageSize", page.getPageSize());			 //页面大小
		map.put("yearMonth", yearmonth);
		map.put("uid", uid);								 
		List<Blog> datas = dao.selsctBlogsByMonthUid(map);
		/*转换日期格式*/
		/*转换日期格式*/
		//newestBlog日期类型为String
		List<newestBlog> newestBlogs = new ArrayList<newestBlog>();
		for(Blog blog:datas){
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
			e.setUnick(blog.getUnick());
			
			newestBlogs.add(e);
			}
		page.setDatas(newestBlogs);
		return page;
	}

	// 根据tag和uid获取博客
	@Override
	public Page<newestBlog> getBlogsByTag(Integer uid, Integer pageno, String tag) throws Exception {
		Page<newestBlog> page = new Page<>();
		page.setPageno(pageno); // 初始化当前页码
		page.setPageSize(10); // 初始化每页数据数

		// 初始化totalRows(总记录数)
		Tag_uid xx = new Tag_uid();
		xx.setUid(uid);
		xx.setTag(tag);
		int totalRows = dao.selectBlogTotalByTagUid(xx);
		page.setTotalRows(totalRows);/*出错！！！！*/

		// 初始化当前页所包含的栏目具体详情datas
		Tag_page yy = new Tag_page();
		yy.setUid(uid);
		yy.setTag(tag);
		yy.setPageSize(page.getPageSize());// 页面大小
		yy.setPageStarIndex(page.getPageStartIndex());// 页面数据起始索引
		List<Blog> datas = dao.selsctBlogsByTagUid(yy);
		/* 转换日期格式 */
		/* 转换日期格式 */
		// newestBlog日期类型为String
		List<newestBlog> newestBlogs = new ArrayList<newestBlog>();
		for (Blog blog : datas) {
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
			e.setUnick(blog.getUnick());

			newestBlogs.add(e);
		}
		page.setDatas(newestBlogs);
		return page;
	}

	@Override
	public int deleteBlogByTid(Integer tId) {
		return dao.deleteBlogByTid(tId);
	}

}
