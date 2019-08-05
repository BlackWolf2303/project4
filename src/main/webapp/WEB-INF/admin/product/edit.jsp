<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<h3>EDIT PRODUCT</h3>
<s:form modelAttribute="product" action="/admin/product/edit" method="post" enctype="multipart/form-data">
	Name <s:input path="name" /> <br> 
	Quantity <s:input path="quantity"/><br> 
	Price <s:input path="price"/><br> 
	Type Template 1
	<s:select path="typeTemplate1">
		<s:options path="id" items="${typeTemplates}" itemLabel="name"
			itemValue="id" />
	</s:select><br> 
	Type Template 2
	<s:select path="typeTemplate2">
		<s:options path="id" items="${typeTemplates}" itemLabel="name"
			itemValue="id" />
	</s:select><br> 
	Picture:<br>
		<img src="${product.images[0].name }" width=50 alt="No Image">
		<s:input path="file" type="file" /> | <a href="/admin/product/remove/avatar/${id}">Remove</a><br>
		<img src="${product.images[1] }" width=50 alt="No Image">
		<s:input path="file" type="file" /> | <a href="/admin/product/remove/avatar/${id}">Remove</a><br>
		<img src="${product.images[2] }" width=50 alt="No Image">
		<s:input path="file" type="file" /> | <a href="/admin/product/remove/avatar/${id}">Remove</a><br>
		<img src="${product.images[3] }" width=50 alt="No Image">
		<s:input path="file" type="file" /> | <a href="/admin/product/remove/avatar/${id}">Remove</a><br>
		<img src="${product.images[4] }" width=50 alt="No Image">
		<s:input path="file" type="file" /> | <a href="/admin/product/remove/avatar/${id}">Remove</a><br>
		<img src="${product.images[5] }" width=50 alt="No Image">
		<s:input path="file" type="file" /> | <a href="/admin/product/remove/avatar/${id}">Remove</a><br>
		<img src="${product.images[6] }" width=50 alt="No Image">
		<s:input path="file" type="file" /> | <a href="/admin/product/remove/avatar/${id}">Remove</a><br>
		<img src="${product.images[7].name }" width=50 alt="No Image">
		<s:input path="file" type="file" /> | <a href="/admin/product/remove/avatar/${id}">Remove</a><br>
	<s:hidden path="id"/><br> 
	<input value="Submit" type="submit">
</s:form>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>