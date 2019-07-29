<%-- <%@ page pageEncoding="utf-8" isELIgnored="false"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>


<jsp:include page="/WEB-INF/layouts/head-meta.jsp"></jsp:include>
<!-- PAGE CLASSNAME - NO CHANGE ORTHER OF THESE -->
<body class="bg-white">
	<div class="wrap wrap-index user-login-page">
<!-- END PAGE CLASSNAME -->
<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>


<section id=content>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-85 p-b-20">
				<form class="login100-form validate-form" action="/login_url" method="post">
					<span class="login100-form-title ">
						Welcome
					</span>
					<span class="login100-form-avatar hidden">
						<img src="https://scontent-hkg3-2.xx.fbcdn.net/v/t1.0-9/61127079_136054257501774_7070886246603554816_n.jpg?_nc_cat=109&_nc_oc=AQkSZjN77RUmBVYdor1y0FUljpZmJkeALu8BzjikFASu_yDsxZbhmL-dxMXztBu7LSw&_nc_ht=scontent-hkg3-2.xx&oh=ad5ec35c19bbf65b2ef139d4d0f45b0f&oe=5D81A421" alt="AVATAR">
					</span>
					<div class=" m-b-35" data-validate = "Enter username">
					<h4><c:if test="${not empty errorMessge}"><div style="color:red; font-weight: bold; margin: 30px 0px;">${errorMessge}</div></c:if></h4>
					</div>
					
					<div class="wrap-input100 validate-input m-b-35" data-validate = "Enter username">
						<input class="input100" type="text" name="username" autofocus>
						<span class="focus-input100" data-placeholder="Username"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
						<input class="input100" type="password" name="password">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

					<ul class="login-more p-t-100">
						<li class="m-b-8">
							<span class="txt1">
								Forgot
							</span>

							<a href="#" class="txt2">
								Username / Password?
							</a>
						</li>

						<li>
							<span class="txt1">
								Don’t have an account?
							</span>

							<a href="#" class="txt2">
								Sign up
							</a>
						</li>
					</ul>
				</form>
			</div>
		</div>
	</div>
		<div id="dropDownSelect1"></div>
	</section>

<!-- End Content -->

<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>