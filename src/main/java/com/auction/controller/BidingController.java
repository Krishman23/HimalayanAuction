package com.auction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.auction.domain.Bidding;
import com.auction.helper.UserHepler;
import com.auction.service.BiddingService;

@Controller
public class BidingController {

	@Autowired
	BiddingService biddingService;
	
	@Autowired 
	UserHepler helper;
	
	@RequestMapping(value = "/getHighestBid")
	public @ResponseBody Bidding getBidingValue(@RequestParam("assetsId") Long assetid) {
		System.out.println(biddingService.getBidding(assetid));
		return biddingService.getBidding(assetid);
	}
	
	@RequestMapping(value = "/getmybid")
	public String  getMyBidding(Model model) {		
		//System.out.println(biddingService.getBidding(assetid));
		model.addAttribute("mybidding",biddingService.getBidding(helper.getLoggedInUserId()));
		return "mybiding";
	}
}