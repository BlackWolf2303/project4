<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<h3>EDIT PRODUCT</h3>
<s:form modelAttribute="product" action="/admin/product/edit" method="post">
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
	Picture
<%-- 	<c:forEach items="${product.images }" var="picture"> --%>
<!-- 		<img -->
<%-- 			src="${pageContext.request.contextPath}/resources/assets/images/product/${picture.name }" --%>
<!-- 			width="50px"> -->
<%-- 	</c:forEach> --%>
	<s:hidden path="id"/><br> 
	<input value="Submit" type="submit">
</s:form>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>