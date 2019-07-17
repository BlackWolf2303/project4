
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
								<a href="#" class=" title30 color"><i
									class="fas fa-shopping-basket"></i></a>
							</div>
							<div class="info-service">
								<h3 class="color title18 text-uppercase font-bold rale-font">
									<a href="#" class="link-hover">FREE SHIPPING</a>
								</h3>
								<p>On orders over $99.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4">
						<div class="item-service item-service7 item-service11 table">
							<div class="icon-service icon-service7">
								<a href="#" class="icon-service title30 color"><i
									class="fas fa-undo-alt"></i></a>
							</div>
							<div class="info-service">
								<h3 class="color title18 text-uppercase font-bold rale-font">
									<a href="#" class="link-hover">ORDER RETURN</a>
								</h3>
								<p>Returns within 7 days</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 col-xs-4">
						<div class="item-service item-service7 item-service11 table">
							<div class="icon-service icon-service7">
								<a href="#" class="icon-service title30 color"><i
									class="fas fa-phone-volume"></i></a>
							</div>
							<div class="info-service">
								<h3 class="color title18 text-uppercase font-bold rale-font">
									<a href="#" class="link-hover">SUPPORT 24/7</a>
								</h3>
								<p>Online support services</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end box-service -->
			<div class="box-gridview">
				<div class="row">
					<div class="col-md-3 col-sm-3">
						<div class="sidebar-left">
							<div class="widget widget-cate border">
								<h2 class="widget-title title14 text-uppercase font-bold">categories</h2>
								<div class="widget-content">
									<ul class="list-none">
										<li class="has-sub-cat"><a href="#">Clothing</a>
											<ul class="list-none">
												<li><a href="#" class="title12">Women’s</a></li>
												<li><a href="#" class="title12">Men's</a></li>
											</ul></li>
										<li class="has-sub-cat"><a href="#">Bags</a>
											<ul class="list-none">
												<li><a href="#" class="title12">Gucci</a></li>
												<li><a href="#" class="title12">Chanel</a></li>
												<li><a href="#" class="title12">YSL</a></li>
											</ul></li>
										<li class="has-sub-cat"><a href="#">Shoes</a>
											<ul class="list-none">
												<li><a href="#" class="title12">Dior</a></li>
												<li><a href="#" class="title12">Dolce & Gabbana</a></li>
											</ul></li>
										<li class="has-sub-cat"><a href="#">Jewelry</a></li>
										<li class="has-sub-cat"><a href="#">Accessories</a></li>
									</ul>
								</div>
							</div>
							<div class="widget widget-price border">
								<h2
									class="widget-title widget-price-title title14 text-uppercase font-bold">price</h2>
								<div class="range-filter">
									<div class="slider-range"></div>
									<div class="amount"></div>
									<button
										class="btn-filter bg-color white text-uppercase hover-btn">Filter</button>
								</div>
							</div>
							<div class="widget widget-filter-attr widget-filter-color border">
								<h2 class="widget-title title14 text-uppercase font-bold">color</h2>
								<div class="widget-content">
									<ul class="list-none filter-color">
										<li><a href="#">Blacks</a></li>
										<li><a href="#" class="active">Whites</a></li>
										<li><a href="#">Reds</a></li>
										<li><a href="#">Greys</a></li>
										<li><a href="#">Blues</a></li>
										<li><a href="#">Greens</a></li>
										<li><a href="#">Browns</a></li>
										<li><a href="#">Ecru tones</a></li>
										<li><a href="#">Pinks</a></li>
										<li><a href="#">Yellows</a></li>
										<li><a href="#">Oranges</a></li>
										<li><a href="#">Purples</a></li>
									</ul>
								</div>
							</div>
							<div class="widget widget-filter-attr border">
								<h2 class="widget-title title14 text-uppercase font-bold">Size</h2>
								<div class="widget-content">
									<ul class="list-none filter-size">
										<li><a href="#">One Size</a></li>
										<li><a href="#" class="active">M</a></li>
										<li><a href="#">L</a></li>
										<li><a href="#">XL</a></li>
										<li><a href="#">2XL</a></li>
										<li><a href="#">3XL</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-9 col-sm-9">
						<div class="title-grid title-grid-sidebar">
							<div class="row">
								<div class="col-md-3 col-sm-3 col-xs-12">
									<h3
										class="title24 rale-font font-bold text-uppercase text-left dark">Gridview</h3>
								</div>
								<div class="col-md-9 col-sm-9 col-xs-12">
									<div class="sort-view text-right">
										<div class="sort-bar">
											<span>Sort</span> <select>
												<option value="">Price: low to high</option>
												<option value="">Price: high to low</option>
											</select>
										</div>
										<div class="per-page">
											<span>Per Page</span> <select>
												<option value="">9</option>
												<option value="">8</option>
												<option value="">7</option>
												<option value="">6</option>
												<option value="">5</option>
												<option value="">4</option>
												<option value="">3</option>
												<option value="">2</option>
												<option value="">1</option>
											</select>
										</div>
										<div class="view-type pull-right clearfix">
											<span>View as</span>
											<ul class="list-inline-block">
												<li class="border active"><a href="gridview.html"><i
														class="fas fa-th-large"></i></a></li>
												<li class="border"><a href="listview.html"><i
														class="fas fa-bars"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="content-box text-center">
							<div class="row">
							
								<c:forEach var="product" items="${products }">
								
									<div class="col-md-4 col-sm-4 col-xs-6">
										<div class="item-product item-product1">
											<div class="wrap-item-product">
												<span class="sale-item">sale</span>
												<div class="product-thumb mid">
													<a href="${pageContext.request.contextPath}/categories/${product.id}"><img
														src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-8.jpg"
														alt="" /></a> <a href="quick-view.html"
														class="quickview-link fancybox fancybox.iframe"><i
														class="fas fa-eye"></i></a>
													<div class="product-extra-link clearfix">
														<a href="${pageContext.request.contextPath}/cart/buy/${product.id}" class="addcart-link pull-left"><span>Add
																to cart</span></a> <a href="${pageContext.request.contextPath}/categories/${product.id}" class="compare-link pull-right"><i
															class="fas fa-exchange-alt"></i></a> <a href="${pageContext.request.contextPath}/categories/${product.id}"
															class="wishlist-link pull-right"><i
															class="far fa-heart"></i></a>
													</div>
												</div>
												<div class="product-info">
