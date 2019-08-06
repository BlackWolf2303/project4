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
			<h1 class="h3 display">Type Template List</h1>
		</header>
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-header">
						<a href="/admin/typetemplate/add">Add New</a>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<jsp:useBean id="pagedListHolder" scope="request"
								type="org.springframework.beans.support.PagedListHolder" />
							<c:url value="/admin/customer" var="pagedLink">
								<c:param name="page" value="~" />
							</c:url>

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
							<form action="admin/typetemplate" method="post">

								<table class="table">
									<tr>
										<th>Name</th>
										<th>Caption</th>
										<th>Active</th>
										<th>Action</th>
									</tr>
									<c:forEach items="${pagedListHolder.pageList}"
										var="typeTemplate">
										<tr>
											<td>${typeTemplate.name}</td>
											<td>${typeTemplate.caption}</td>
											<td><input type="checkbox" name="active"
												value="${typeTemplate.active}"></td>
											<td><a
												href="/admin/typetemplate/detail/${typeTemplate.id}">Detail</a>
												| <a href="/admin/typetemplate/edit/${typeTemplate.id}">Edit</a>
												| <a href="/admin/typetemplate/delete/${typeTemplate.id}">Delete</a>
											</td>
										</tr>
									</c:forEach>
								</table>

								<tg:paging pagedListHolder="${pagedListHolder}"
									pagedLink="${pagedLink}" />
								<input type="hidden" name="id" value="${typeTemplate.id}" />
								<td><button class="btn btn-success">Save</button></td>
							</form>
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