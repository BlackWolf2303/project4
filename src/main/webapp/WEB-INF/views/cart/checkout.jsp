<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/layouts/head-meta.jsp"></jsp:include>
<!-- PAGE CLASSNAME - NO CHANGE ORTHER OF THESE -->
<body class="bg-white">
	<div class="wrap wrap-index home-page">
<!-- END PAGE CLASSNAME -->
<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>

<section>
	<h1>Checkout</h1>
	<c:if test="${error }">
		<h3 style="color:red">Cart is empty!</h3>
	</c:if>
	<c:if test="${not error }">
		<form method="post" action="/cart/order">
			Ship to: <input type="text" name="shipto"/>
			<br>
			<button>Pay Now</button>
		</form>
	</c:if>
</section>

<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>