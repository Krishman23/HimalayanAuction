package com.auction.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.BidingRepository;
import com.auction.domain.Bidding;
import com.auction.service.BiddingService;

@Service
public class BiddingServiceImpl implements BiddingService {
	@Autowired
	BidingRepository bidingRepository;

	@Override
	public Bidding savebidding(Bidding bidding) {
		System.out.println(bidding);
		return bidingRepository.save(bidding);
	}

	@Override
	public Bidding getBidding(Long assetId) {
		return bidingRepository.getMaxBiddingVal(assetId);
	}

	@Override
	public Bidding getMaxBidding(long assetId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Bidding> getMaxBiddings() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void makeactive() {
		bidingRepository.makeActive();
	}

	@Override
	public void makepassive() {
		bidingRepository.makePassive();

	}

	@Override
	public void announceWinner() {
		bidingRepository.announceWinner();

	}

	@Override
	public List<Bidding> getUserBidAsset(Long userId, Long assetId) {
		bidingRepository.getBiddingListByUserAndAssetsId(userId, assetId);
		return null;
	}

	@Override
	public List<Bidding> getMyBiding(Long userId) {
		return bidingRepository.getMyBiding(userId);
	}
	
	

}
