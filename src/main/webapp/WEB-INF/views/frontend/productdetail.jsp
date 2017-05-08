<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript" src='<spring:url value="/resource/frontend/js/jquery.countdown.js"></spring:url>'></script>

<style>
.submit {
	background: url(../images/cart-icon.png) no-repeat 136px 13.5px #EF3326;
	border: 1px solid #B64E30;
	border-top: 2px solid #B64E30;
	color: #FFF;
	font-size: 1.2em;
	outline: none;
	padding: 0.42em 3em 0.5em 2em;
	border-radius: 0.3em;
	cursor: pointer;
	outline: none;
	transition: 0.5s all;
	-webkit-transition: 0.5s all;
}
#clock{
	
}
</style>
<div class="content">
	<div class="container">
		
	</div>
	<!---//speical-products---->
</div>
<div class="clearfix"></div>
<!-- //products ---->
<!----product-details--->
<div class="product-details">
	<div class="container">
	
		<div class="product-details-row1">
			<div class="product-details-row1-head">
				<h2>${bid.assetId.name}</h2>
				<p>${bid.assetId.brand}&nbsp;&nbsp;&nbsp;${bid.assetId.model}</p>
			</div>
			<div class="col-md-4 product-details-row1-col1">
				<!----details-product-slider--->
				<!-- Include the Etalage files -->
				<link
					href='<spring:url value="/resource/frontend/css/etalage.css"></spring:url>'
					rel='stylesheet' type='text/css' />
				<script type="text/javascript"
					src='<spring:url value="/resource/frontend/js/jquery.etalage.min.js"></spring:url>'></script>
				<!-- Include the Etalage files -->
				<script>
					jQuery(document)
							.ready(
									function($) {

										$('#etalage')
												.etalage(
														{
															thumb_image_width : 300,
															thumb_image_height : 400,
															source_image_width : 900,
															source_image_height : 1000,
															show_hint : true,
															click_callback : function(
																	image_anchor,
																	instance_id) {
																alert('Callback example:\nYou clicked on an image with the anchor: "'
																		+ image_anchor
																		+ '"\n(in Etalage instance: "'
																		+ instance_id
																		+ '")');
															}
														});
										// This is for the dropdown list example:
										$('.dropdownlist').change(
												function() {
													etalage_show($(this).find(
															'option:selected')
															.attr('class'));
												});

									});
				</script>
				<!----//details-product-slider--->
				<div class="details-left">
					<div class="details-left-slider">
						<ul id="etalage">
							<c:forEach var="images" items="${bid.assetId.getProductImage()}">
									<li>
										<a href="optionallink.html"> <!-- <img class="etalage_thumb_image" src="resource/frontend/images/product-slide/image1_thumb.jpg" /> -->
										<!-- <img class="etalage_source_image" src="images/product-slide/image1_large.jpg" /> -->
											<img class="etalage_thumb_image" src="	resource/img/assets/${images.getProductName()}" />
											<img class="etalage_source_image" src="resource/img/assets/${images.getProductName()}" />
										</a>
									</li>
							</c:forEach>							
							<!--<li><img class="etalage_thumb_image"
								src="	resource/img/assets/assets_1_0.jpg" />
								<img class="etalage_source_image"
								src="resource/img/assets/assets_1_0.jpg" />
							</li>
							<li><img class="etalage_thumb_image"
								src="	resource/img/assets/assets_1_0.jpg" />
								<img class="etalage_source_image"
								src="resource/img/assets/assets_1_0.jpg" />
							</li> -->

						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-8 product-details-row1-col2">
				<h2>Time Remaining : <span id = "clock"></span></h2>
				<!-- <div class="product-rating">				
					<div class="home-countdown-example" id="getting-started"></div>
				counter 
					
				</div> -->
				<div class="product-price">

					<div class="product-price-left text-right">
						<h2 class="text-right">${bid.assetId.minimumBidAmount} $</h2>
						<span>000.00</span>
						<h5 id="currentBid">
							<c:choose>
								<c:when test="${empty max.bidPurposedAmount}">
								${bid.assetId.minimumBidAmount}
    							</c:when>
								<c:otherwise>${max.bidPurposedAmount}</c:otherwise>
							</c:choose>$
						</h5>
						<!-- to-do minimum bid then bid amount -->
					</div>
					
					
					<p id="bidPriceErrors"></p>
					<div class="product-price-right">
						<a href="#"><span> </span></a> <label> save <b>40%</b></label>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="product-price-details">
					<p class="text-right">${bid.assetId.description}</p>
					<a class="shipping" href="#"><span> </span>Free shipping</a>
					<div class="clearfix"></div>
					<div class="product-size-qty">

						<form:form modelAttribute="bid" action="productbid" method="post">
							<div class="pro-size">
								<div id = "biddingArea" class="form-group">
  									<label class="control-label" path = "bidPurposedAmount">Your Bid Amount</label>
  									<form:input id="bidamount" class="form-control" type="text"
										path="bidPurposedAmount" />
  									<!-- <input type="text" class="form-control" id="inputError1"> -->
								</div>
								<%-- <span>Your Bid Amount</span>
								<p id="newBid">
									<form:input id="bidamount" class="form-control" type="text"
										path="bidPurposedAmount" />
								</p> --%>
							</div>
							<div class="clearfix"></div>
							<br>
							<div class="add-cart-btn">
								<input type="submit" class="summit-btn" value="Bid Now" />
							</div>
						</form:form>

					</div>
					<div class="clearfix"></div>
					<div class="product-cart-share">
						<ul class="product-share text-right">
							<h3>Share This:</h3>
							<ul>
								<li><a class="share-face" href="#"><span> </span> </a></li>
								<li><a class="share-twitter" href="#"><span> </span> </a></li>
								<li><a class="share-google" href="#"><span> </span> </a></li>
								<li><a class="share-rss" href="#"><span> </span> </a></li>
								<div class="clear"></div>
							</ul>
						</ul>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<!--//product-details--->
		</div>
		<!---- product-details ---->		
		
		</div>
		<!-- //product-details ---->


	</div>
