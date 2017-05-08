package com.auction.service;

import java.util.List;

import com.auction.dao.GenericDao;
import com.auction.domain.Admin;
import com.auction.domain.AdminCredential;

public interface AdminService{

	
	public List<Admin> findAll(); 
	public Admin findOne(Long id);
	public void delete(long id);
	public AdminCredential getAdminByUsername(String username);
	public void saveAdmin(Admin admin);
	public Long AdminValidation(AdminCredential adminCredential);
	
	

}
