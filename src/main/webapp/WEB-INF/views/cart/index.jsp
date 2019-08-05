<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>


<jsp:include page="/WEB-INF/layouts/head-meta.jsp"></jsp:include>
<!-- PAGE CLASSNAME - NO CHANGE ORTHER OF THESE -->
<body class="bg-white">
	<div class="wrap wrap-index checkout-page">
		<!-- END PAGE CLASSNAME -->
		<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>


		<section id="content">

			<h4 class="text-center text-success">SHOPPING CART</h4>
			<s:form name="CartForm" modelAttribute="items"
				action="${pageContext.request.contextPath }/cart/order">

				<table cellpadding="2" cellspacing="2" border="1"
					class="contact-page-info table  table-hover">
					<thead class="thead-light">
					<tr>
						<th scope="col">Option</th>
						<th scope="col">Id</th>
						<th scope="col">Name</th>
						<th scope="col">Photo</th>
						<th scope="col">Price</th>
						<th scope="col">Quantity</th>
						<th scope="col">Sub Total</th>
					</tr>
					</thead>
					<c:set var="total" value="0"></c:set>
					<c:forEach var="item" items="${sessionScope.cart }" varStatus="i">
						<c:set var="total"
							value="${total + item.product.price * item.quantity }"></c:set>
						<tr>
							<td align="center"><a
								href="${pageContext.request.contextPath }/cart/remove/${item.product.id }"
								onclick="return confirm('Are you sure?')">Remove</a></td>
							<td>${item.product.id}</td>
							<td>${item.product.name}</td>
							<td><img
								src="${pageContext.request.contextPath }/resources/" width="50"></td>
							<td>${item.product.price}</td>
							<td>${item.quantity }</td>
							<td>${item.product.price * item.quantity }</td>


							<input type="hidden" name="item_number_${i.index + 1 }"
								value="${item.product.id }">
							<input type="hidden" name="item_name_${i.index + 1 }"
								value="${item.product.name }">
							<input type="hidden" name="amount_${i.index + 1 }"
								value="${item.product.price }">
							<input type="hidden" name="quantity_${i.index + 1 }"
								value="${item.quantity }">
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6" align="right">Sum</td>
						<td>${total}</td>
					</tr>
				</table>
				<!-- PayPal Setting -->
				<input type="hidden" name="upload" value="1" />
				<input type="hidden" name="return"
					value="${payPalConfig.returnurl }" />
				<input type="hidden" name="cmd" value="_cart" />
				<input type="hidden" name="business"
					value="${payPalConfig.business}" />
				<security:authorize access="hasRole('ROLE_CUSTOMER')">
					<input type="button" value="Checkout" onclick="OnButtonCheckout();">
					<input type="image" onclick="OnButtonPaypal();"
						src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif">
				</security:authorize>
				<security:authorize access="!hasRole('ROLE_CUSTOMER')">
					<h3>
						You need <a href="/login">Login</a> to Checkout
					</h3>
				</security:authorize>
				<br>

			</s:form>

			<a class="btn btn-success text-uppercase" href="${pageContext.request.contextPath}/categories">Continue
				Shopping</a> <br>
		</section>
		<script>
			function OnButtonCheckout() {
				document.CartForm.action = "${pageContext.request.contextPath }/cart/order"
				document.CartForm.submit();
				return true;
			}

			function OnButtonPaypal() {
				document.CartForm.action = "${payPalConfig.posturl}"
				document.CartForm.target = "_blank";
				document.CartForm.submit();
				return true;
			}
		</script>
		<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>