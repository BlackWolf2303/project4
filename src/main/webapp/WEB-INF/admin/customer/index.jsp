<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<section>
	<div class="container-fluid">
		<header>
			<h1 class="h3 display">Customer Management</h1>
			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-header">
							<a href="/admin/customer/add">Add</a>
						</div>
						<table class="table">
							<thead>
								<tr>
									<td>Name</td>
									<td>Action</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="customer" items="${customers}">
									<tr>
										<td>${customer.username}</td>
										<td><a href="/admin/customer/delete/${customer.id}">Delete</a>
											| <a href="/admin/customer/profile/${customer.id}">Profile</a>
											<!-- 					|  --> <%-- 					<a href="/admin/customer/changerole/${customer.id}">Change Role</a> --%>
										</td>


										<%-- 					<a href="/admin/customer/changepassword/${customer.id}">Change Password</a> |  --%>
										<%-- 					<a href="/admin/customer/changeavatar/${customer.id}">Change Avatar</a> |  --%>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</header>
	</div>
</section>

<!-- DUC -->
<div class="container" style="margin-top: 20px;">
	<jsp:useBean id="pagedListHolder" scope="request"
		type="org.springframework.beans.support.PagedListHolder" />
	<c:url value="/admin/customer" var="pagedLink">
		<c:param name="page" value="~" />
	</c:url>

	<h1>Customer Management</h1>
	<a class="btn btn-primary" href="/admin/customer/add">Add</a> <select
		id="roles" onchange="setRoles()">
		<c:forEach items="${roles }" var="role">
			<option <c:if test="${param.role == role.name}"> selected </c:if>>${role.name }</option>
		</c:forEach>
	</select> <select id="property" onchange="setProperty()">
		<c:forEach items="${properties }" var="property">
			<option <c:if test="${param.prop == property}"> selected </c:if>>${property }</option>
		</c:forEach>
	</select> <select id="direction" onchange="setDirection()">
		<c:forEach items="${directions }" var="direction">
			<option <c:if test="${param.dir == direction}"> selected </c:if>>${direction }</option>
		</c:forEach>
	</select><br>
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
					href="/admin/customer/profile/${item.id}">Profile</a>
			</tr>
		</c:forEach>
	</table>
	<tg:paging pagedListHolder="${pagedListHolder}"
		pagedLink="${pagedLink}" />
</div>

<script type="text/javascript">
function setPageNo(pageno) {
	var currURL = document.URL;
	var url = new URL(currURL);
	var query_string = url.search;
	var search_params = new URLSearchParams(query_string);
	search_params.set("page", pageno);
	url.search = search_params.toString();
	var new_url = url.toString();
	window.location.replace(new_url);
}
function setProperty() {
	var property = document.getElementById("property").value;
	var currURL = document.URL;
	var url = new URL(currURL);
	var query_string = url.search;
	var search_params = new URLSearchParams(query_string);
	search_params.set("prop", property);
	url.search = search_params.toString();
	var new_url = url.toString();
	window.location.replace(new_url);
}
function setDirection() {
	var direction = document.getElementById("direction").value;
	var currURL = document.URL;
	var url = new URL(currURL);
	var query_string = url.search;
	var search_params = new URLSearchParams(query_string);
	search_params.set("dir", direction);
	url.search = search_params.toString();
	var new_url = url.toString();
	window.location.replace(new_url);
}
function setRoles() {
	var role = document.getElementById("roles").value;
	var currURL = document.URL;
	var url = new URL(currURL);
	var query_string = url.search;
	var search_params = new URLSearchParams(query_string);
	search_params.set("role", role);
	url.search = search_params.toString();
	var new_url = url.toString();
	window.location.replace(new_url);
}
</script>
<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>