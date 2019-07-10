<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Product list</h3>
	<a href="${pageContext.request.contextPath }/product/add">Add</a>
	<table border="1">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>category</th>
			<th>Status</th>
			<th>Action</th>
		</tr>
		<c:forEach var="p" items="${products }">
			<tr>
				<td>${p.id }</td>
				<td>${p.username }</td>
				<td>${p.price }</td>
				<td>${p.quantity }</td>
				<td>${p.getCategory().id }</td>
				<td>${p.status }</td>
				<td>
					<a href="${pageContext.request.contextPath }/product/edit/${p.id}">Edit</a> 
					| 
					<a href="${pageContext.request.contextPath }/product/delete/${p.id}"
						onclick="return confirm('Are you sure?')">Delete</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>