package com.andone.blog.service.impl;

import java.util.List;

import com.andone.blog.dao.CommentDao;
import com.andone.blog.dao.impl.CommentDaoImpl;
import com.andone.blog.entity.Comment;
import com.andone.blog.service.CommentService;
import com.andone.blog.util.Pager;

public class CommentServiceImpl implements CommentService {

	CommentDao commentDao = new CommentDaoImpl();
	@Override
	public void addComment(Comment comment) {
		commentDao.addComment(comment);
	}

	@Override
	public List<Comment> findAllComment() {
		return commentDao.findAllComment();
	}

	@Override
	public List<Comment> findAllCommentByPid(String pid) {
		return commentDao.findAllCommentByPid(pid);
	}

	@Override
	public void deleteCommentById(String id) {
		commentDao.deleteCommentById(id);
	}

	@Override
	public void updateComment(Comment comment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Comment CommentFindById(String id) {
		return commentDao.CommentFindById(id);
	}

	@Override
	public Pager<Comment> pageFind(Comment comment, int currenNum, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

}
