<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="container-fluid">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header card-header-info">
				<h4 class="card-title">
					<a href="/board/register" class="btn btn-primary pull-right">게시글
						등록</a>문의 게시판
				</h4>
				<p class="card-category">질문을 등록하세요 !!</p>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table">
						<thead class=" text-primary">
							<tr>
								<td>BNO</td>
								<td>TITLE</td>
								<td>WRITER</td>
								<td>REGDATE</td>
							</tr>

						</thead>

						<c:forEach items="${list}" var="vo">
							<tr>
								<td><c:out value="${vo.bno}" /></td>
								<td><c:out value="${vo.title}" /></td>
								<td><c:out value="${vo.writer}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${vo.regdate}" /></td>
							</tr>
						</c:forEach>

					</table>
					<ul class="pagination">
						<c:if test="${pm.prev}">
							<li class="page-item"><a class="page-link"
								href='${pm.start-1}'>Previous</a></li>
						</c:if>
						<c:forEach begin="${pm.start}" end="${pm.end}" var="idx">
							<li class="page-item ${pm.current == idx? "active":"" }"><a
								class="page-link" href='${idx}'>${idx}</a></li>
						</c:forEach>
						<c:if test="${pm.next}">
							<li class="page-item"><a class="page-link"
								href='${pm.end+1}'>Next</a></li>
						</c:if>
					</ul>
					<!-- modal start-->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">게시글 등록 완료</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body"></div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
					<!-- modal end -->

				</div>
			</div>
		</div>

	</div>
</div>

<!-- /.container-fluid -->
<form id="actionForm" action="/board/list" method="get">
	<input type="hidden" name="page" value="${cri.page}"> <input
		type="hidden" name="amount" value="${cri.amount}">
</form>
<script type="text/javascript">
	var actionForm = $("#actionForm");
	$(".page-link").on("click", function(e) {
		e.preventDefault();
		var targetPage = $(this).attr("href");
		console.log("targetPage:" + targetPage);
		actionForm.find("input[name='page']").val(targetPage);
		actionForm.submit();
	});
	$(document).ready(
			function() {

				var result = '<c:out value="${result}"/>';
				checkModal(result);

				function checkModal(result) {

					if (result === '') {
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글 " + parseInt(result) + " 번이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				}

			});
</script>


<%@include file="../includes/footer.jsp"%>