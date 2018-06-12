package cn.code4j.MiniBlog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.code4j.MiniBlog.commons.beans.Blog;
import cn.code4j.MiniBlog.commons.beans.ReleaseDateByMonth;
import cn.code4j.MiniBlog.commons.beans.User;
import cn.code4j.MiniBlog.commons.beans.Tag_page;
import cn.code4j.MiniBlog.commons.beans.Tag_uid;

public interface IAboutBlogDao {

	int insertBlog(Blog releaseBlog);

	User getUserById(Integer uid);

	int selectBlogTotalByUid(Integer uid);

	List<Blog> getBlogsByUid(Map<String, Integer> map);

	//根据月份汇总博文分布情况
	List<ReleaseDateByMonth> getdateByMonth(@Param("uid")Integer uid);

	//获取标签
	List<String> getLabelsByUid(@Param("uid")Integer uid);

	//根据month和uid获取blog总数
	int selectBlogTotalByMonthUid(Map<String, Integer> map);

	//根据month和uid获取blog信息
	List<Blog> selsctBlogsByMonthUid(Map<String, Integer> map);

	//根据tag和uid获取blog总数
	int selectBlogTotalByTagUid(Tag_uid xx);

	//根据tag和uid获取blog信息
	List<Blog> selsctBlogsByTagUid(Tag_page yy);

	int deleteBlogByTid(Integer tId);

}
