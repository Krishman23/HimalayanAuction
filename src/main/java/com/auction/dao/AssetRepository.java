package com.auction.dao;


import java.util.List;

import org.hibernate.type.TrueFalseType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.auction.domain.Asset;
import com.auction.domain.Category;
import com.auction.domain.User;
@Repository
public interface AssetRepository extends JpaRepository<Asset, Long> {
	public List<Asset> findAssetsByUser(User user);
	public List<Asset> findAssetsByCategory( Category category);
	
	//@Query(value = "select e from Asset e where e.User.id= ?1")
	//public List<Asset> findAssetsByUserId(Long userId);
	/*@Query(value = "select e from Asset e where e.User.id= ?1")
	public List<Asset> findAssetsByUserId(Long userId);
	 @Query(value = "select e from Asset e where e.Category.id= ?1")
	public List<Asset> findAssetsByCategoryId(Long categoryId);*/
	@Query(value = ("SELECT * FROM `Asset` WHERE  name LIKE CONCAT('%',:keyword,'%')"),nativeQuery=true)	
	public List<Asset> searchAssets(@Param("keyword") String keyword);
}
