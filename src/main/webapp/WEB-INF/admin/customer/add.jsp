<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>
<section class="forms">
	<div class="container-fluid">

		<s:form action="/admin/customer/add" method="POST"
			modelAttribute="account" enctype="multipart/form-data">
			<table>
				<s:form action="/register" method="POST" modelAttribute="account"
					enctype="multipart/form-data" class="left">
					<div class="col-lg-6">
						<div class="card">
								<header>
									<h1 class="card-header d-flex align-items-center">Sign up</h1>
								</header>
								<div class="card-body">
								<form class="form-horizontal">
								<div class="form-group">
									<s:errors path="username" />
									<s:input path="username" placeholder="Username" class="form-control"/>
									</div>
									<div class="form-group">
									<s:errors path="email" />
									<s:input path="email" placeholder="E-mail"  class="form-control"/>
									</div>
									<div class="form-group">
									<s:errors path="password" />
									<s:password path="password" placeholder="Password"  class="form-control"/>
									</div>
									<div class="form-group">
									<s:errors path="passwordConfirm" />
									<s:password path="passwordConfirm"
										placeholder="Retype password"  class="form-control"/>
									</div>
									<input type="submit" name="signup_submit" value="Sign me up" class="btn btn-primary"/>
								</form>
							</div>
						</div>
					</div>
				</s:form>
			</table>
		</s:form>
	</div>
</section>
<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>