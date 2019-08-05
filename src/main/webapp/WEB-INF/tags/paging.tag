<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ tag import="org.springframework.util.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="pagedListHolder" required="true"
	type="org.springframework.beans.support.PagedListHolder"%>
<%@ attribute name="pagedLink" required="true" type="java.lang.String"%>
<!-- <link rel="stylesheet" -->
<!-- 	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!-- <script -->
<!-- 	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->

<br>
<c:if test="${pagedListHolder.pageCount > 1}">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${pagedListHolder.firstLinkedPage > 0}">
				<li><a class="page-link" href="#" onclick="setPageNo(0);"><span aria-hidden="true">&laquo;</span>
        <span class="sr-only">First</span></a></li>
			</c:if>
			<c:if test="${pagedListHolder.firstLinkedPage <= 0}">
				<li class="disabled"><a class="page-link"><span aria-hidden="true">&laquo;</span>
        <span class="sr-only">First</span></a></li>
			</c:if>
			<c:if test="${!pagedListHolder.firstPage}">
				<li class="previous"><a class="page-link"
					onclick="setPageNo(${pagedListHolder.getPage() - 1});"><span aria-hidden="true">&lsaquo;</span>
        <span class="sr-only">Previous</span></a></li>
			</c:if>
			<c:if test="${pagedListHolder.firstPage}">
				<li class="disabled"><a class="page-link"><span aria-hidden="true">&lsaquo;</span>
        <span class="sr-only">Previous</span></a></li>
			</c:if>
			<c:forEach begin="${pagedListHolder.firstLinkedPage}"
				end="${pagedListHolder.lastLinkedPage}" var="i">
				<c:choose>
					<c:when test="${pagedListHolder.page == i}">
						<li class="active"><a class="page-link" href="#">${i+1}</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="page-link" onclick="setPageNo(${i});">${i+1}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagedListHolder.lastPage}">
				<li class="disabled"><a class="page-link"><span aria-hidden="true">&rsaquo;</span>
        <span class="sr-only">Next</span></a></li>
			</c:if>
			<c:if test="${!pagedListHolder.lastPage}">
				<li class="btn-link" class="next"><a class="page-link"
					onclick="setPageNo(${pagedListHolder.getPage() + 1});"><span aria-hidden="true">&rsaquo;</span>
        <span class="sr-only">Next</span></a></li>
			</c:if>
			<c:if
				test="${pagedListHolder.lastLinkedPage >= pagedListHolder.pageCount - 1}">
				<li class="disabled"><a class="page-link"><span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Last</span></a></li>
			</c:if>
			<c:if
				test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 1}">
				<li><a class="page-link"
					onclick="setPageNo(${pagedListHolder.getPageCount() - 1});"><span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Last</span></a></li>
			</c:if>
		</ul>
		</nav>
</c:if>



</script>