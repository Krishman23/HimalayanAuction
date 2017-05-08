<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!----content---->
				
				<!---top-row--->
				<div class="container"> 
					<!----speical-products---->
					<div class="special-products">
						<div class="s-products-head">
							<div class="s-products-head-left">
								<h3>My <span>PRODUCTS</span></h3>
							</div>
							<div class="s-products-head-right">
								<!-- <a href="products.html"><span> </span>view all products</a> -->
							</div>
							<div class="clearfix"> </div>
						</div>
						<!----special-products-grids---->
						<div class="special-products-grids">
							<c:forEach items="${assets}" var="asset">
								<div class="col-md-3 special-products-grid text-center">
									<a class="brand-name" href="single-page.html">
									<!-- <img src="resource/frontend/images/b1.jpg" title="name" /> -->
									</a>
									<a class="product-here" href="single-page.html">
									<!-- <img src="resource/frontend/images/p1.jpg" title="product-name" /> -->
									<img  src="resource/img/assets/assets_${asset.assetId}_0.jpg" title="product-name"/></a>
									<h4><a href="single-page.html">Item:${asset.name}</a></h4>									
									<a class="product-btn" href='<c:url value="/Asset/${asset.assetId}/edit"></c:url>'><span>Edit Item</small><label> </label></a>
								</div>
							</c:forEach>
							<div class="col-md-3 special-products-grid text-center">
								<a class="product-btn" href='<c:url value="Asset/addAsset"></c:url>'><span>Add New Item</span><label> </label></a>
								</div>		
							<p>${LoginError}</p>											
							<div class="clearfix"> </div>
						</div>
						<!---//special-products-grids---->
					</div>
					<!---//speical-products---->
				</div>
				
				
				<!----content---->