package com.auction.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.auction.domain.Admin;
import com.auction.domain.AdminCredential;

@Repository
public interface AdminRepository extends CrudRepository<Admin , Long>{

	//@Query("select a from ADMIN_CREDENTIALS a where a.username=:username")
	//@Query(value = "SELECT * FROM ADMIN_CREDENTIALS where ", nativeQuery = true)
	
	@Query(value=("select * FROM ADMIN_CREDENTIALS a where a.username=?1"),nativeQuery=true)
	AdminCredential getAdminByUsername(@Param("username") String username);
}
