<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<section>
	<div class="container-fluid">
		<header>
			<h1 class="h3 display">Product List</h1>
		</header>
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<a class="btn btn-success col-1" href="product/add">ADD</a>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<jsp:useBean id="pagedListHolder" scope="request"
								type="org.springframework.beans.support.PagedListHolder" />
							<c:url value="/admin/customer" var="pagedLink">
								<c:param name="page" value="~" />
							</c:url>
							<div class="col-lg-4 table">
							Sort: <select id="property" onchange="setProperty()">
								<c:forEach items="${properties }" var="property">
									<option
										<c:if test="${param.prop == property}"> selected </c:if>>${property }</option>
								</c:forEach>
							</select> By: <select id="direction" onchange="setDirection()">
								<c:forEach items="${directions }" var="direction">
									<option
										<c:if test="${param.dir == direction}"> selected </c:if>>${direction }</option>
								</c:forEach>
							</select>
							</div>
							<table class="table">
								<tr>
									<th>Avatar</th>
									<th>Name</th>
									<th>Type Template 1</th>
									<th>Type Template 2</th>
									<th>Quantity</th>
									<th>Price</th>
									<th>Active</th>
									<th>Action</th>
								</tr>
								<c:forEach items="${pagedListHolder.pageList}" var="product">
									<tr>
										<td><a href="product/edit/${product.id }"> <img
												src="http://localhost:9596/file/image/picture0${product.id}.jpg"
												width="50px">
										</a></td>
										<td><a href="product/edit/${product.id }">
												${product.name } </a></td>
										<td>${product.typeTemplate1.name }</td>
										<td>${product.typeTemplate2.name }</td>
										<td>${product.quantity }</td>
										<td>${product.price }</td>
										<td>${product.active }</td>
										<td><a href="product/edit/${product.id }">Edit</a> <a
											href="product/delete/${product.id }">Delete</a></td>

									</tr>
								</c:forEach>
							</table>
							<tg:paging pagedListHolder="${pagedListHolder}"
								pagedLink="${pagedLink}" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>
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

	
</script>