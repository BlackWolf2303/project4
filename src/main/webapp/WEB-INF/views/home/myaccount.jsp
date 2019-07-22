<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>

<section>
	
	<h3>My Account</h3>
	<s:form modelAttribute="account" action="/myaccount" method="post">
	
	<table border="1">
	
	<tr>
		<td>Avatar</td>
		<td><s:input path="avatar"/></td>
	</tr>
	<tr>
		<td>Fullname</td>
		<td><s:input path="fullname"/></td>
	</tr>
	<tr>
		<td>Gender</td>
		<td><s:input path="gender"/></td>
	</tr>
	<tr>
		<td>Birthday</td>
<%-- 		<td><input name="birthday" type="date" value="${account.birthday }"/></td> --%>
	</tr>
	<tr>
		<td>Phone</td>
		<td><s:input path="phone"/></td>
	</tr>
	<tr>
		<td>Address</td>
		<td><s:input path="address"/></td>
	</tr>
	<tr>
		<td></td>
		<td><s:button>Edit</s:button></td>
	</tr>
	
	</table>
	
	</s:form>
	
</section>

<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>