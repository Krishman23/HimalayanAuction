package com.auction.dao;

import java.util.List;

public interface GenericDao<T> {
	
	void save(T t);
	
	void delete(long id);
	
	T findOne(long id);
	
	List<T> findAll();
	
	public List<T> findAll(String s,Object  hint );
	
}
