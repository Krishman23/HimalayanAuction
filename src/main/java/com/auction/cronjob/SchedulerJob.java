package com.auction.cronjob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.auction.service.BiddingService;

@Component("myBean")
public class SchedulerJob {
	@Autowired
	BiddingService biddingService;
	public void makebidActive() {
		biddingService.makeactive();
		System.out.println("I am called by make active");
	}
	public void makebidPassive() {
		biddingService.makepassive();
		System.out.println("I am called by Spring make passive");
	}
	
	public void announceWinner() {
		biddingService.announceWinner();
		System.out.println("I am called by Spring announce winner");
	}
}
