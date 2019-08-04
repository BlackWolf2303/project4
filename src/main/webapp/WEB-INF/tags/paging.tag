<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ tag import="org.springframework.util.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="pagedListHolder" required="true"
	type="org.springframework.beans.support.PagedListHolder"%>
<%@ attribute name="pagedLink" required="true" type="java.lang.String"%>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<br>
<c:if test="${pagedListHolder.pageCount > 1}">
	<ul class="pagination">
		<c:if test="${pagedListHolder.firstLinkedPage > 0}">
			<li><a onclick="setPageNo(0);">First</a></li>
		</c:if>
		<c:if test="${pagedListHolder.firstLinkedPage <= 0}">
			<li class="disabled"><a>First</a></li>
		</c:if>
		<c:if test="${!pagedListHolder.firstPage}">
			<li class="previous"><a
				onclick="setPageNo(${pagedListHolder.getPage() - 1});"><</a></li>
		</c:if>
		<c:if test="${pagedListHolder.firstPage}">
			<li class="disabled"><a><</a></li>
		</c:if>
		<c:forEach begin="${pagedListHolder.firstLinkedPage}"
			end="${pagedListHolder.lastLinkedPage}" var="i">
			<c:choose>
				<c:when test="${pagedListHolder.page == i}">
					<li class="active"><a href="#">${i+1}</a></li>
				</c:when>
				<c:otherwise>
					<li><a onclick="setPageNo(${i});">${i+1}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagedListHolder.lastPage}">
			<li class="disabled"><a>></a></li>
		</c:if>
		<c:if test="${!pagedListHolder.lastPage}">
			<li class="btn-link" class="next"><a
				onclick="setPageNo(${pagedListHolder.getPage() + 1});">></a></li>
		</c:if>
		<c:if
			test="${pagedListHolder.lastLinkedPage >= pagedListHolder.pageCount - 1}">
			<li class="disabled"><a>Last</a></li>
		</c:if>
		<c:if
			test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 1}">
			<li><a
				onclick="setPageNo(${pagedListHolder.getPageCount() - 1});">Last</a></li>
		</c:if>
	</ul>
</c:if>
</script>