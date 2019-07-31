<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<h1>Value Template Manager</h1>
<a href="/admin/typetemplate/detail/${typetemmplateid}/add">Add New</a>
<form action="/admin/typetemplate/detail/add" method="post">
	<table>
		<tr>
			<th>Name</th>
			<th>Action</th>
		</tr>
		<c:forEach var="typeValue" items="${typeValues}">
			<tr>
				<td>${typeValue.name}</td>
				<td><a href="/admin/typetemplate/detail/${typetemmplateid}/edit/${typeValue.id}">Edit</a>
					| <a href="/admin/typetemplate/detail/${typetemmplateid}/delete/${typeValue.id}">Delete</a></td>
			</tr>
		</c:forEach>
		<tr>
<%-- 			<input type="hidden" name="typetemmplateid" value="${typetemmplateid}" />			 --%>
			<td><button>Save</button></td>
		</tr>
	</table>
</form>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>