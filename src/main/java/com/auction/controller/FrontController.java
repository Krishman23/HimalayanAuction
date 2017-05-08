package com.auction.controller;

import java.security.Principal;
import java.util.Enumeration;
import java.util.Optional;

import javax.print.attribute.standard.DateTimeAtCompleted;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.auction.domain.Asset;
import com.auction.domain.Bidding;
import com.auction.domain.User;
import com.auction.helper.UserHepler;
import com.auction.service.AssetService;
import com.auction.service.BiddingService;
import com.auction.service.UserService;

@Controller
@SessionAttributes({"bid"})
public class FrontController {

	@Autowired
	AssetService assetService;
	@Autowired
	BiddingService biddingService;
	@Autowired
	UserService userService;
	
	@Autowired 
	UserHepler userhelper;
	
	@RequestMapping(value = { "/", "/home" })
	public String HomePage(Model model) {			
		model.addAttribute("assets", assetService.getAllAssets());
		return "home";
	}

	@RequestMapping(value = { "/productDetail" })
	public String productDetail(@RequestParam("productid") Long assetsid, Model model) {
		Bidding bidding = new Bidding();
		bidding.setAssetId(assetService.getAsset(assetsid));	
		model.addAttribute("max",biddingService.getBidding(assetsid));
		model.addAttribute("bid",bidding);
		return "productdetail";
	}

	@RequestMapping(value = { "/productbid" }, method = RequestMethod.POST)
	public String makeBid(@ModelAttribute("bid") Bidding bidding, Model model) {
		System.out.println(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		User user = new User();			
		user.setUserId(userhelper.getLoggedInUserId());
		bidding.setUserId(user);
		//System.out.println("posted value " + bidding);
		// bidding.setAssetId(assetId);
		biddingService.savebidding(bidding);		
		return "redirect:/home";
	}
	
	@RequestMapping(value = "/searchItem", method = RequestMethod.POST)
	public String searchItem(@RequestParam("search") String keyword,Model model) {
		model.addAttribute("assets", assetService.searchAssets(keyword));
		//System.out.println(assetService.searchAssets("kk"));
		return "home";
	}
	
	@RequestMapping(value = "/myproduct", method = RequestMethod.GET)
	public String myproduct(Model model) {
		User user = new User();
		user.setUserId(userhelper.getLoggedInUserId());		;
		model.addAttribute("assets", assetService.getAssetsByUser(user));
		return "myproduct";
	}
	
	@RequestMapping(value = {"/pages/{pageNumber}","/pages"}, method = RequestMethod.GET)
	public String getProducts(@PathVariable Optional<Integer>  pageNumber, Model model){
		Integer currentpage=0;
		if (pageNumber.isPresent()) {
			currentpage = pageNumber.get()==0?1:pageNumber.get();	        
	    } else {
	    	currentpage = 1;
	    } 
		Page<Asset> page = assetService.getAllAssetsPage(currentpage);
	    int current = page.getNumber() + 1;
	    int begin = current*page.getNumberOfElements();
	    int end = begin+page.getNumberOfElements();
	    int total = page.getTotalPages()*page.getNumberOfElements();
	    
	    model.addAttribute("deploymentLog", page);
	    model.addAttribute("beginIndex", begin);
	    model.addAttribute("endIndex", end);
	    model.addAttribute("currentIndex", current);
	    model.addAttribute("total", total);
	    return "homePagination";
	}


}
