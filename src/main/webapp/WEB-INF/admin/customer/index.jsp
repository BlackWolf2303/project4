<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<div class="container" style="margin-top: 20px;">
	<jsp:useBean id="pagedListHolder" scope="request"
		type="org.springframework.beans.support.PagedListHolder" />
	<c:url value="/admin/customer" var="pagedLink">
		<c:param name="page" value="~" />
	</c:url>

	<h1>Customer Management</h1>
	<a class="btn btn-primary" href="/admin/customer/add">Add</a>  <br>
	<tg:paging pagedListHolder="${pagedListHolder}"
		pagedLink="${pagedLink}" />
	<table class="table table-bordered">
		<tr>
			<th width="100">ID</th>
			<th width="100">Username</th>
			<th>Action</th>
		</tr>
		<c:forEach items="${pagedListHolder.pageList}" var="item">
			<tr>
				<td>${item.id}</td>
				<td>${item.username}</td>
				<td><a href="/admin/customer/delete/${item.id}">Delete</a> | <a
					href="/admin/customer/profile/${customer.id}">Profile</a>
			</tr>
		</c:forEach>
	</table>
	<tg:paging pagedListHolder="${pagedListHolder}"
		pagedLink="${pagedLink}" />
</div>


<!-- <section> -->
<!-- 	<h1>Customer Management</h1> -->
<!-- 	<a href="/admin/customer/add">Add</a> -->
<!-- 	<table border="1"> -->
<!-- 		<thead> -->
<!-- 			<tr> -->
<!-- 				<td>Name</td> -->
<!-- 				<td>Action</td> -->
<!-- 			</tr> -->
<!-- 		</thead> -->
<!-- 		<tbody> -->
<%-- 			<c:forEach var="customer" items="${customers.getContent()}"> --%>
<!-- 				<tr> -->
<%-- 					<td>${customer.username}</td> --%>
<%-- 					<td><a href="/admin/customer/delete/${customer.id}">Delete</a> --%>
<%-- 						| <a href="/admin/customer/profile/${customer.id}">Profile</a> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</tbody> -->
<!-- 	</table> -->
<%-- 	<c:when test="${customers.hasNext() }"> --%>
<!-- 		<button onclick="setPageNo();">gg</button> -->
<%-- 	</c:when> --%>
<!-- 	<a href=""></a> -->
<!-- </section> -->
<!-- <script type="text/javascript"> -->
<!-- // 	function setPageNo(pageno) { -->
<!-- // 		var currURL = document.URL; -->
<!-- // 		var url = new URL(currURL); -->
<!-- // 		var query_string = url.search; -->
<!-- // 		var search_params = new URLSearchParams(query_string); -->
<!-- // 		search_params.set('pageNo', pageno); -->
<!-- // 		url.search = search_params.toString(); -->
<!-- // 		var new_url = url.toString(); -->
<!-- // 		location.replace(new_url); -->
<!-- // 	} -->
<!-- </script> -->

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>