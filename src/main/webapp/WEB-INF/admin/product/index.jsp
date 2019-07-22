<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

Product List
<a href="product/add">ADD</a>
<table>
  <tr>
    <th>Avatar</th>
    <th>Name</th>
    <th>Quantity</th>
    <th>Price</th>
    <th>Action</th>
  </tr>
  <c:forEach items="${products }" var="product">
  <tr>
    <td>
    	<a href="product/${product.id }">
    	<img src="${pageContext.request.contextPath}/resources/assets/${product.images[0].name }" width="50px">
    	</a>
    </td>
    <td>
	    <a href="product/${product.id }">
	    	${product.name }
	    </a>
    </td>
    <td>
    	${product.quantity }
    </td>
    <td>
	    ${product.price }
    </td>
    <td>
    	<a href="product/edit/${product.id }">Edit</a>
    	<a href="product/delete/${product.id }">Delete</a>
    </td>
    
  </tr>
  </c:forEach>
</table>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>