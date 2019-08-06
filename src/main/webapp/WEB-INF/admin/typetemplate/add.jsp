<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<section class="forms">
	<div class="container-fluid">
		<header>
			<h1 class="h3 display">Add Template</h1>
		</header>
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<form class="form-horizontal">
							<s:form modelAttribute="typeTemplate"
								action="/admin/typetemplate/add" method="post">
								<div class="form-group">
									<label>Name</label>
									<s:input path="name" class="form-control" />
								</div>
								<div class="form-group">
									<label>Caption</label>
									<s:input path="caption" class="form-control" />
								</div>
								<div class="form-group">
									<button class="btn btn-primary">Add</button>
								</div>
							</s:form>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>