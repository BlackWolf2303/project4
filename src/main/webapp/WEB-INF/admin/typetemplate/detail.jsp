<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<<<<<<< HEAD
<section class="forms">
	<div class="container-fluid">
		<header>
			<h1 class="h3 display">Value Template Manager</h1>
		</header>
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<a href="/admin/typetemplate/detail/${typetemmplateid}/add">Add
								New</a>
							<form action="/admin/typetemplate/detail/add" method="post">
								<table class="table">
									<thead>
									<tr>
										<th>Name</th>
										<th>Action</th>
									</tr>
									</thead>
									<c:forEach var="typeValue" items="${typeValues}">
										<tr>
											<td>${typeValue.name}</td>
											<td><a
												href="/admin/typetemplate/detail/${typetemmplateid}/edit/${typeValue.id}">Edit</a>
												| <a
												href="/admin/typetemplate/detail/${typetemmplateid}/delete/${typeValue.id}">Delete</a></td>
										</tr>
									</c:forEach>
									
								</table>
								<div class="form-group">
									
										<%-- 			<input type="hidden" name="typetemmplateid" value="${typetemmplateid}" />			 --%>
										<button class="btn btn-primary">Save</button>
									</div>
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>
=======
<h1>Value Template Manager</h1>
<a href="/admin/typetemplate/detail/${typetemmplateid}/add">Add New</a>
<form action="/admin/typetemplate/detail/add" method="post">
	<jsp:useBean id="pagedListHolder" scope="request"
		type="org.springframework.beans.support.PagedListHolder" />
	<c:url value="/admin/customer" var="pagedLink">
		<c:param name="page" value="~" />
	</c:url>
	Sort: <select id="direction" onchange="setDirection()">
		<c:forEach items="${directions }" var="direction">
			<option <c:if test="${param.dir == direction}"> selected </c:if>>${direction }</option>
		</c:forEach>
		</select>
		<table>
			<tr>
				<th>Name</th>
				<th>Action</th>
			</tr>
			<c:forEach items="${pagedListHolder.pageList}" var="typeValue">
				<tr>
					<td>${typeValue.name}</td>
					<td><a
						href="/admin/typetemplate/detail/${typetemmplateid}/edit/${typeValue.id}">Edit</a>
						| <a
						href="/admin/typetemplate/detail/${typetemmplateid}/delete/${typeValue.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
		<tg:paging pagedListHolder="${pagedListHolder}"
			pagedLink="${pagedLink}" />
</form>

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
>>>>>>> b80ecbc0a7980b5461df79996fb0d402717406d9
