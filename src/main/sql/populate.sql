SET GLOBAL event_scheduler = ON;

CREATE EVENT `makeactive` ON SCHEDULE EVERY 1 MINUTE STARTS '2017-02-13 03:09:10.115158' ON  COMPLETION NOT PRESERVE ENABLE DO update  Bidding B  inner join Asset A on A.assetId = B.assetsId and A.bidStartDate <= CURDATE()  and A.bidEndDate > CURDATE() and B.activeflag = 0 set B.activeflag = 1

CREATE EVENT `makepassive` ON SCHEDULE EVERY 1 MINUTE STARTS '2017-02-13 03:09:10.115158' ON COMPLETION NOT PRESERVE ENABLE DO 	UPDATE Bidding B  inner join Asset A on A.assetId = B.assetsId and A.bidEndDate<CURDATE() and B.activeflag = 1 set B.activeflag = 0 

CREATE EVENT `announcewinner` ON SCHEDULE EVERY 1 MINUTE STARTS '2017-02-13 03:09:10.115158' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE  Bidding BB INNER JOIN ( SELECT * from Asset A INNER join (SELECT b.biddingId, b.assetsid,b.winner FROM Bidding b 	INNER JOIN 	(SELECT assetsid,MAX(bidPurposedAmount) AS maxx FROM Bidding GROUP BY assetsid) AS X ON b.bidPurposedAmount=X.maxx  AND b.assetsid=X.assetsid) AS BID ON A.assetId = BID.assetsid AND A.bidEndDate< CURDATE()) AS AA ON BB.biddingId = AA.biddingId set BB.winner = 1


INSERT INTO `USER_CREDENTIAL` (`id`, `password`, `role`, `userName`) VALUES(1, 'user', 'ROLE_USER', 'user');

INSERT INTO `USER` (`userId`, `city`, `country`, `email`, `fullName`, `password`, `phone`, `state`, `street`, `userName`, `zip`, `USERCREDIT_ID`) VALUES(1, 'fairfield', 'usa', 'user@user.com', 'user', NULL, '3456677', 'IA', '1000 n 4 th street', NULL, '52557', 1);

INSERT INTO `ADMIN_CREDENTIALS` (`id`, `password`, `username`) VALUES(1, 'admin', 'admin');

INSERT INTO `Admin` (`adminId`, `email`, `fullName`, `password`, `userName`, `adminCredential_id`) VALUES (NULL, 'admin@admin.com', 'admin user', 'admin', 'admin', '1');

INSERT INTO `Category` (`categoryId`, `description`, `name`) VALUES (1, 'laptop', 'laptop');

