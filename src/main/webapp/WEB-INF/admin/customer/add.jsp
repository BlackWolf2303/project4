<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<s:form action="/admin/customer/add" method="POST"
	modelAttribute="account" enctype="multipart/form-data">
	<table>
		<s:form action="/register" method="POST" modelAttribute="account"
			enctype="multipart/form-data" class="left">
			<h1>Sign up</h1>

			<s:errors path="username" />
			<s:input path="username" placeholder="Username" />
			<s:errors path="email" />
			<s:input path="email" placeholder="E-mail" />
			<s:errors path="password" />
			<s:password path="password" placeholder="Password" />
			<s:errors path="passwordConfirm" />
			<s:password path="passwordConfirm" placeholder="Retype password" />

			<input type="submit" name="signup_submit" value="Sign me up" />
		</s:form>
	</table>
</s:form>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>