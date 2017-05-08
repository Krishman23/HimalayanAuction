package com.auction.apiController;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.auction.domain.Asset;
import com.auction.service.AssetService;

@RestController
public class JSONDataController {
	@Autowired
	AssetService assetService;
	@RequestMapping(value="/getAuctionItem",method=RequestMethod.GET)
	public List<Asset> getAllCurrentAuction(){
		List<Asset> auctionList = new ArrayList<>();
		auctionList=assetService.getAllAssets();
//		if(auctionList.isEmpty()){
//			
//		}
		return auctionList;
	}

}
