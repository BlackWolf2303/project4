<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/layouts/head-meta.jsp"></jsp:include>
<!-- PAGE CLASSNAME - NO CHANGE ORTHER OF THESE -->
<body class="bg-white">
	<div class="wrap wrap-index home-page">
		<!-- END PAGE CLASSNAME -->
		<jsp:include page="/WEB-INF/layouts/header.jsp"></jsp:include>

		<section id="content">
			<div class="content-page">
				<div class="container">
					<div class="main-content-page">
						<div class="content-contact-page contact-form-faq">
							<h2 class="title30 rale-font font-bold text-uppercase">profile</h2>
							<div class="contact-form profile-page">
								<s:form action="/profile" method="POST" modelAttribute="account"
									enctype="multipart/form-data">
									<table>
										<c:if test="${not empty param.success}">Your profile has been updated successfully!</c:if>
										<tr>
											<td>Avatar:</td>
											<td><c:if
													test="${avatar!='http://localhost:9596/file/image/'}">
													<img src="${avatar}" width=50 alt="No Image">
												</c:if> <c:if test="${avatar=='http://localhost:9596/file/image/'}">
													<img src="http://localhost:9596/file/image/defaultAva.jpg"
														width=50 alt="No Image">
												</c:if> <s:input path="file" type="file" /></td>
											<td><s:errors path="file"></s:errors></td>
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
											<td><s:input path="phone" class="" /></td>
											<td><s:errors path="phone"></s:errors></td>
										</tr>
										<tr>
											<td>Address:</td>
											<td><s:input path="address" /></td>
											<td><s:errors path="address"></s:errors></td>
										</tr>
										<tr>
											<td colspan='2'><input type="submit" value="submit"
												class="bg-color white text-uppercase font-bold" /></td>
											<s:hidden path="id" />
										</tr>
									</table>
								</s:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>



















		<jsp:include page="/WEB-INF/layouts/footer.jsp"></jsp:include>