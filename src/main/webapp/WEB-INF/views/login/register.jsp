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

<div id="login-box">
  <s:form action="/register" method="POST"
	modelAttribute="account" enctype="multipart/form-data" class="left">
    <h1>Sign up</h1>
    
    <s:errors path="username"/>
    <s:input path="username" placeholder="Username" />
    <s:errors path="email"/>
    <s:input path="email" placeholder="E-mail" />
    <s:errors path="password"/>
    <s:password path="password" placeholder="Password" />
    <s:errors path="passwordConfirm"/>
    <s:password path="passwordConfirm" placeholder="Retype password" />
    
    <input type="submit" name="signup_submit" value="Sign me up" />
  </s:form>
  
  <div class="right">
    <span class="loginwith">Sign in with<br />social network</span>
      <!-- The surrounding HTML is left untouched by FirebaseUI.
    Your app may use that space for branding, controls and other customizations.-->
	<div id="firebaseui-auth-container"></div>
	<div id="loader">Loading...</div>
   <!-- <button class="social-signin facebook">Log in with facebook</button>
    <button class="social-signin twitter">Log in with Twitter</button>
    <button class="social-signin google">Log in with Google+</button> -->
  </div>
  <div class="or">OR</div>

</div>

<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>