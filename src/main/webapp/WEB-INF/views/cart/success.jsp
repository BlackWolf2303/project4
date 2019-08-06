<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/layouts/head-meta.jsp"></jsp:include>
<!-- PAGE CLASSNAME - NO CHANGE ORTHER OF THESE -->
<body class="bg-white">
	<div class="wrap wrap-index home-page">
<!-- END PAGE CLASSNAME -->
<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>
<section>
	<h3>SUCCESS</h3>
	<i>Your checkout successfull!</i>
	<br>
<!-- 	<table> -->
<!-- 	<tr> -->
<!-- 		<td>Order ID</td> -->
<!-- 		<td>Product Name</td> -->
<!-- 		<td>Price</td> -->
<!-- 		<td>Quantity</td> -->
<!-- 	</tr> -->
<%-- 	<c:forEach var="orderdetail" items="${orderdetails}"> --%>
<!-- 	<tr> -->
<%-- 		<td>${orderdetail.order.id}</td> --%>
<%-- 		<td>${orderdetail.product.name}</td> --%>
<%-- 		<td>${orderdetail.price}</td> --%>
<%-- 		<td>${orderdetail.quantity}</td> --%>
<%-- 		<td>${orderdetail.quantity}</td> --%>
<!-- 	</tr> -->
<%-- 	</c:forEach> --%>
<!-- 	</table> -->
	<a href="/">Continue Shopping</a>
</section>
<!-- End Content -->

<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>