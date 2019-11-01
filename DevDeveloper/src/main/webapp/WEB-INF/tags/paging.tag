<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging"
	type="com.dd.devdeveloper.common.paging.Paging"%>
<%@ attribute name="jsFunc" required="false" type="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="go_page"></c:set>
</c:if>


<div class="card-footer py-4">
	<nav aria-label="...">
		<ul class="pagination justify-content-end mb-0">
			<li class="page-item"><a class="page-link"
				href="javascript:${jsFunc}(${paging.startPage>2?paging.startPage-1:1})">
					<i class="fas fa-angle-left"></i> <span class="sr-only">Previous</span>
			</a></li>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="i">
				<c:if test="${i != paging.page}">
					<li class="page-item"><a class="page-link"
						href="javascript:${jsFunc}(${i})">${i}</a>
				</c:if>
				<c:if test="${i == paging.page}">
					<li class="page-item active"><a class="page-link"
						href="javascript:${jsFunc}(${i})">${i}</a>
				</c:if>
			</c:forEach>
			<li class="page-item"><a class="page-link"
				href="javascript:${jsFunc}(${paging.endPage<paging.lastPage?paging.endPage+1:paging.endPage})">
					<i class="fas fa-angle-right"></i> <span class="sr-only">Next</span>
			</a></li>
		</ul>
	</nav>
</div>