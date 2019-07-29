<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<h3>ADD PRODUCT</h3>

<s:form modelAttribute="product" method="post"
	action="/admin/product/add">
	<table>
		<tr>
			<td>Name</td>
			<td><s:input path="name" /></td>
			<td><s:errors path="name" /></td>
		</tr>
		<tr>
			<td>Quantity</td>
			<td><s:input path="quantity" type="number" min="0" max="50"/></td>
			<td><s:errors path="quantity" /></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><s:input path="price" type="number" min="0" step="10000" max="1000000" value="0"/></td>
			<td><s:errors path="price" /></td>
		</tr>
		<tr>
			<td>Size</td>
			<td><a href="/admin/size/add">Add</a></td>
			<td>
<%-- 				<c:forEach var="size" items="${sizes}"><img src="${size}"/></c:forEach> --%>
			</td>
		</tr>
		<tr>
			<td>Color</td>
			<td><a href="/admin/color/add">Add</a></td>
			<td>
<%-- 				<s:form> --%>
				
<%-- 				</s:form> --%>
<%-- 				<c:forEach var="color" items="${colors}"><input name="color" value="${color}"/></c:forEach> --%>
			</td>
		</tr>
		<tr>
			<td>Image</td>
			<td><a href="/admin/image/add">Add</a></td>
			<td>
<%-- 				<c:forEach var="image" items="${images}"><img src="${image}"/></c:forEach> --%>
			</td>
		</tr>
		<tr>
			<td>Active</td>
			<td><s:checkbox path="active" /></td>
			<td><s:errors path="active" /></td>
		</tr>
		<tr>
			<td></td>
			<td><input value="Submit" type="submit"></td>
		</tr>
	</table>
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