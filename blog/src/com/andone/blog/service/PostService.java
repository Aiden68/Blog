package com.andone.blog.service;

import java.util.List;

import com.andone.blog.entity.Post;
import com.andone.blog.util.Pager;

import sun.net.www.http.PosterOutputStream;

public interface PostService {

	void addPost(Post post);
	
	List<Post> findAllPost();
	
	void deletePostById(String id);
	
	void updatePost(Post post);
	
	void updatePostVisitors(String id, int visitors);
	
	void updatePostComSize(String id, int comSize);
	
	Post postFindById(String id);
	
	Pager<Post> pageFind(Post post,int currenNum, int pageSize, String search, String catName);
}
