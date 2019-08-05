<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<h3>EDIT PRODUCT</h3>
<s:form modelAttribute="product" action="/admin/product/add" method="post" enctype="multipart/form-data">
	Name <s:input path="name" /> 
	<s:errors path="name"/><br> 
	Quantity <s:input path="quantity"/>
	<s:errors path="quantity"/><br> 
	Price <s:input path="price"/>
	<s:errors path="price"/><br> 
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
	<s:errors path="file"/><br>
	Picture 1:
		<img src="${picture0}" width=50 alt="No Image">
		<s:input path="file" type="file" /><br> 
	Picture 2:
		<img src="${picture1 }" width=50 alt="No Image">
		<s:input path="file" type="file" /><br> 
	Picture 3:
		<img src="${picture2 }" width=50 alt="No Image">
		<s:input path="file" type="file" /><br> 
	Picture 4:
		<img src="${picture3 }" width=50 alt="No Image">
		<s:input path="file" type="file" /><br> 
	Picture 5;
		<img src="${picture4}" width=50 alt="No Image">
		<s:input path="file" type="file" /><br> 
	Picture 6:
		<img src="${picture5}" width=50 alt="No Image">
		<s:input path="file" type="file" /><br> 
	Picture 7:
		<img src="${picture6}" width=50 alt="No Image">
		<s:input path="file" type="file" /><br> 
	Picture 8:
		<img src="${picture7}" width=50 alt="No Image">
		<s:input path="file" type="file" /><br>
	<input value="Submit" type="submit">
	<a href="/admin/product">Back</a>
</s:form>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>