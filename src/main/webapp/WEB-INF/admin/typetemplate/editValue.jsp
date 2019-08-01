<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<h1>Edit Value</h1>
<s:form modelAttribute="typeValue" action="/admin/typetemplate/detail/${typetemmplateid}/edit" method="post">
	<table>
		<tr>
			<td>Name</td>
			<td><s:input path="name" /></td>
			<s:hidden path="id"/>
			<td><button>Edit</button></td>
		</tr>
	</table>
</s:form>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>