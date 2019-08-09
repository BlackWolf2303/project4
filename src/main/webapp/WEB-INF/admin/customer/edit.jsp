
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<section class="forms">
	<div class="container-fluid">
		<header>
			<h1 class="h3 display">Your profile is updated</h1>
		</header>

		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<form class="form-horizontal">
						<s:form action="/admin/customer/profile" method="POST"
							modelAttribute="account" enctype="multipart/form-data">
							<c:if test="${param.success}">Your profile is updated.</c:if>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Avatar:</label>
								<div class="col-sm-6">
									<s:input path="file" type="file" id="imgInp" />
									<c:if test="${avatar!='http://localhost:9596/file/image/'}">
										<img id="blah" src="${avatar}" width=50 alt="No Image"/>
									</c:if>
									<c:if test="${avatar=='http://localhost:9596/file/image/'}">
										<img id="blah" src="http://localhost:9596/file/image/defaultAva.jpg" width=50 alt="No Image"/>
 									</c:if> 
								</div>
								<div class="col-sm-4">
									| <a href="/admin/customer/remove/avatar/${id}">Remove</a>
									<s:errors path="file"></s:errors>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Fullname</label>
								<div class="col-sm-10">
									<s:input path="fullname" class="form-control" />
									<s:errors path="gender"></s:errors>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Gender</label>
								<div class="col-sm-10 mb-3">
									<s:select path="gender" class="form-control">
										<s:option value="0" label="Female" />
										<s:option value="1" label="Male" />
										<s:option value="2" label="Others" />
									</s:select>
								</div>
							</div>
							<div class="form-group row">
								<s:errors path="gender"></s:errors>

								<label class="col-sm-2 form-control-label">Birthday</label>
								<div class="col-sm-6 mb-3">
									<s:input path="birthday" type="date" />
									<s:errors path="birthday"></s:errors>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Email</label>
								<div class="col-sm-10 mb-3">
									<s:input path="email" class="form-control" />
									<s:errors path="email"></s:errors>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Phone</label>
								<div class="col-sm-10 mb-3">
									<s:input path="phone" class="form-control" />
									<s:errors path="phone"></s:errors>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Address:</label>
								<div class="col-sm-10 mb-3">
									<s:input path="address" class="form-control" />
									<s:errors path="address"></s:errors>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Role:</label>
								<div class="col-sm-10 mb-3">
									<s:checkboxes path="roles" items="${roless}" itemLabel="name"
										itemValue="id" class="form-control" />
									<s:errors path="roles"></s:errors>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-4 offset-sm-2">
									<input type="submit" value="submit" class="btn btn-primary" />
									<s:hidden path="id" />
								</div>
							</div>
							<%-- 	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
						</s:form>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>
<script>
	function readURL(input) {
		var elem = $(input);
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				elem.next('img').attr('src', e.target.result);
			}
			reader.readAsDataURL(elem.get(0).files[0]);
		}
	}

	$("input[type='file']").change(function() {
		readURL(this);
	});
</script>