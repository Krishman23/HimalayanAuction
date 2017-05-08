package com.auction.service;

import java.util.List;

import com.auction.domain.User;
import com.auction.domain.UserCredential;

public interface UserService {

	// access database (get or set)

	User getUserByUserId(Long id);

	UserCredential getUserByUserName(String userName);

	User addUser(User newUser);

	// Login User validation
	public Long loginValidation(UserCredential userCredit);

	User getUserByUserCredentialId(long id);

	User getUserByUserCredentialUserName(String name);
	// biijay

	List<User> findAll();

	public void delete(long id);

	public User getIdByUserName(String username);


}
