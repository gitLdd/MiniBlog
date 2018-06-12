package cn.code4j.MiniBlog.dao;

import java.util.List;

import cn.code4j.MiniBlog.commons.beans.Blog;
import cn.code4j.MiniBlog.commons.beans.UserCustom;

public interface IReqIndexDao {

	List<Blog> getNewestBlog(int number);

	List<Blog> getHotBlog();

	List<UserCustom> getHotBloger();

}
