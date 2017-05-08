package com.auction.service;

import java.util.List;

import com.auction.domain.Category;


public interface CategoryService {

	public List<Category> findAll();
	public void save(Category category);
	public void delete(Category category);
	public void delete(long id);
	//public Category findCategoryById(long id);
	public Category findOne(long id);
	
}
