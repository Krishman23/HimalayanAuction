package com.auction.service;

import java.util.List;

import com.auction.domain.Bidding;

public interface BiddingService {	
	Bidding savebidding(Bidding bidding);
	Bidding getBidding(Long assetId);
	void makeactive();
	void makepassive();
	void announceWinner();
	public Bidding getMaxBidding(long assetId);	
	public List<Bidding> getMaxBiddings();
	public List<Bidding> getUserBidAsset(Long userId,Long assetId);
	public List<Bidding> getMyBiding(Long userId);
}
