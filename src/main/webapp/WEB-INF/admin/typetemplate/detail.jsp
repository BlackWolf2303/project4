<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

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