package com.andone.blog.service;

import java.util.List;

import com.andone.blog.entity.Comment;
import com.andone.blog.util.Pager;

public interface CommentService {

	void addComment(Comment comment);
	
	List<Comment> findAllComment();
	
	List<Comment> findAllCommentByPid(String pid);
	
	void deleteCommentById(String id);
	
	void updateComment(Comment comment);
	
	Comment CommentFindById(String id);
	
	Pager<Comment> pageFind(Comment comment,int currenNum, int pageSize);
}
