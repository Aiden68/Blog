package com.andone.blog.service.impl;

import java.io.InputStream;
import java.util.ArrayList;

import com.andone.blog.dao.ImageDao;
import com.andone.blog.dao.impl.ImageDaoImpl;
import com.andone.blog.entity.Image;
import com.andone.blog.service.ImageService;
import com.andone.blog.util.FileUtils;

public class ImageServiceImpl implements ImageService {

	private ImageDao imageDao = new ImageDaoImpl();
	@Override
	public ArrayList<Image> findAllImage() {
		return imageDao.findAllImage();
	}

	@Override
	public ArrayList<Image> getByUserId(int userId) {
		return null;
	}

	@Override
	public void addImage(Image image, InputStream inputStream) {
		imageDao.addImage(image, inputStream);
	}

	@Override
	public void delByIdsAndUrls(String ids, String urls) {
		imageDao.delByIdsAndUrls(ids, urls);
	}

}
