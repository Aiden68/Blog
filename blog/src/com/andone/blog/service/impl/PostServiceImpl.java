package com.andone.blog.service.impl;

import java.util.List;

import com.andone.blog.dao.PostDao;
import com.andone.blog.dao.impl.PostDaoImpl;
import com.andone.blog.entity.Post;
import com.andone.blog.service.PostService;
import com.andone.blog.util.Pager;

public class PostServiceImpl implements PostService {

	private PostDao postDao = new PostDaoImpl();
	@Override
	public void addPost(Post post) {
		postDao.addPost(post);
	}

	@Override
	public List<Post> findAllPost() {
		return postDao.findAllPost();
	}

	@Override
	public void deletePostById(String id) {
		postDao.deletePostById(id);
		
	}

	@Override
	public void updatePost(Post post) {
		postDao.updatePost(post);
	}

	@Override
	public Post postFindById(String id) {		
		return postDao.postFindById(id);
	}

	@Override
	public Pager<Post> pageFind(Post post, int currenNum, int pageSize) {
		return postDao.pageFind(post, currenNum, pageSize);
	}

}
