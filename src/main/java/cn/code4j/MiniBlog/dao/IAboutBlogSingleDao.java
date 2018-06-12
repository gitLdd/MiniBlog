package cn.code4j.MiniBlog.dao;

import java.util.List;

import cn.code4j.MiniBlog.commons.beans.Blog;
import cn.code4j.MiniBlog.commons.beans.Comment;

public interface IAboutBlogSingleDao {

	Blog selectBlogByTid(Integer tid);

	List<Comment> selectCommentsByTid(Integer tid);

	void addComment(Comment com);

	void talkNumj1(Integer tid);

}
