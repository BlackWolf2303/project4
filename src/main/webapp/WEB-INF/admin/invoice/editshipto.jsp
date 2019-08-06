<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<section>

	<h1>Edit Order</h1>
	
	<s:form action="/admin/invoice/editshipto" modelAttribute="order" method="post">
	<table border="1">
		<tbody>
			<tr>
				<td>Ship To</td>
				<td><s:input path="shipto"/></td>
			</tr>
			<tr>
				<td></td>
				<s:hidden path="id"/>
				<td><s:button>Edit</s:button></td>
			</tr>
		</tbody>
	</table>
	
	</s:form>
</section>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>