package cn.code4j.MiniBlog.service;

import java.util.List;

import cn.code4j.MiniBlog.commons.beans.Blog;
import cn.code4j.MiniBlog.commons.beans.Comment;

public interface IaboutBlogSingleService {

	Blog getBlogByTid(Integer tid);

	List<Comment> getCommentsByTid(Integer tid);

	void addComment(Comment com);

	void talkNumj1(Integer tid);

}
