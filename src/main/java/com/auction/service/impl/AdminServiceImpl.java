package com.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.auction.dao.AdminCredentialRepository;
import com.auction.dao.AdminRepository;
import com.auction.domain.Admin;
import com.auction.domain.AdminCredential;
import com.auction.service.AdminService;

@Service

public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminRepository adminRepository;
	@Autowired
	AdminCredentialRepository adminCredentailRepository;

	public List<Admin> findAll() {
		return (List<Admin>) adminRepository.findAll();
	}

	public Admin findOne(Long id) {
		return adminRepository.findOne(id);

	}

	public void delete(long id) {
		adminRepository.delete(id);
	}

	@Override
	public AdminCredential getAdminByUsername(String username) {
		return adminCredentailRepository.getAdminByUsername(username);
	}

	@Override
	public void saveAdmin(Admin admin) {
		adminRepository.save(admin);

	}

	@Override
	public Long AdminValidation(AdminCredential adminCredential) {
		AdminCredential adminCredentail = getAdminByUsername(adminCredential.getUsername());
		
		try {
			if ((adminCredential.getUsername() != null) && (adminCredential.getUsername().equals(adminCredential.getUsername()))
					&& (adminCredentail.getPassword().equals(adminCredentail.getPassword()))) {
				System.out.println("Login Success");
				return adminCredentail.getId();
			}

		} catch (NullPointerException exp) {
			System.out.println(exp);
			System.out.println("Wrong Username and password . Try Again");
			return 0l;
		}
		return 0l;
	}

}
