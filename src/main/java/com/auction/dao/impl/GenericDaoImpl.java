package com.auction.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import com.auction.dao.GenericDao;

@Repository
public class GenericDaoImpl<T> implements GenericDao<T> {
	@PersistenceContext
	protected EntityManager entityManager;

	protected Class<T> daotype;

	public void setDaotype(Class<T> daotype) {
		this.daotype = daotype;
	}

	public void save(T entity) {
		entityManager.persist(entity);

	}

	public void delete(T entity) {
		entityManager.remove(entity);
	}

	public void delete(long id) {
		T entity = findOne( id );
        delete( entity );  
	}

	public T findOne(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<T> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<T> findAll(String s, Object hint) {
		// TODO Auto-generated method stub
		return null;
	}

}
