<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>SUCCESS</h3>
	<table>
	<tr>
		<td>Order ID</td>
		<td>Product Name</td>
		<td>Price</td>
		<td>Quantity</td>
	</tr>
	<c:forEach var="orderdetail" items="${orderdetails}">	
	<tr>
		<td>${orderdetail.order.id}</td>
		<td>${orderdetail.product.name}</td>
		<td>${orderdetail.price}</td>
		<td>${orderdetail.quantity}</td>
	</tr>
	</c:forEach>
	</table>
	<a href="/">Back to Cart</a>
</body>
</html>