package com.auction.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.auction.domain.Category;

@Repository

public interface CategoryRepository extends CrudRepository<Category, Long>{

	
//	@Query("select c from Category c where c.categoryId=: categoryId ")
//	public Category findCategoryByID(@Param("categoryId") long categoryId);
	
	
	
}
