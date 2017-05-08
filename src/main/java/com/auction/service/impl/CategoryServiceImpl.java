package com.auction.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.auction.dao.CategoryRepository;
import com.auction.domain.Category;
import com.auction.service.CategoryService;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryRepository categoryRepository;

	@Override
	public List<Category> findAll() {
		return (List<Category>) categoryRepository.findAll();
	}

	@Override
	public void save(Category category) {
		categoryRepository.save(category);
	}

	@Override
	public void delete(Category category) {
		categoryRepository.delete(category);
	}

	// @Override
	// public Category findCategoryById(long categoryId) {
	// return categoryRepository.findOne(categoryId);
	// }

	@Override
	public void delete(long id) {
		categoryRepository.delete(id);
	}

	@Override
	public Category findOne(long id) {
		return categoryRepository.findOne(id);
	}


	

}

// @Override
// public Category findCategoryById(long categoryId) {
// return categoryRepository.findCategoryByID(categoryId);
// }
