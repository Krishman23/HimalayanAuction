package com.auction.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.auction.domain.UserCredential;

@Repository
public interface UserCredentialsRepository extends CrudRepository<UserCredential, Long>{
	
	@Query(value=("select * FROM USER_CREDENTIAL u where u.userName=?1"),nativeQuery=true)
	UserCredential getUserByUserName(String userName);
}
