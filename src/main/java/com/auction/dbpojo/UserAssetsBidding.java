package com.auction.dbpojo;

public class UserAssetsBidding {
	
	private String fullname;
	private String country;
	private long maxbid;
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public long getMaxbid() {
		return maxbid;
	}
	public void setMaxbid(long maxbid) {
		this.maxbid = maxbid;
	}
	@Override
	public String toString() {
		return "UserAssetsBidding [fullname=" + fullname + ", country=" + country + ", maxbid=" + maxbid + "]";
	}
	

}
