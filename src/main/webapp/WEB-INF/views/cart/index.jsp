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


<section id="content" >

	<h3>Cart Page</h3>
	<s:form modelAttribute="items"
		action="${pageContext.request.contextPath }/cart/order">

		<table cellpadding="2" cellspacing="2" border="1" class="contact-page-info" >
			<tr>
				<th>Option</th>
				<th>Id</th>
				<th>Name</th>
				<th>Photo</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Sub Total</th>
			</tr>
			<c:set var="total" value="0"></c:set>
			<c:forEach var="item" items="${sessionScope.cart }">
				<c:set var="total" value="${total + item.product.price * item.quantity }"></c:set>
				<tr>
					<td align="center" ><a
						href="${pageContext.request.contextPath }/cart/remove/${item.product.id }"
						onclick="return confirm('Are you sure?')">Remove</a></td>
					<td>${item.product.id}</td>
					<td>${item.product.name}</td>
					<td><img src="${pageContext.request.contextPath }/resources/"
						width="50"></td>
					<td>${item.product.price}</td>
					<td>${item.quantity }</td>
					<td>${item.product.price * item.quantity }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="right">Sum</td>
				<td>${total}</td>
			</tr>
		</table>
		<security:authorize access="hasRole('ROLE_CUSTOMER')">
			<button>Checkout</button>
		</security:authorize>

	</s:form>
	
		<security:authorize access="!hasRole('ROLE_CUSTOMER')">
			<h3>You need <a href="/login">Login</a> to Checkout</h3>
		</security:authorize>
	<br>
	<a href="${pageContext.request.contextPath}/categories">Continue
		Shopping</a>
	<br>

</section>

<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>