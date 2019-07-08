<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

Product List
<c:forEach items="${products }" var="product">
<p>${product.name }</p>
</c:forEach>