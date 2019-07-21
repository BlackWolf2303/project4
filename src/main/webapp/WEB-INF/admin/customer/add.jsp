<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

	<s:form action="/admin/customer/add" method="POST" modelAttribute="account" >
		<table>
			<tr>
				<td>UserName:</td>
				<td><s:input path="username"/></td>
				<td><s:errors path="username"></s:errors></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><s:password path="password"/></td>
				<td><s:errors path="password"></s:errors></td>
			</tr>
			<tr>
				<td>Confirm Password:</td>
				<td><s:password path="passwordConfirm"/></td>
				<td><s:errors path="passwordConfirm"></s:errors></td>
			</tr>
			<tr>
				<td colspan='2'><input type="submit"
					value="submit" /></td>
			</tr>
		</table>
		<%--         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
	</s:form>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>