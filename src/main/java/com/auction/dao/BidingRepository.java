package com.auction.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.auction.dbpojo.UserAssetsBidding;
import com.auction.domain.Bidding;

public interface BidingRepository extends CrudRepository<Bidding, Long>{
	@Query(value = "update  Bidding B  inner join Asset A on A.assetId = B.assetsId and A.bidStartDate <= CURDATE() and A.bidEndDate > CURDATE() and B.activeflag = 0 set B.activeflag = 1", nativeQuery = true)
	public void makeActive();
	
	@Query(value="UPDATE Bidding B  inner join Asset A on A.assetId = B.assetsId and A.bidEndDate<CURDATE() and B.activeflag = 1 set B.activeflag = 0", nativeQuery = true)
	public void makePassive();

	@Query(value ="update Bidding AB inner join (SELECT * from Asset A INNER join  (SELECT *,MAX(b.bidPurposedAmount) FROM Bidding b  GROUP by b.assetsid)  tt on A.assetId = tt.assetsid and A.bidEndDate< CURDATE() AND tt.winner = 0) as rr on AB.biddingId = rr.biddingId set AB.winner = 1", nativeQuery = true)
	public void announceWinner();
	
	
	@Query(value = "SELECT * FROM Admin", nativeQuery = true)
	public void test();	
	//@Query(value = "select b from Bidding b")
	@Query(value = "SELECT * FROM Bidding b  where b.bidPurposedAmount in (select MAX(bb.bidPurposedAmount) from Bidding bb GROUP by bb.assetsid) AND b.assetsid=?1", nativeQuery = true)
	public Bidding getMaxBiddingVal(Long assetsid);
	
	//	@Query(value="SELECT U.fullName,U.country, max(B.bidPurposedAmount) as maxbid FROM Bidding B INNER JOIN `USER` U on B.userId = U.userId AND B.assetsid = 1 GROUP BY B.assetsid,B.userId",nativeQuery=true)
	//	public List<UserAssetsBidding> getAllBiddingBasedOnAsset(Long assetId);
	@Query(value="SELECT * from Bidding b where b.assetsid =:assetId AND b.userId =:userId",nativeQuery = true)
	public List<Bidding> getBiddingListByUserAndAssetsId(@Param("userId")Long userId,@Param("assetId")Long assetId);
	
	@Query(value="SELECT * from Bidding b where  b.userId =:userId",nativeQuery = true)
	public List<Bidding> getMyBiding(@Param("userId")Long userId);
	
	
}
