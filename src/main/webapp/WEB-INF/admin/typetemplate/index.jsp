<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<h1>Type Template Manager</h1>
<a href="/admin/typetemplate/add">Add New</a>
<form action="admin/typetemplate" method="post">
	<table>
		<tr>
			<th>Name</th>
			<th>Active</th>
			<th>Action</th>
		</tr>
		<c:forEach var="typeTemplate" items="${typeTemplates}">
			<tr>
				<td>${typeTemplate.name}</td>
				<td><input type="checkbox" name="active"
					value="${typeTemplate.active}"><input type="hidden"
					name="id" value="${typeTemplate.id}" /></td>
				<td><a href="/admin/typetemplate/detail/${typeTemplate.id}">Detail</a> | 
					<a href="/admin/typetemplate/edit/${typeTemplate.id}">Edit</a> | 
					<a href="/admin/typetemplate/delete/${typeTemplate.id}">Delete</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td><button>Save</button></td>
		</tr>
	</table>
</form>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>