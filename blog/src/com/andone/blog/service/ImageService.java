package com.andone.blog.service;

import java.io.InputStream;
import java.util.ArrayList;

import com.andone.blog.entity.Image;

public interface ImageService {

	ArrayList<Image> findAllImage();
	
	ArrayList<Image> getByUserId(int userId);
	
	void addImage(Image image, InputStream inputStream);
	
	void delByIdsAndUrls(String ids, String urls);
	
}
