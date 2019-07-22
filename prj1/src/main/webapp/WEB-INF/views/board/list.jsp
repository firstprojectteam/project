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
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="nc-icon nc-zoom-split"></i>
                  </div>
                </div>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link btn-magnify" href="#pablo">
                  <i class="nc-icon nc-layout-11"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Stats</span>
                  </p>
                </a>
              </li>
              <li class="nav-item btn-rotate dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="nc-icon nc-bell-55"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link btn-rotate" href="#pablo">
                  <i class="nc-icon nc-settings-gear-65"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Account</span>
                  </p>
                </a>
              </li>
            </ul>
          </div>
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
							<thead class=" text-primary">
								<tr>
									<td>BNO</td>
									<td>TITLE</td>
									<td>WRITER</td>
									<td>REGDATE</td>
								</tr>
								<c:forEach items="${list}" var="vo">
									<tr>
										<td><c:out value="${vo.bno}" /></td>
										<td><c:out value="${vo.title}" /></td>
										<td><c:out value="${vo.writer}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${vo.regdate}" /></td>

									</tr>
								</c:forEach>
							</tbody>
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
		$(document)
				.ready(
						function() {

							var result = '<c:out value="${result}"/>';

							checkModal(result);

							function checkModal(result) {

								if (result === '') {
									return;
								}

								if (parseInt(result) > 0) {
									$(".modal-body").html(
											"게시글 " + parseInt(result)
													+ " 번이 등록되었습니다.");
								}
								$("#myModal").modal("show");
							}

						});
	</script>
</div>
<%@include file="../includes/footer.jsp"%>