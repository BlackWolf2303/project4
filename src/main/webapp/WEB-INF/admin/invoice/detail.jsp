<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/admin-layouts/head-meta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin-layouts/header.jsp"></jsp:include>

<section>

	<h1>Details</h1>


	<table border="1">
		<thead>
			<tr>
				<td>Name</td>
				<td>Option 1</td>
				<td>Option 2</td>
				<td>Quantity</td>
				<td>Price</td>
				<td>Total</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="orderDetail" items="${orderDetails }">
				<tr>
					<td>${orderDetail.product.name }</td>
					<td>${orderDetail.option1}</td>
					<td>${orderDetail.option2}</td>
					<td>${orderDetail.quantity }</td>
					<td>${orderDetail.price }</td>
					<td>${orderDetail.price * orderDetail.quantity }</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">Sum</td>
				<td>Pending "Hoi Thay"...</td>
			</tr>
		</tfoot>
	</table>

</section>

<jsp:include page="/WEB-INF/admin-layouts/footer.jsp"></jsp:include>