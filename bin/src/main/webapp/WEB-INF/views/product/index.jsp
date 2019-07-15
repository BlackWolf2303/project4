<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>

	<section id="content">
		<div class="content-page"> 
			<div class="container">
				<div class="box-service7 box-service11 box-service-grid">
					<div class="row">
						<div class="col-md-4 col-sm-4 col-xs-4">
							<div class="item-service item-service7 item-service11 table">
								<div class="icon-service icon-service7">
									<a href="#" class=" title30 color"><i class="fas fa-shopping-basket"></i></a>
								</div>	
								<div class="info-service">
									<h3 class="color title18 text-uppercase font-bold rale-font"><a href="#" class="link-hover">FREE SHIPPING</a></h3>
									<p>On orders over $99.</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-4 col-xs-4"> 
							<div class="item-service item-service7 item-service11 table">
								<div class="icon-service icon-service7">
									<a href="#" class="icon-service title30 color"><i class="fas fa-undo-alt"></i></a>
								</div>	
								<div class="info-service">
									<h3 class="color title18 text-uppercase font-bold rale-font"><a href="#" class="link-hover">ORDER RETURN</a></h3>
									<p>Returns within 7 days</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 col-sm-4 col-xs-4">
							<div class="item-service item-service7 item-service11 table">
								<div class="icon-service icon-service7">
									<a href="#" class="icon-service title30 color"><i class="fas fa-phone-volume"></i></a>
								</div>
								<div class="info-service">
									<h3 class="color title18 text-uppercase font-bold rale-font"><a href="#" class="link-hover">SUPPORT 24/7</a></h3>
									<p>Online support services</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end box-service -->
			 </div>
			 <div class="main-page content-right-sidebar">
				<div class="container">
					<div class="row">
						<div class="col-md-9 col-sm-9 col-xs-12">
							<div class="box-detail-product box-detail-sidebar">
								<div class="wrap-detail-product wrap-detail-product3 border">
									<div class="row">
										<div class="col-md-6 col-sm-6 col-xs-12">
											<div class="detail-gallery detail-gallery3">
												<div class="thumb-product mid">
													<span class="sale-item">sale</span>
													<a href="#"><img src="${pageContext.request.contextPath}/resources/assets/images/product/giay.jpg" alt=""/></a>
												</div>
												<div class="gallery-control gallery-control3">
													<div class="carousel" data-vertical="false">
														<ul class="list-none">
														<c:forEach var="image" items="${product.images }">
														<li><a href="#" class="active"><img src="${pageContext.request.contextPath}/resources/assets${image.name}" alt=""/></a></li>
														</c:forEach>
															
														</ul>
													</div>
													<div class="control-button-gallery control-button-gallery3 text-center">
														<a href="#" class="prev"><i class="fas fa-angle-left"></i></a>
														<a href="#" class="next"><i class="fas fa-angle-right"></i></a>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<div class="detail-info detail-info2 detail-info3 product-info">
												<span class="title10 text-uppercase">accessories</span>
												<h3 class="title30 font-bold"><a href="#" class="link-hover">${product.name}</a></h3>
												<div class="product-price">
													<del>${product.price}</del>
													<ins class="font-bold color">$48.50</ins>
												</div>
												<div class="product-rate">
													<div class="product-rating">													
														<div class="inner-rating"></div>
													</div>
												</div>
												<div class="choose-detail choose-detail2 choose-color">
													<span>Color:</span>
													<ul class="list-inline-block list-color">
													<c:forEach var="color" items="${product.colors }">
														<li><a href="#" class="name-color active color-${color.name }">${color.name }</a></li>
													</c:forEach>
													</ul>
												</div>
												<div class="choose-detail choose-detail2 choose-size">
													<span>Size:</span>
													<c:if test="${!product.freeSize }">
														<ul class="list-inline-block">
														<c:forEach var="size" items="${product.sizes }">
															<li><a href="#" class="active border bg-white">${size.name }</a></li>
														</c:forEach>
														</ul>
													</c:if>
													<c:if test="${product.freeSize }">
														<ul class="list-inline-block">
															<li><a href="#" class="active border bg-white">Oversize</a></li>
														</ul>
													</c:if>
													<span class="text-uppercase title10 bg-gray size-guide size-guide2">sizes guide</span>
												</div>
											</div>
											<div class="detail-cart detail-cart2 detail-cart3">
												<div class="box-qty-cart clearfix">
													<div class="product-qty pull-left">
														<span class="font-bold">Qty:</span>
														<div class="detail-qty bg-white info-qty border bg-white">
															<span class="qty-val">1</span>
															<a href="#" class="qty-up"><i class="fa fa-angle-up" aria-hidden="true"></i></a>
															<a href="#" class="qty-down"><i class="fa fa-angle-down" aria-hidden="true"></i></a>
														</div>
													</div>
													<a href="#" class="pull-left addcart-link bg-color text-uppercase font-bold white hover-btn"><span>Add to cart</span></a>
												</div>
												<ul class="list-inline-block">
													<li><a href="#" class="wishlist-link link-hover"><i class="far fa-heart"></i> Add to Wishlist</a></li>
													<li><a href="#" class="compare-link link-hover"><i class="fas fa-exchange-alt"></i> Add to Compare</a></li>
												</ul>
												<ul class="list-inline-block box-instock">
													<li><span>Availability:</span></li>
													<li><a href="#" class="title12 in-stock bg-white border hover-btn">In stock</a></li>
												</ul>
												<ul class="list-inline-block">
													<li><span>Categories:</span></li>
													<c:forEach var="category" items="${product.categories }">
														<li><a href="#" class="title12 list-tag-cate bg-white border hover-btn">${ category.name}</a></li>
													</c:forEach>
													
												</ul>
												<ul class="list-inline-block social-box">
													<li><a href="#" class="wobble-bottom"><i class="fab fa-facebook-f"></i></a></li>
													<li><a href="#" class="wobble-bottom"><i class="fab fa-twitter"></i></a></li>
													<li><a href="#" class="wobble-bottom"><i class="fab fa-pinterest-p"></i></a></li>
													<li><a href="#" class="wobble-bottom"><i class="fab fa-google-plus-g"></i></a></li>
													<li><a href="#" class="wobble-bottom"><i class="fas fa-envelope"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
									<ul class="list-inline-block box-btn box-btn2">
										<li><a href="#" class="detail-btn btn-left"><i class="fas fa-angle-left"></i></a></li>
										<li><a href="#" class="detail-btn btn-right"><i class="fas fa-angle-right"></i></a></li>
									</ul>
								</div>
							</div>
							<!-- end box-detail-product -->
							<div class="tabs-detail tabs-detail3 border-bottom">
								<div class="title-tab-detail">
									<ul class="list-inline-block">
										<li class="active"><a href="#tab1" data-toggle="tab" class="link-hover text-uppercase font-bold">Description</a></li>
										<li><a href="#tab2" class="text-uppercase font-bold link-hover" data-toggle="tab">Reviews</a></li>
										<li><a href="#tab3" class="text-uppercase font-bold link-hover" data-toggle="tab">tags</a></li>
										<li><a href="#tab4" class="text-uppercase font-bold link-hover" data-toggle="tab">video</a></li>
									</ul>
								</div>
								<div class="tab-content border-top border-bottom">
									<div id="tab1" class="tab-pane active">
										<div class="detail-description">
											<div class="row">
												<div class="col-md-3 col-sm-4 col-xs-4">
													<div class="thumb-box overlay-image">
														<a href="#" class="advs-thumb-link"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-33.jpg" alt="" /></a>
													</div>
												</div>
												<div class="col-md-9col-sm-8 col-xs-8">
													<div class="info-box">
														<p class="desc">Our planet is something unbelievable. It is so diverse and beautiful, so unique and controversial. Earth is worth our admiring. The easiest way to explore all wonders and unique places of our planet is travelling. It is very romantic and it takes one's breath away because new emotions are always unforgettable. Just imagine yourself standing on the top of the waterfall or sitting among the tropical plants in the jungles. All these world wonders such as endless deserts, boiling volcanoes, icebergs and other phenomena are available for you to see with your own eyes. The words are not enough to express all your emotions. But travelling is very complicated activity that is 
