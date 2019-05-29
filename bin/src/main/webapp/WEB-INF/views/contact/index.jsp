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
				<div class="main-content-page">
					<div class="content-contact-page">
						<h2 class="title30 rale-font font-bold text-uppercase">contact us</h2>
						<div class="map-box map-box-contact">
							<div id="map"
								class="sv-ggmaps map-custom" 
								data-lat="10.7787712" 
								data-lon="106.6878343" 
								data-market="" 
								data-zoom="16" 
								data-style="grayscale" 
								data-control="false" 
								data-scrollwheel="false" 
								data-disable_ui="false" 
								data-draggable="false">
							</div>
						</div>
						<!-- End Google Map -->
						<div class="contact-page-info blockquote">
							<div class="row">
								<div class="col-md-5 col-sm-12 col-xs-12">
									<div class="contact-box">
										<span class="color"><i class="fas fa-university"></i></span>
										<label class="title14 color text-uppercase">ADDRESS:</label>
										<p class="desc">The Company Name Inc. 4320 St Vincent Place,Glasgow, DC 28</p>
									</div>
								</div>
								<div class="col-md-4 col-sm-12 col-xs-12">
									<div class="contact-box">
										<span class="color"><i class="fa fa-phone"></i></span>
										<ul class="list-inline-block">
											<li>
												<label class="title14 color text-uppercase">PHONES:</label>
											</li>
											<li>
												<span>800-6688-999;</span>
												<span>800-8866-404</span>
											</li>
										</ul>
									</div>
									<div class="contact-box">
										<span class="color"><i class="fa fa-fax"></i></span>
										<ul class="list-inline-block">
											<li>
												<label class="title14 color text-uppercase">Fax:</label>
											</li>
											<li>
												<span>800-6969-0044;</span>
											</li>
										</ul>
									</div>
								</div>
								<div class="col-md-3 col-sm-12 col-xs-12">
									<div class="contact-box">
										<span class="color"><i class="fa fa-envelope-open"></i></span>
										<label class="title16 color text-uppercase">e-mail:</label>
										<p class="desc"><a href="#">verycheap@gmail.com</a></p>
									</div>
								</div>
							</div>
						</div>
						<!-- End Contact Info -->
						<div class="contact-form-faq">
							<div class="row">
								<div class="col-md-6 col-sm-6 col-xs-12">
									<div class="contact-form">
										<h2 class="title18 rale-font font-bold text-uppercase">Contact Form</h2>
										<form>
											<input onblur="if (this.value=='') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''" value="Your username *" type="text">
											<input onblur="if (this.value=='') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''" value="Your e-mail address *" type="text">
											<input onblur="if (this.value=='') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''" value="Subject *" type="text">
											<textarea onblur="if (this.value=='') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''" rows="7">Message *</textarea>
											<input type="submit" value="send" class="bg-color white text-uppercase font-bold" />
											<input type="reset" value="Clear" class="bg-black white text-uppercase font-bold" />
										</form>
									</div>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<div class="contact-faq">
										<h2 class="title18 rale-font font-bold text-uppercase">FAQs</h2>
										<div class="contact-accordion toggle-tab bg-white">
											<div class="item-toggle-tab active">
												<h2 class="toggle-tab-title title14 text-uppercase font-bold">At vero eos et accusamus et iusto</h2>
												<p class="desc toggle-tab-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid animi archi tecto aspernatur assumenda cum inventore labore magnam </p>
											</div>
											<div class="item-toggle-tab">
												<h2 class="toggle-tab-title title14 text-uppercase font-bold">Dignissimos ducimus qui blanditiis</h2>
												<p class="desc toggle-tab-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid animi archi tecto aspernatur assumenda cum inventore labore magnam </p>
											</div>
											<div class="item-toggle-tab">
												<h2 class="toggle-tab-title title14 text-uppercase font-bold">Raesentium voluptatum deleniti</h2>
												<p class="desc toggle-tab-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid animi archi tecto aspernatur assumenda cum inventore labore magnam </p>
											</div>
											<div class="item-toggle-tab">
												<h2 class="toggle-tab-title title14 text-uppercase font-bold">At vero eos et accusamus et iusto</h2>
												<p class="desc toggle-tab-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid animi archi tecto aspernatur assumenda cum inventore labore magnam </p>
											</div>
											<div class="item-toggle-tab">
												<h2 class="toggle-tab-title title14 text-uppercase font-bold">Dignissimos ducimus qui blanditiis</h2>
												<p class="desc toggle-tab-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid animi archi tecto aspernatur assumenda cum inventore labore magnam </p>
											</div>
										</div>
									</div>
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