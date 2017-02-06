package com.andone.blog.dao;

import java.util.List;

import com.andone.blog.entity.Post;
import com.andone.blog.util.Pager;

public interface PostDao {
	void addPost(Post post);
	
	List<Post> findAllPost();
	
	void deletePostById(String id);
	
	void updatePost(Post post);
	
	Post postFindById(String id);
	
	Pager<Post> pageFind(Post post,int currenNum, int pageSize);
}
