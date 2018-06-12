package cn.code4j.MiniBlog.service;

import java.util.List;

import cn.code4j.MiniBlog.commons.beans.Blog;
import cn.code4j.MiniBlog.commons.beans.ReleaseDateByMonth;
import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.commons.vo.Page;
import cn.code4j.MiniBlog.commons.vo.newestBlog;

public interface IaboutBlogService {

	int releaseBlog(Blog releaseBlog);

	User getUserById(Integer uid);

	Page<newestBlog> getBloggersBlogs(Integer uid, Integer pageno) throws Exception;

	//根据月份汇总博文分布情况
	List<ReleaseDateByMonth> getdateByMonth(Integer uid);

	//获取标签
	List<String> getLabelsByUid(Integer uid);

	//根据月份和uid获取博客
	Page<newestBlog> getBlogsByMonthUid(Integer uid, Integer yearmonth, Integer pageno) throws Exception;

	//根据tag和uid获取博客
	Page<newestBlog> getBlogsByTag(Integer uid, Integer pageno, String tag) throws Exception;

	int deleteBlogByTid(Integer tId);

}