</div>

<!----content---->

<script type="text/javascript">
	$("#bidamount").focusout(
			function(){
				var currentBid = $('#currentBid').html();
				currentBid = currentBid.substring(0, currentBid.length - 1);
				val = this.value;
				if (parseFloat(val) >= (parseFloat(currentBid) + 0.5)
						&& parseFloat(val) <= (parseFloat(currentBid) + 10)) {
					$( "#biddingArea" ).removeClass("form-group has-error").addClass( "form-group has-success" );					
					//alert("Valid Price:" + val);
					$(':input[type="submit"]').prop('disabled', false);
				} else {
					$( "#biddingArea" ).removeClass("form-group has-success").addClass( "form-group has-error" );
					//alert("Invalid Price:" + val);
					$(':input[type="submit"]').prop('disabled', true);

				}
			});

	$("#bidamount").on("keyup", function() {
		var valid = /^\d{0,4}(\.\d{0,2})?$/.test(this.value), val = this.value;
		if (!valid) {
			console.log("Invalid input!");
			this.value = val.substring(0, val.length - 1);

		}
	});
	$(document).ready(function(){
		var contextRoot = "/" + window.location.pathname.split('/')[1];
		var id = "${bid.assetId.assetId}";
		setInterval(function() {
			$.ajax({
				url : contextRoot + '/getHighestBid?assetsId=' + id,
				type : 'GET',
				dataType : "json", // Accepts				
				contentType : 'application/json', // Sends
				success : function(employee) {	
					$("#currentBid").html(employee.bidPurposedAmount+"$")
				},
				error : function(error) {
					console.log(error)
				}

			});
		},10000);	
	});
</script>

<script type="text/javascript">
	
	var endtime = "${bid.assetId.bidEndDate}";	
		$('#clock').countdown(endtime, function(event) {
		var totalHours = event.offset.totalDays * 24 + event.offset.hours;
			$(this).html(event.strftime(totalHours + ' hr %M min %S sec'));
		});
	</script>