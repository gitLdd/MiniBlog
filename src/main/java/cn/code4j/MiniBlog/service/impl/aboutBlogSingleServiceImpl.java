package cn.code4j.MiniBlog.service.impl;

import java.util.List;

import cn.code4j.MiniBlog.commons.beans.Blog;
import cn.code4j.MiniBlog.commons.beans.Comment;
import cn.code4j.MiniBlog.dao.IAboutBlogSingleDao;
import cn.code4j.MiniBlog.service.IaboutBlogSingleService;


public class aboutBlogSingleServiceImpl implements IaboutBlogSingleService {

	private IAboutBlogSingleDao dao;
	public void setDao(IAboutBlogSingleDao dao) {
		this.dao = dao;
	}
	
	@Override
	public Blog getBlogByTid(Integer tid) {
		return dao.selectBlogByTid(tid);
	}

	@Override
	public List<Comment> getCommentsByTid(Integer tid) {
		return dao.selectCommentsByTid(tid);
	}

	@Override
	public void addComment(Comment com) {
		dao.addComment(com);
	}

	@Override
	public void talkNumj1(Integer tid) {
		dao.talkNumj1(tid);
	}

}
