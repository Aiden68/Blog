package com.andone.blog.service;

import java.util.List;

import com.andone.blog.entity.Catagory;

public interface CatagoryService {

	void addCat(Catagory catagory);
	
	List<Catagory> findAllCat();
	
	Catagory findCatById(String id);
	
	void deleteCatById(String id);
	
	void updateCat(Catagory catagory);
}