<%-- 													<span class="title10 text-uppercase">${product.categories}</span> --%>
													<h3 class="title14 font-bold">
														<a href="${pageContext.request.contextPath}/categories/${product.id}" class="link-hover">${product.name}</a>
													</h3>
													<div class="product-price">
														<del>$97.00</del>
														<ins class="font-bold color">${product.price}</ins>
													</div>
													<div
														class="thumb-carousel thumb-carousel-product text-center">
														<div class="carousel-product">
															<ul class="list-inline">
																<li class="active"><a href="${pageContext.request.contextPath}/categories/${product.id}"><img
																		src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-6.jpg"
																		alt=""></a></li>
																<li><a href="${pageContext.request.contextPath}/categories/${product.id}"><img
																		src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-6-6.jpg"
																		alt=""></a></li>
																<li><a href="${pageContext.request.contextPath}/categories/${product.id}"><img
																		src="${pageContext.request.contextPath}/resources/assets/photos/clothing/fashion-6-6-6.jpg"
																		alt=""></a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>


							</div>
							<div class="number-page text-center">
								<ul class="list-inline-block">
									<li class="active"><a href="#" class="font-bold">1</a></li>
									<li><a href="#" class="font-bold">2</a></li>
									<li><a href="#" class="font-bold">3</a></li>
									<li><a href="#"><i class="fas fa-angle-double-right"></i></a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
</section>
<!-- End Content -->

<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>