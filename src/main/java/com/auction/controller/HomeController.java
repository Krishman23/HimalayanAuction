package com.auction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.auction.domain.User;
import com.auction.service.AssetService;
import com.auction.service.UserService;

@Controller
@SessionAttributes("userlogin")
public class HomeController {
	@Autowired
	AssetService assetService;
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/admin")
	public String showHome(){
		return "logintheme";
	}
	@RequestMapping(value="/loginadmin",method=RequestMethod.POST)
	public String showDashboard(){
		return "dashboard";
	}
	
	public String productDetail(){
		return "productdetail";
	}
	
	@RequestMapping(value="/myProduct")
	public String myAssets(Model model){
		if(model.asMap().get("userlogin")!=null){
			Long userid = (Long) model.asMap().get("userlogin");
			//System.out.println(userid+"--------------->>>");
			User user =  userService.getUserByUserId(userid);
			model.addAttribute("assets",assetService.getAssetsByUser(user));
		}
		else
		{model.addAttribute("LoginError","Please Login");
			
		}
		return "myproduct";
	}

}