why you must be prepared to any kinds of surprises. In ancient times travellers have used maps as the main source of information. 
The globe and the map are the small model of our world. Nowadays maps are very useful thing especially when you want to explore some wild spots. Of course you can rely on your GPS system but we must never forget our past because new technologies are more vulnerable than good-old stuff. Our company provides goods of premium quality and at fair prices. We are sure that these options are the secret of success. That is why we have so many devoted clients all over the country - there is nothing better than thankful customers. Our products are the inspiration to save the nature and explore new spaces. We care about clients and we hope that our products will suit you in the best way. If you have some questions you can find the answers in our superb 24/7 support system. Don’t forget about our special discounts and benefits.</p>
														<ul class="list-none">
															<li>The globe and the map are the small model of our world. Nowadays maps are very useful thing especially when you want to explore some wild spots. </li>
															<li>Of course you can rely on your GPS system but we must never forget our past because new technologies are more vulnerable than good-old stuff.</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div id="tab2" class="tab-pane">
										<div class="content-review">
											<div class="box-thought">
												<h3 class="title18 text-uppercase font-bold">2 review ON “A SIMPLE BLOG POST”</h3>
												<div class="author-thought table first-child">
													<div class="ava-author">
														<a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/ava-post/02.png" alt="" /></a>
													</div>
													<div class="content-box">
														<div class="name-author clearfix">
															<h3 class="title14 text-uppercase font-bold pull-left">Mr Amson says:</h3>
															<a href="#" class="link-hover link-rep font-semi-bold text-uppercase pull-right">reply</a>
														</div>
														<p class="desc">Hi, this is a comment.</p>
														<p class="desc">To delete a comment, just log in and view the post's comments. There you will have the option to edit or delete them.</p>
														<a href="#" class="link-hover title12 silver">Feb 26, 2017 </a>
													</div>
												</div>
												<div class="author-thought table">
													<div class="ava-author">
														<a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/ava-post/03.png" alt="" /></a>
													</div>
													<div class="content-box">
														<div class="name-author clearfix">
															<h3 class="title14 text-uppercase font-bold pull-left">Mr Kenlly says:</h3>
														</div>
														<p class="desc">Hi, this is a review.</p>
														<p class="desc">To delete a review, just log in and view the post's comments. There you will have the option to edit or delete them.</p>
														<a href="#" class="link-hover title12 silver">Feb 26, 2017 </a>
													</div>
												</div>
											</div>
											<div class="box-rep-comment">	
												<h3 class="title18 text-uppercase font-bold">add a review</h3>
												<p class="desc">Your email address will not be published. Required fields are marked *</p>
												<form class="rep-comment-form clearfix">
													<div class="input-text input-user">
														<input type="text" value="User name*" onfocus="if (this.value==this.defaultValue) this.value = ''" onblur="if (this.value=='') this.value = this.defaultValue">
													</div>
													<div class="input-text input-email">
														<input type="text" value="Email*" onfocus="if (this.value==this.defaultValue) this.value = ''" onblur="if (this.value=='') this.value = this.defaultValue">
													</div>
													<div class="clearfix rate-review border">
														<span class="pull-left font-semi-bold">Your Rating:</span>
														<div class="product-rate pull-left">
															<div class="product-rating" style="width:100%"></div>
														</div>
													</div>
													<div class="input-text input-comment">
														<textarea onblur="if (this.value=='') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''" rows="7">Your review*</textarea>
													</div>
													<div class="submit bg-color hover-btn text-center">
														<input type="submit" value="Post a review">
													</div>	
												</form>
											</div>
										</div>
									</div>
									<div id="tab3" class="tab-pane">
										<div class="detail-addition">
											<table class="table table-bordered table-striped">
												<tr>
													<td><p class="desc">Frame Material: Wood</p></td>
													<td><p class="desc">Seat Material: Wood</p></td>
												</tr>
												<tr>
													<td><p class="desc">Adjustable Height: No</p></td>
													<td><p class="desc">Seat Style: Saddle</p></td>
												</tr>
												<tr>
													<td><p class="desc">Distressed: No</p></td>
													<td><p class="desc">Custom Made: No</p></td>
												</tr>
												<tr>
													<td><p class="desc">Number of Items Included: 1</p></td>
													<td><p class="desc">Folding: No</p></td>
												</tr>
												<tr>
													<td><p class="desc">Stackable: No</p></td>
													<td><p class="desc">Cushions Included: No</p></td>
												</tr>
												<tr>
													<td><p class="desc">Arms Included: No</p></td>
													<td>
														<div class="product-more-info">
															<p class="desc">Legs Included: Yes</p>
															<ul class="list-none">
																<li><a href="#">Leg Material: Wood</a></li>
																<li><a href="#">Number of Legs: 4</a></li>
															</ul>
														</div>
													</td>
												</tr>
												<tr>
													<td><p class="desc">Footrest Included: Yes</p>	</td>
													<td><p class="desc">Casters Included: No</p></td>
												</tr>
												<tr>
													<td><p class="desc">Nailhead Trim: No</p></td>
													<td><p class="desc">Weight Capacity: 225 Kilogramm</td>
												</tr>
												<tr>
													<td><p class="desc">Commercial Use: No</p></td>
													<td><p class="desc">Country of Manufacture: Vietnam</p></td>
												</tr>
											</table>
										</div>
									</div>
									<div id="tab4" class="tab-pane">
										<div class="detail-video">
											<div class="box-player">
												<div class="video-info">
													<a href="#" class="video-button shop-button"> discover now</a>
												</div>
												<video class="video-custom" loop muted poster="photos/banner/7uptheme_verycheap_50.jpg">
													<source src="video/video_verycheap_fashion.mp4" type="video/mp4">
												</video>
											</div> 
										</div>
									</div>
								</div>
							</div>
							<div class="lastest-product">
								<h2 class="title24 text-uppercase font-bold">latest products</h2>
								<div class="wrap-product">
									<div class="wrap-item" data-pagination="false" data-autoplay="false" data-transition="fade" data-navigation="true" data-itemscustom="[[0,1],[560,2],[768,3],[1024,3],[1200,3]]">
										<div class="item-product item-product1 text-center">
											<span class="sale-item">sale</span>
											<div class="product-thumb mid">
												<a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-6.jpg" alt="" /></a>
												<a href="quick-view.html" class="quickview-link fancybox fancybox.iframe"><i class="fas fa-eye"></i></a>
												<div class="product-extra-link clearfix">
													<a href="#" class="addcart-link pull-left"><span>Add to cart</span></a>
													<a href="#" class="compare-link pull-right"><i class="fas fa-exchange-alt"></i></a>
													<a href="#" class="wishlist-link pull-right"><i class="far fa-heart"></i></a>
												</div>
											</div>
											<div class="product-info">
												<span class="title10 text-uppercase">Women’s</span>
												<h3 class="title14 font-bold"><a href="#" class="link-hover">Fashion store clothing</a></h3>
												<div class="product-price">
													<del>$97.00</del>
													<ins class="font-bold color">$48.50</ins>
												</div>
												<div class="thumb-carousel thumb-carousel-product text-center">
													<div class="carousel-product">
														<ul class="list-inline">
															<li class="active"><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-6.jpg" alt=""></a></li>
															<li><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-6-6.jpg" alt=""></a></li>
															<li><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-6-6-6.jpg" alt=""></a></li>
														</ul>
													</div>  
												</div>
											</div>
										</div>
										<div class="item-product item-product1 text-center">
											<div class="product-thumb mid">
												<a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-1.jpg" alt="" /></a>
												<a href="quick-view.html" class="quickview-link fancybox fancybox.iframe"><i class="fas fa-eye"></i></a>
												<div class="product-extra-link">
													<a href="#" class="addcart-link pull-left"><span>Add to cart</span></a>
													<a href="#" class="compare-link pull-right"><i class="fas fa-exchange-alt"></i></a>
													<a href="#" class="wishlist-link pull-right"><i class="far fa-heart"></i></a>
												</div>
											</div>
											<div class="product-info">
												<span class="title10 text-uppercase">Women’s</span>
												<h3 class="title14 font-bold"><a href="#" class="link-hover">Fashion store clothing</a></h3>
												<div class="product-price">
													<ins class="font-bold color">$234.00</ins>
												</div>
												<div class="thumb-carousel thumb-carousel-product text-center">
													<div class="carousel-product">
														<ul class="list-inline">
															<li class="active"><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-1.jpg" alt=""></a></li>
															<li><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-1-1.jpg" alt=""></a></li>
															<li><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-1-1-1.jpg" alt=""></a></li>
														</ul>
													</div>  
												</div>
											</div>
										</div>
										<div class="item-product item-product1 text-center">
											<span class="sale-item">sale</span>
											<div class="product-thumb mid">
												<a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-4.jpg" alt="" /></a>
												<a href="quick-view.html" class="quickview-link fancybox fancybox.iframe"><i class="fas fa-eye"></i></a>
												<div class="product-extra-link">
													<a href="#" class="addcart-link pull-left"><span>Add to cart</span></a>
													<a href="#" class="compare-link pull-right"><i class="fas fa-exchange-alt"></i></a>
													<a href="#" class="wishlist-link pull-right"><i class="far fa-heart"></i></a>
												</div>
											</div>
											<div class="product-info">
												<span class="title10 text-uppercase">Women’s</span>
												<h3 class="title14 font-bold"><a href="#" class="link-hover">Fashion store clothing</a></h3>
												<div class="product-price">
													<del>$97.00</del>
													<ins class="font-bold color">$48.50</ins>
												</div>
												<div class="thumb-carousel thumb-carousel-product text-center">
													<div class="carousel-product">
														<ul class="list-inline">
															<li class="active"><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-4.jpg" alt=""></a></li>
															<li><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-4-4.jpg" alt=""></a></li>
															<li><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-4-4-4.jpg" alt=""></a></li>
														</ul>
													</div>  
												</div>
											</div>
										</div>
										<div class="item-product item-product1 text-center">
											<div class="product-thumb mid">
												<a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-5.jpg" alt="" /></a>
												<a href="quick-view.html" class="quickview-link fancybox fancybox.iframe"><i class="fas fa-eye"></i></a>
												<div class="product-extra-link">
													<a href="#" class="addcart-link pull-left"><span>Add to cart</span></a>
													<a href="#" class="compare-link pull-right"><i class="fas fa-exchange-alt"></i></a>
													<a href="#" class="wishlist-link pull-right"><i class="far fa-heart"></i></a>
												</div>
											</div>
											<div class="product-info">
												<span class="title10 text-uppercase">Women’s</span>
												<h3 class="title14 font-bold"><a href="#" class="link-hover">Fashion store clothing</a></h3>
												<div class="product-price">
													<ins class="font-bold color">$58.9</ins>
												</div>
												<div class="thumb-carousel thumb-carousel-product text-center">
													<div class="carousel-product">
														<ul class="list-inline">
															<li class="active"><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-5.jpg" alt=""></a></li>
															<li><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-5-5.jpg" alt=""></a></li>
															<li><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-5-5-5.jpg" alt=""></a></li>
														</ul>
													</div>  
												</div>
											</div>
										</div>
										<div class="item-product item-product1 text-center">
											<div class="product-thumb mid">
												<a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-7.jpg" alt="" /></a>
												<a href="quick-view.html" class="quickview-link fancybox fancybox.iframe"><i class="fas fa-eye"></i></a>
												<div class="product-extra-link">
													<a href="#" class="addcart-link pull-left"><span>Add to cart</span></a>
													<a href="#" class="compare-link pull-right"><i class="fas fa-exchange-alt"></i></a>
													<a href="#" class="wishlist-link pull-right"><i class="far fa-heart"></i></a>
												</div>
											</div>
											<div class="product-info">
												<span class="title10 text-uppercase">Women’s</span>
												<h3 class="title14 font-bold"><a href="#" class="link-hover">Fashion store clothing</a></h3>
												<div class="product-price">
													<del>$97.00</del>
													<ins class="font-bold color">$48.50</ins>
												</div>
												<div class="thumb-carousel thumb-carousel-product text-center">
													<div class="carousel-product">
														<ul class="list-inline">
															<li class="active"><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-7.jpg" alt=""></a></li>
															<li><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-7-7.jpg" alt=""></a></li>
															<li><a href="#"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-7-7-7.jpg" alt=""></a></li>
														</ul>
													</div>  
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-3 col-xs-12">
							<div class="sidebar-right">
								<div class="widget widget-rate-product widget-rate-product2 bg-white border">
									<h2 class="widget-title title14 text-uppercase font-bold">TOP RATED PRODUCTS</h2>
									<ul class="list-none">
										<li>
											<div class="item-product table">
												<div class="product-thumb text-center zoom-rotate overlay-image">
													<a href="#" class="advs-thumb-link"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-26.jpg" alt="" /></a>
												</div>
												<div class="product-info">
													<span class="title10 text-uppercase">men's</span>
													<h3 class="title14 font-bold"><a href="#" class="link-hover">Fashion store clothing</a></h3>
													<div class="product-rate">
														<div class="product-rating">													
															<div class="inner-rating"></div>
														</div>
													</div>
													<ul class="list-inline-block product-price">
														<li>	
															<del>$97.00</del>
															<ins class="font-bold color">$48.50</ins>
														</li>
													</ul>
												</div>
											</div>
										</li>
										<li>
											<div class="item-product table">
												<div class="product-thumb text-center zoom-rotate overlay-image">
													<a href="#" class="advs-thumb-link"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-8.jpg" alt="" /></a>
												</div>
												<div class="product-info">
													<span class="title10 text-uppercase">men's</span>
													<h3 class="title14 font-bold"><a href="#" class="link-hover">Fashion store clothing</a></h3>
													<div class="product-rate">
														<div class="product-rating">													
															<div class="inner-rating"></div>
														</div>
													</div>
													<ul class="list-inline-block product-price">
														<li>	
															<del>$97.00</del>
															<ins class="font-bold color">$48.50</ins>
														</li>
													</ul>
												</div>
											</div>
										</li>
										<li>
											<div class="item-product table">
												<div class="product-thumb text-center zoom-rotate overlay-image">
													<a href="#" class="advs-thumb-link"><img src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-14.jpg" alt="" /></a>
												</div>
												<div class="product-info">
													<span class="title10 text-uppercase">men's</span>
													<h3 class="title14 font-bold"><a href="#" class="link-hover">Fashion store clothing</a></h3>
													<div class="product-rate">
														<div class="product-rating">													
															<div class="inner-rating"></div>
														</div>
													</div>
													<ul class="list-inline-block product-price">
														<li>	
															<del>$97.00</del>
															<ins class="font-bold color">$48.50</ins>
														</li>
													</ul>
												</div>
											</div>
										</li>
									</ul>
								</div>
								<div class="widget widget-cate border">
									<h2 class="widget-title title14 text-uppercase font-bold">categories</h2>
									<div class="widget-content">
										<ul class="list-none">
											<li class="has-sub-cat">
												<a href="#">Clothing</a>
												<ul class="list-none">
													<li><a href="#" class="title12">Women’s</a></li>
													<li><a href="#" class="title12">Men's</a></li>
												</ul>
											</li>
											<li class="has-sub-cat">
												<a href="#">Bags</a>
												<ul class="list-none">
													<li><a href="#" class="title12">Gucci</a></li>
													<li><a href="#" class="title12">Chanel</a></li>
													<li><a href="#" class="title12">YSL</a></li>
												</ul>
											</li>
											<li class="has-sub-cat">
												<a href="#">Shoes</a>
												<ul class="list-none">
													<li><a href="#" class="title12">Dior</a></li>
													<li><a href="#" class="title12">Dolce & Gabbana</a></li>
												</ul>
											</li>
											<li class="has-sub-cat">
												<a href="#">Jewelry</a>
											</li>
											<li class="has-sub-cat">
												<a href="#">Accessories</a>
											</li>
										</ul>
									</div>
								</div>
								<div class="widget6 widget-banner zoom-rotate overlay-image">
									<a href="#" class="advs-thumb-link"><img src="${pageContext.request.contextPath}/resources/assets/photos/banner/7uptheme_verycheap_25.jpg" alt="" /></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Content -->

<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>