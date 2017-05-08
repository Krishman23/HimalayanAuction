package com.auction.helper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.auction.service.UserService;
@Component
public class UserHepler {
	@Autowired
	UserService userService;
	public  Long getLoggedInUserId(){
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal()!="anonymousUser"){
			String username = SecurityContextHolder.getContext().getAuthentication().getName();			
			return (Long)userService.getIdByUserName(username).getUserId();	
		}
		return 0l;
	}

}
