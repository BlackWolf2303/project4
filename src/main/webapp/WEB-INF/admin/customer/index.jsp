<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>