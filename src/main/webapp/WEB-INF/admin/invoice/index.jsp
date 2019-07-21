<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<section>

	<h1>Invoice Management</h1>
	<table border="1">
		<thead>
			<tr>
				<td>ID</td>
				<td>Name</td>
				<td>Action</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="order" items="${orders}">
			<tr>
				<td>${order.id}</td>
				<td>${order.account.username}</td>
				<td><a href="/admin/invoice/detail/${order.id}">Details</a>|<a href="/admin/invoice/edit/${order.id}">Edit</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</section>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>