package com.auction.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.auction.domain.AdminCredential;

@Repository
public interface AdminCredentialRepository extends CrudRepository<AdminCredential , Long>{

	@Query("select a from ADMIN_CREDENTIALS a where a.username=:username")
	AdminCredential getAdminByUsername(@Param("username") String username);
}
