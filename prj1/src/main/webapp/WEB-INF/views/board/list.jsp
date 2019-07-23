<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="#pablo">Paper Dashboard 2</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
         
        </div>
      </nav>
      <!-- End Navbar -->
<div class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title ">문의 게시판</h4>
					<a href="/board/register" class="btn btn-sm btn-round pull-right">Regist</a>
					<p class="card-category">질문을 등록하세요 !!</p>
				</div>
				<div class="card-body">
					<div class="table">
						<table class="table">
							<thead class=" text-success">
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
										<td><a href='${vo.bno }' class="view"> <c:out value="${vo.title}" /></a></td>
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
										<h5 class="modal-title">${result}</h5>
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
		
		$(".view").on("click",function(e){
			e.preventDefault();
			var targetBno = $(this).attr("href");
			actionForm.attr("action","/board/read");
			actionForm.append("<input type='hidden' name='bno' value="+targetBno+">");
			actionForm.submit();
		});
		$(document)
				.ready(
						function() {

							var result = '<c:out value="${result}"/>';
							var result_modify='<c:out value="${result_modify}"/>';

							checkModal(result);
							console.log(result);

							function checkModal(result) {

								if (result === '') {
									return;
								}
								
								if (result === "Modify"){
									$(".modal-body").html(
											"게시글이 수정되었습니다.");
								}
								
								if (result === "Remove"){
									$(".modal-body").html(
											"게시글이 삭제되었습니다.");
								}

								if (parseInt(result) > 0) {
									$(".modal-body").html(
											"게시글이 등록되었습니다.");
								}
								$("#myModal").modal("show");
							}
							
						});
	</script>
</div>
<%@include file="../includes/footer.jsp"%>