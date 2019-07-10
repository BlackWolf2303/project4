<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DETAIL</title>
</head>
<body>
	<h3>ADD PRODUCT</h3>
	<form name="product" action="" method="post">
		Name <input type="text" name="name" value= " ${product.name }"> <br>
		Price <input type="text" name="price" value = " ${product.price }"><br>
		Quantity <input type="text" name="quantity" value = " ${product.quantity }"><br>
		Color <c:forEach items="${product.colors}" var="color"><input type="radio" name="color" value = " ${color.name }"></c:forEach><br>
		Size <c:if test="${ product.freeSize }">Free Size</c:if> 
		<c:if test="${ !product.freeSize }">
		<c:forEach items="${product.sizes }" var="size">
				<input type="radio" name="size" value=" ${ size.name }">
		</c:forEach>
		</c:if> <br>
		Picture <c:forEach items="${product.images }" var="picture"><img src="${pageContext.request.contextPath}/resources/assets/images/product/${picture.name }" width="50px"></c:forEach>
	<input value="Submit" type="submit">
	</form>
	
</body>
</html>