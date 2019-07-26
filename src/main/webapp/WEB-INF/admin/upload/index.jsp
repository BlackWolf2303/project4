<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="POST"  enctype="multipart/form-data" action="/admin/products/upload">
		<table>
			<tr><td>File to upload:</td><td><input type="file" name="files" multiple="multiple" /></td></tr>
			<tr><td></td><td><input type="submit" value="Upload" /></td></tr>
		</table>
	</form>
	<div>
		<ul>
			<c:forEach var="file" items="${files }">
			<li><img src="${file }"/></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>