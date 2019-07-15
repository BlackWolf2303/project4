<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>

 <body>
    <div class="page login-page">
      <div class="container">
        <div class="form-outer text-center d-flex align-items-center">
          <div class="form-inner">
            <div class="logo text-uppercase"><span>Project4 &nbsp;</span><strong class="text-primary">Amin</strong></div>
            <p>Đăng nhập và quản lý tài khoản, điều chỉnh thông tin, tra cứu và quản lý hàng hóa và doanh số bán hàng </p>
            <form method="get" class="text-left form-validate">
              <div class="form-group-material">
                <input id="login-username" type="text" name="loginUsername" required data-msg="Please enter your username" class="input-material">
                <label for="login-username" class="label-material">Username</label>
              </div>
              <div class="form-group-material">
                <input id="login-password" type="password" name="loginPassword" required data-msg="Please enter your password" class="input-material">
                <label for="login-password" class="label-material">Password</label>
              </div>
              <div class="form-group text-center"><a id="login" href="index.html" class="btn btn-primary">Login</a>
                <!-- This should be submit button but I replaced it with <a> for demo purposes-->
              </div>
            </form><a href="#" class="forgot-pass">Forgot Password?</a><small>Do not have an account? </small><a href="register.html" class="signup">Signup</a>
          </div>
          <div class="copyrights text-center">
            <p>Design by <a href="https://aptechvietnam.com.vn/" class="external">C1611L class</a></p>
            <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
          </div>
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="${pageContext.request.contextPath}/resources/admin-assets/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin-assets/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="${pageContext.request.contextPath}/resources/admin-assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin-assets/js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin-assets/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="${pageContext.request.contextPath}/resources/admin-assets/vendor/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin-assets/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin-assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Main File-->
    <script src="${pageContext.request.contextPath}/resources/admin-assets/js/front.js"></script>
  </body>
</html>



<!-- =======================CODE CŨ======================== -->
<html>
	<!-- <body onload='document.loginForm.username.focus();'> -->
	<body>
	    <h1>Spring Security 5 - Login Form</h1>
	 
	    <c:if test="${not empty errorMessge}"><div style="color:red; font-weight: bold; margin: 30px 0px;">${errorMessge}</div></c:if>
	 
	    <form action="/admin/login" method='POST'>
	        <table>
	            <tr>
	                <td>UserName:</td>
	                <td><input type='text' name='username' autofocus="autofocus"></td>
	            </tr>
	            <tr>
	                <td>Password:</td>
	                <td><input type='password' name='password' /></td>
	            </tr>
	            <tr>
	                <td>Remember Me:</td>
	                <td><input type="checkbox" name="remember-me" /></td>
	            </tr>
	            <tr>
	                <td colspan='2'><input name="submit" type="submit" value="submit" /></td>
	            </tr>
	            <tr>
	                <td></td>
	                <td><a href="/admin/register">Register</a></td>
	            </tr>
	        </table>
	<%--         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
	    </form>
	</body>
</html> 

