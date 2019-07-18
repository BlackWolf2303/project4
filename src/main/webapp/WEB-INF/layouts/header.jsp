<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body class="bg-white">
	<div class="wrap wrap-index">
		<header id="header">
			<div class="header">
				<div
					class="top-header text-center white hidden-xs bg-2color-header-top">
					<div class="container">
						<h3 class="title14 text-uppercase font-bold rale-font">end of
							season sale - up to 80% off</h3>
						<a href="#" class="text-uppercase white link-hover border-left">shop
							now <i class="fas fa-angle-right"></i>
						</a> <a href="#" class="btn-close pull-right"></a>
					</div>
				</div>
				<div class="sub-header">
					<div class="container">
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<div class="call-us">
									<span class="text-uppercase title12"><i
										class="fas fa-phone-volume"></i>Call us: 020 2366 455</span>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<ul class="list-inline-block pull-right box-search-cart">
									<li>
										<div class="search-box">
											<a href="#" class="text-uppercase title12 link-hover"><i
												class="fas fa-search"></i>search</a>
											<form class="search-form clearfix" action="categories/search" method="get">
												<input type="text" value="keyword"
													onfocus="if (this.value==this.defaultValue) this.value = ''"
													onblur="if (this.value=='') this.value = this.defaultValue">
												<div class="submit bg-color text-center">
													<input type="submit" value="">
												</div>
											</form>
										</div>
									</li>
									<c:if test="${!isLogin}">
										<li><a href="<c:url value="/login"/>"
											class="text-uppercase title12 link-hover"><i
												class="fas fa-user"></i> login</a>
									</c:if>
									<c:if test="${isLogin}">
										<li><a href="<c:url value="/logout"/>"
											class="text-uppercase title12 link-hover"><i
												class="fas fa-user"></i> logout</a></li>
										<li><a href="<c:url value="/myaccount"/>"
											class="text-uppercase title12 link-hover"><i
												class="fas fa-user"></i> my account</a></li>
									</c:if>
									<li>
										<div class="mini-cart-box aside-box style-mini-cart">
											<div class="mini-cart-link">
												<a class="link-hover text-uppercase title12 mini-cart-icon"
													href="#"><i class="fas fa-shopping-bag"></i>my cart</a>
											</div>
											<div class="mini-cart-content text-left">
												<h2 class="title18 font-bold">(2) ITEMS IN MY CART</h2>
												<div class="list-mini-cart-item">
													<div class="product-mini-cart table">
														<div class="product-thumb">
															<a href="detail.html" class="product-thumb-link"><img
																alt="" src="photos/products/Bags/bags-01.jpg"></a>
														</div>
														<div class="product-info">
															<h3 class="title14 product-title">
																<a href="#" class="link-hover">Verycheap Bags</a>
															</h3>
															<div class="mini-cart-qty">
																<span>1 x $40.00</span>
															</div>
														</div>
														<div class="product-delete text-right">
															<a href="#" class="remove-product link-hover"><i
																class="fa fa-trash"></i></a>
														</div>
													</div>
													<div class="product-mini-cart table">
														<div class="product-thumb">
															<a href="detail.html" class="product-thumb-link"><img
																alt="" src="photos/products/food/verycheap_food-01.jpg"></a>
														</div>
														<div class="product-info">
															<h3 class="title14 product-title">
																<a href="#" class="link-hover">Verycheap Food</a>
															</h3>
															<div class="mini-cart-qty">
																<span>1 x $40.00</span>
															</div>
														</div>
														<div class="product-delete text-right">
															<a href="#" class="remove-product link-hover"><i
																class="fa fa-trash"></i></a>
														</div>
													</div>
													<div class="product-mini-cart table">
														<div class="product-thumb">
															<a href="detail.html" class="product-thumb-link"><img
																alt="" src="photos/products/Drink/drink-06.jpg"></a>
														</div>
														<div class="product-info">
															<h3 class="title14 product-title">
																<a href="#" class="link-hover">Verycheap Drink</a>
															</h3>
															<div class="mini-cart-qty">
																<span>1 x $40.00</span>
															</div>
														</div>
														<div class="product-delete text-right">
															<a href="#" class="remove-product link-hover"><i
																class="fa fa-trash"></i></a>
														</div>
													</div>
													<div class="product-mini-cart table">
														<div class="product-thumb">
															<a href="detail.html" class="product-thumb-link"><img
																alt="" src="photos/products/Glasses/glasses_01.jpg"></a>
														</div>
														<div class="product-info">
															<h3 class="title14 product-title">
																<a href="#" class="link-hover">Verycheap Glasses</a>
															</h3>
															<div class="mini-cart-qty">
																<span>1 x $40.00</span>
															</div>
														</div>
														<div class="product-delete text-right">
															<a href="#" class="remove-product link-hover"><i
																class="fa fa-trash"></i></a>
														</div>
													</div>
												</div>
												<div class="mini-cart-total text-uppercase title18 clearfix">
													<span class="pull-left">TOTAL</span> <strong
														class="pull-right color mini-cart-total-price">$80.00</strong>
												</div>
												<div class="mini-cart-button">
													<a class="mini-cart-view shop-button white" href="#">View
														cart </a> <a
														class="mini-cart-checkout shop-button white bg-color"
														href="#">Checkout</a>
												</div>
											</div>
										</div>
									</li>

								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="main-header bg-white">
					<div class="container">
						<div class="row">
							<div class="col-md-3 col-sm-3">
								<div class="logo">
									<a href="${pageContext.request.contextPath}/"
										class="color title30 text-uppercase rale-font link-hover"><span
										class="font-bold">very</span>cheap</a>
								</div>
							</div>
							<div class="col-md-9 col-sm-9">
								<nav class="main-nav pull-right">
									<ul class="list-inline-block">
										<li class="menu-item-has-children"><a
											href="${pageContext.request.contextPath}/"
											class="text-uppercase link-hover">Trang chủ </a></li>
										<li class="menu-item-has-children"><a href="#"
											class="text-uppercase link-hover">Khuyến Mãi <i
												class="fas fa-chevron-down"></i></a>
											<ul class="sub-menu">
												<li><a href="product.html">Product full</a></li>
												<li><a href="product-no-sidebar.html">Product no
														sidebar</a></li>
												<li><a href="product-right-sidebar.html">Product
														right sidebar</a></li>
											</ul></li>
										<li class="menu-item-has-children"><a
											href="${pageContext.request.contextPath}/categories"
											class="text-uppercase link-hover">Danh mục sản phẩm <i
												class="fas fa-chevron-down"></i></a>
											<ul class="sub-menu">
												<li><a href="#">Áo khoác & Jacket</a></li>
												<li><a href="#">Áo thun cá tính</a></li>
												<li><a href="#">Đầm váy thiết kế</a></li>
												<li><a href="#">Giày & Túi xách</a></li>
											</ul></li>
										<li class="menu-item-has-children"><a
											href="${pageContext.request.contextPath}/blog"
											class="text-uppercase link-hover">Khám phá</a></li>
										<li><a href="${pageContext.request.contextPath}/about"
											class="text-uppercase link-hover">Về chúng tôi</a></li>
										<li><a href="${pageContext.request.contextPath}/contact"
											class="text-uppercase link-hover">Liên hệ</a></li>
									</ul>
									<a href="#" class="toggle-mobile-menu"><span></span></a>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- End Header -->