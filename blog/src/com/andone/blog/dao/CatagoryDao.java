package com.andone.blog.dao;

import java.util.List;

import com.andone.blog.entity.Catagory;

public interface CatagoryDao {

	void addCat(Catagory catagory);
	
	List<Catagory> findAllCat();
	
	Catagory findCatById(String id);
	
	void deleteCatById(String id);
	
	void updateCat(Catagory catagory);
}
