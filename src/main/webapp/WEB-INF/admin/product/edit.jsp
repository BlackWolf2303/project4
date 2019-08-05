<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<section>
	<div class="container-fluid">
		<header>
			<h1 class="h3 display">EDIT PRODUCT</h1>
		</header>
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<s:form modelAttribute="product"
							action="/admin/product/edit/${product.id}" method="post"
							enctype="multipart/form-data">
							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Name </label>
								<div class="col-sm-10">
									<s:input class="form-control" path="name" />
								</div>
								<s:errors path="name" />
							</div>
							<br>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Quantity</label>
								<div class="col-sm-10">
									<s:input class="form-control" path="quantity" />
								</div>
								<s:errors path="quantity" />
							</div>
							<br>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Price</label>
								<div class="col-sm-10">
									<s:input class="form-control" path="price" />
								</div>
								<s:errors path="price" />
							</div>
							<br>
							
							<div class="form-group row">
								<label class="col-sm-2 form-control-label"> Type
									Template 1</label>
								<div class="col-sm-10 mb-3">
									<s:select path="typeTemplate1">
										<s:options path="id" items="${typeTemplates}" itemLabel="name"
											itemValue="id" />
									</s:select>
								</div>
							</div>
							<br>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label"> Type
									Template 2</label>
								<div class="col-sm-10 mb-3">
									<s:select path="typeTemplate2">
										<s:options path="id" items="${typeTemplates}" itemLabel="name"
											itemValue="id" />
									</s:select>
								</div>
							</div>
							<br>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Picture 1:</label>
								<div class="col-sm-10">
									<div class="row">
											<div class="col-md-2">
											
												<s:input path="file" type='file' id="imgInp" /> 
													<img id="blah" src="${picture0 }" alt="No Image" />
											
										</div>
											<%-- 											<img src="${picture0}" width=50 alt="No Image"> --%>
<!-- 										</div> -->
										<!-- 										<div class="col-md-5"> -->
										<%-- 											<s:input path="file" type="file" /> --%>
										<!-- 										</div> -->
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									2:</label>
								<div class="col-sm-10">
									<div class="row">
											<div class="col-md-4">
												
													<s:input path="file" type='file' id="imgInp1" /> <img id="blah1"
														src="${picture1}"
														alt="No Image" />
											</div>
											<%-- 											<img src="${picture1 }" width=50 alt="No Image"> --%>
<!-- 										</div> -->
										<!-- 										<div class="col-md-5"> -->
										<%-- 											<s:input path="file" type="file" /> --%>
										<!-- 										</div> -->
										<div class="col-md-4">
											| <a href="/admin/product/${id}/remove/image/1">Remove</a>
										</div>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									3:</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-4">
											
												<s:input path="file" type='file' id="imgInp2" /> <img id="blah2"
													src="${picture2}"
													alt="No Image" />
										</div>
										<!-- 										<div class="col-md-5"> -->
										<%-- 											<s:input path="file" type="file" /> --%>
										<!-- 										</div> -->
										<div class="col-md-4">
											| <a href="/admin/product/${id}/remove/image/2">Remove</a>
										</div>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									4:</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-4">
											
												<s:input path="file" type='file' id="imgInp3" /> <img id="blah3"
													src="${picture3}"
													alt="No Image" />
										</div>
										<!-- 										<div class="col-md-5"> -->
										<%-- 											<s:input path="file" type="file" /> --%>
										<!-- 										</div> -->
										<div class="col-md-4">
											| <a href="/admin/product/${id}/remove/image/3">Remove</a>
										</div>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									5;</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-4">
											
												<s:input path="file" type='file' id="imgInp4" /> <img id="blah4"
													src="${picture4}"
													alt="No Image" />
										</div>
										<!-- 										<div class="col-md-5"> -->
										<%-- 											<s:input path="file" type="file" /> --%>
										<!-- 										</div> -->
										<div class="col-md-4">
											| <a href="/admin/product/${id}/remove/image/4">Remove</a>
										</div>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									6:</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-4">
											
												<s:input path="file" type='file' id="imgInp5" /> <img id="blah5"
													src="${picture5}"
													alt="No Image" />
										</div>
										<!-- 										<div class="col-md-5"> -->
										<%-- 											<s:input path="file" type="file" /> --%>
										<!-- 										</div> -->
										<div class="col-md-4">
											| <a href="/admin/product/${id}/remove/image/5">Remove</a>
										</div>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									7:</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-4">
											
												<s:input path="file" type='file' id="imgInp6" /> <img id="blah6"
													src="${picture6}"
													alt="No Image" />
										</div>
										<!-- 										<div class="col-md-5"> -->
										<%-- 											<s:input path="file" type="file" /> --%>
										<!-- 										</div> -->
										<div class="col-md-4">
											| <a href="/admin/product/${id}/remove/image/6">Remove</a>
										</div>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									8:</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-4">
												<s:input path="file" type='file' id="imgInp7" /> <img id="blah7"
													src="${picture7}"
													alt="No Image" />
										</div>
										<!-- 										<div class="col-md-5"> -->
										<%-- 											<s:input path="file" type="file" /> --%>
										<!-- 										</div> -->
										<div class="col-md-4">
											| <a href="/admin/product/${id}/remove/image/7">Remove</a>
										</div>
									</div>
								</div>
								<br>
							</div>
							
							<s:hidden path="id" />
							<br>
							<div class="form-group row">
								<div class="col-sm-4 offset-sm-2">
									<input class="btn btn-secondary" value="Submit" type="submit">
									<div class="btn btn-secondary">
										<a href="/admin/product">Back</a>
									</div>
								</div>
							</div>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>
<script>
	function readURL(input) {
		var elem = $(input);
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				elem.next('img').attr('src', e.target.result);
			}
			reader.readAsDataURL(elem.get(0).files[0]);
		}
	}

	$("input[type='file']").change(function() {
		readURL(this);
	});
</script>