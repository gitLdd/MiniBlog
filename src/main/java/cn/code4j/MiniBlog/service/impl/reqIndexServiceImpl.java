package cn.code4j.MiniBlog.service.impl;

import java.util.List;

import cn.code4j.MiniBlog.commons.beans.Blog;
import cn.code4j.MiniBlog.commons.beans.UserCustom;
import cn.code4j.MiniBlog.dao.IReqIndexDao;
import cn.code4j.MiniBlog.service.IreqIndexService;

public class reqIndexServiceImpl implements IreqIndexService {

	private IReqIndexDao dao;
	public void setDao(IReqIndexDao dao) {
		this.dao = dao;
	}
	
	@Override
	public List<Blog> getNewestBlog(int number) {
		List<Blog> newestBlog = dao.getNewestBlog(number);
		return newestBlog;
	}

	@Override
	public List<Blog> getHotBlog() {
		List<Blog> hotBlog = dao.getHotBlog();
		return hotBlog;
	}

	@Override
	public List<UserCustom> getHotBloger() {
		List<UserCustom> hotUser = dao.getHotBloger();
		return hotUser;
	}

}
