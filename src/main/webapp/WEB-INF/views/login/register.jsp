<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/layouts/head-meta.jsp"></jsp:include>
<!-- PAGE CLASSNAME - NO CHANGE ORTHER OF THESE -->
<body class="bg-white">
	<div class="wrap wrap-index register-page">
<!-- END PAGE CLASSNAME -->
<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>

<!-- <s:form action="/register" method="POST"
	modelAttribute="account" enctype="multipart/form-data">
	<table>
		<tr>
			<td>Avatar:</td>
			<td><img src="${avatar}" width=50><s:input path="file" type="file" /></td>
			<td><s:errors path="file"></s:errors></td>
		</tr>
		<tr>
			<td>UserName:</td>
			<td><s:input path="username" /></td>
			<td><s:errors path="username"></s:errors></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><s:password path="password" /></td>
			<td><s:errors path="password"></s:errors></td>
		</tr>
		<tr>
			<td>Confirm Password:</td>
			<td><s:password path="passwordConfirm" /></td>
			<td><s:errors path="passwordConfirm"></s:errors></td>
		</tr>
		<tr>
			<td>Fullname</td>
			<td><s:input path="fullname" /></td>
			<td><s:errors path="gender"></s:errors></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td><s:select path="gender">
					<s:option value="0" label="Female" />
					<s:option value="1" label="Male" />
					<s:option value="2" label="Others" />
				</s:select></td>
			<td><s:errors path="gender"></s:errors></td>
		</tr>
		<tr>
			<td>Birthday</td>
			<td><s:input path="birthday" type="date" /></td>
			<td><s:errors path="birthday"></s:errors></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><s:input path="email" /></td>
			<td><s:errors path="email"></s:errors></td>
		</tr>
		<tr>
			<td>Phone</td>
			<td><s:input path="phone" /></td>
			<td><s:errors path="phone"></s:errors></td>
		</tr>
		<tr>
			<td>Address:</td>
			<td><s:input path="address" /></td>
			<td><s:errors path="address"></s:errors></td>
		</tr>
		<tr>
			<td colspan='2'><input type="submit" value="submit" /></td>
		</tr>
	</table>
	<%--         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
</s:form> -->

<div id="login-box">
  <div class="left">
    <h1>Sign up</h1>
    
    <input type="text" name="username" placeholder="Username" />
    <input type="text" name="email" placeholder="E-mail" />
    <input type="password" name="password" placeholder="Password" />
    <input type="password" name="password2" placeholder="Retype password" />
    
    <input type="submit" name="signup_submit" value="Sign me up" />
  </div>
  
  <div class="right">
    <span class="loginwith">Sign in with<br />social network</span>
    
    <button class="social-signin facebook">Log in with facebook</button>
    <button class="social-signin twitter">Log in with Twitter</button>
    <button class="social-signin google">Log in with Google+</button>
  </div>
  <div class="or">OR</div>
</div>

<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>