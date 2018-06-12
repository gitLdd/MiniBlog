package cn.code4j.MiniBlog.service;

import java.util.List;

import cn.code4j.MiniBlog.commons.beans.Blog;
import cn.code4j.MiniBlog.commons.beans.UserCustom;

public interface IreqIndexService {

	List<Blog> getNewestBlog(int number);

	List<Blog> getHotBlog();

	List<UserCustom> getHotBloger();

}
