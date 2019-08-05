<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<section>
	<div class="container-fluid">
		<header>
			<h1 class="h3 display">Product List</h1>
			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-header">
							<a href="product/add">ADD</a>
						</div>
						<div class="card-body">
						<div class="table-responsive">
						<table class="table">
							<tr>
								<th>Avatar</th>
								<th>Name</th>
								<th>Type Template 1</th>
								<th>Type Template 2</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Action</th>
							</tr>
							<c:forEach var="product" items="${products }">
								<tr>
									<td><a href="product/edit/${product.id }"> <img
											src="${picture0 }"
											width="50px">
									</a></td>
									<td><a href="product/edit/${product.id }"> ${product.name }
									</a></td>
									<td>${product.typeTemplate1.name }</td>
									<td>${product.typeTemplate2.name }</td>
									<td>${product.quantity }</td>
									<td>${product.price }</td>
									<td><a href="product/edit/${product.id }">Edit</a> <a
										href="product/delete/${product.id }">Delete</a></td>

								</tr>
							</c:forEach>
						</table>
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>
</section>
<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>