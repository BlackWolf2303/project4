<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

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
								<label class="col-sm-2 form-control-label">Type Template
									1</label>
								<div class="col-sm-10 mb-3">
									<s:select path="typeTemplate1">
										<s:options path="id" items="${typeTemplates}" itemLabel="name"
											itemValue="id" />
									</s:select>
								</div>
							</div>
							<br>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Type Template
									2</label>
								<div class="col-sm-10 mb-3">
									<s:select path="typeTemplate2">
										<s:options path="id" items="${typeTemplates}" itemLabel="name"
											itemValue="id" />
									</s:select>
								</div>
							</div>
							<br>
							<s:errors path="file" />
							<br>
							<div class="form-group row">
								<label class="col-sm-2 form-control-label">Picture 1:</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-2">
											<img src="${picture0}" width=50 alt="No Image">
										</div>
										<div class="col-md-5">
											<s:input path="file" type="file" />
										</div>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									2:</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-2">
											<img src="${picture1 }" width=50 alt="No Image">
										</div>
										<div class="col-md-5">
											<s:input path="file" type="file" />
										</div>
										| <a href="/admin/product/${id}/remove/image/1">Remove</a>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									3:</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-2">
											<img src="${picture2 }" width=50 alt="No Image">
										</div>
										<div class="col-md-5">
											<s:input path="file" type="file" />
										</div>
										| <a href="/admin/product/${id}/remove/image/2">Remove</a>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									4:</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-2">
											<img src="${picture3 }" width=50 alt="No Image">
										</div>
										<div class="col-md-5">
											<s:input path="file" type="file" />
										</div>
										| <a href="/admin/product/${id}/remove/image/3">Remove</a>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									5;</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-2">
											<img src="${picture4}" width=50 alt="No Image">
										</div>
										<div class="col-md-5">
											<s:input path="file" type="file" />
										</div>
										| <a href="/admin/product/${id}/remove/image/4">Remove</a>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									6:</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-2">
											<img src="${picture5}" width=50 alt="No Image">
										</div>
										<div class="col-md-5">
											<s:input path="file" type="file" />
										</div>
										| <a href="/admin/product/${id}/remove/image/5">Remove</a>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									7:</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-2">
											<img src="${picture6}" width=50 alt="No Image">
										</div>
										<div class="col-md-5">
											<s:input path="file" type="file" />
										</div>
										| <a href="/admin/product/${id}/remove/image/6">Remove</a>
									</div>
								</div>
								<br> <label class="col-sm-2 form-control-label">Picture
									8:</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-2">
											<img src="${picture7}" width=50 alt="No Image">
										</div>
										<div class="col-md-5">
											<s:input path="file" type="file" />
										</div>
										| <a href="/admin/product/${id}/remove/image/7">Remove</a>
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