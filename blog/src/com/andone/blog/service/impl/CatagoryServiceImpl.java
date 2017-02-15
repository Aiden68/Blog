package com.andone.blog.service.impl;

import java.util.List;

import com.andone.blog.dao.CatagoryDao;
import com.andone.blog.dao.impl.CatagoryDaoImpl;
import com.andone.blog.entity.Catagory;
import com.andone.blog.service.CatagoryService;

public class CatagoryServiceImpl implements CatagoryService{

	private CatagoryDao catagoryDao = new CatagoryDaoImpl(); 
	@Override
	public void addCat(Catagory catagory) {
		catagoryDao.addCat(catagory);
	}

	@Override
	public List<Catagory> findAllCat() {
		return catagoryDao.findAllCat();
	}

	@Override
	public Catagory findCatById(String id) {
		return catagoryDao.findCatById(id);
	}

	@Override
	public void deleteCatById(String id) {
		catagoryDao.deleteCatById(id);
	}

	@Override
	public void updateCat(Catagory catagory) {
		catagoryDao.updateCat(catagory);
	}

}
