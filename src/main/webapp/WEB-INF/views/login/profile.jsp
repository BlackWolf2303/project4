<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/layouts/head-meta.jsp"></jsp:include>
<!-- PAGE CLASSNAME - NO CHANGE ORTHER OF THESE -->
<body class="bg-white">
	<div class="wrap wrap-index home-page">
<!-- END PAGE CLASSNAME -->
<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>

<s:form action="/profile" method="POST"
	modelAttribute="account" enctype="multipart/form-data">
	<table>
		<c:if test="${not empty param.success}">Your profile has been updated successfully!</c:if>
		<tr>
			<td>Avatar:</td>
			<td><img src="${avatar}" width=50>
			<s:input path="file" type="file" /> | <a href="/profile/avatar/remove">Remove</a></td>
			<td><s:errors path="file"></s:errors></td>
		</tr>
		<tr>
			<td>Fullname</td>
			<td><s:input path="fullname" /></td>
			<td><s:errors path="gender"></s:errors></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td><s:select path="gender">
					<s:option value="0" label="Female" />
					<s:option value="1" label="Male" />
					<s:option value="2" label="Others" />
				</s:select></td>
			<td><s:errors path="gender"></s:errors></td>
		</tr>
		<tr>
			<td>Birthday</td>
			<td><s:input path="birthday" type="date" /></td>
			<td><s:errors path="birthday"></s:errors></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><s:input path="email" /></td>
			<td><s:errors path="email"></s:errors></td>
		</tr>
		<tr>
			<td>Phone</td>
			<td><s:input path="phone" /></td>
			<td><s:errors path="phone"></s:errors></td>
		</tr>
		<tr>
			<td>Address:</td>
			<td><s:input path="address" /></td>
			<td><s:errors path="address"></s:errors></td>
		</tr>
		<tr>
			<td colspan='2'><input type="submit" value="submit" /></td>
			<s:hidden path="id" />
		</tr>
	</table>
</s:form>

<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>