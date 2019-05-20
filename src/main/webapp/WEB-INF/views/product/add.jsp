<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h3>Add product</h3>

	<s:form method="post" modelAttribute="product" action="${pageContext.request.contextPath }/product/add">
		<table>
			<tr>
				<td>Name</td>
				<td><s:input path="name" /></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><s:input path="price" /></td>
			</tr>
			<tr>
				<td>Quantity</td>
				<td><s:input path="quantity" /></td>
			</tr>
			<tr>
				<td>Status</td>
				<td><s:checkbox path="status" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<s:hidden value="1" path="category.id"/>
				<td><input type="submit" value="Save" /></td>
			</tr>
		</table>
	</s:form>
</body>
</html>