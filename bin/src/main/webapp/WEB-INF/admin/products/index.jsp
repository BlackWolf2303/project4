<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

Product List
<a href="products/add">ADD</a>
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
    	<a href="products/${product.id }">
    	<img src="${pageContext.request.contextPath}/resources/assets/images/product/${product.images[0].name }" width="50px">
    	</a>
    </td>
    <td>
	    <a href="products/${product.id }">
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
    	<a href="products/edit/${product.id }">Edit</a>
    	<a href="products/delete/${product.id }">Delete</a>
    </td>
    
  </tr>
  </c:forEach>
</table>

