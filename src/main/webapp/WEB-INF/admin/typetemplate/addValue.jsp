<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<h1>Add Value</h1>
<s:form modelAttribute="typeValue" action="/admin/typetemplate/detail/${typetemmplateid}/add" method="post">
	<table>
		<tr>
			<td>Name</td>
			<td><s:input path="name" /></td>
			<td><button>Add</button></td>
		</tr>
	</table>
</s:form>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>