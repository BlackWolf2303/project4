<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

	<h3>ADD PRODUCT</h3>
	
	<s:form modelAttribute="product" method="post" action="/admin/product/add">
		<s:input path="name" />
		<s:errors path="name" /><br>
		<s:input path="price" type="number"/>
		<s:errors path="price" /><br>
		<s:input path="quantity" type="number"/>
		<s:errors path="quantity" /><br>
		<input value="Submit" type="submit">
	</s:form>
<!-- 	<form name="product" action="/admin/product/add" method="post"> -->
<%-- 		Name <input type="text" name="name" value= " ${product.name }"> <br> --%>
<%-- 		Price <input type="text" name="price" value = " ${product.price }"><br> --%>
<%-- 		Quantity <input type="text" name="quantity" value = " ${product.quantity }"><br> --%>
<%-- 		Color <c:forEach items="${product.colors}" var="color"><input type="radio" name="color" value = " ${color.name }"></c:forEach><br> --%>
<%-- 		Size <c:if test="${ product.freeSize }">Free Size</c:if>  --%>
<%-- 		<c:if test="${ !product.freeSize }"> --%>
<%-- 		<c:forEach items="${product.sizes }" var="size"> --%>
<%-- 				<input type="radio" name="size" value=" ${ size.name }"> --%>
<%-- 		</c:forEach> --%>
<%-- 		</c:if> <br> --%>
<%-- 		Picture <c:forEach items="${product.images }" var="picture"><img src="${pageContext.request.contextPath}/resources/assets/images/product/${picture.name }" width="50px"></c:forEach> --%>
<!-- 	<input value="Submit" type="submit"> -->
<!-- 	</form> -->
	
<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>