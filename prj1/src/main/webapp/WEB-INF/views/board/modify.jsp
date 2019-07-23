<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="main-panel">
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
		<div class="container-fluid">
			<div class="navbar-wrapper">
				<div class="navbar-toggle">
					<button type="button" class="navbar-toggler">
						<span class="navbar-toggler-bar bar1"></span> <span
							class="navbar-toggler-bar bar2"></span> <span
							class="navbar-toggler-bar bar3"></span>
					</button>
				</div>
				<a class="navbar-brand" href="#pablo">Paper Dashboard 2</a>
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navigation" aria-controls="navigation-index"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-bar navbar-kebab"></span> <span
					class="navbar-toggler-bar navbar-kebab"></span> <span
					class="navbar-toggler-bar navbar-kebab"></span>
			</button>

		</div>
	</nav>
	<!-- End Navbar -->
	<div class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">${vo.bno}번 게시글 수정</h4>
					</div>
					<div class="card-body">

						<form id='form1'>
							<input type="hidden" name="bno" value="${cri.bno}"> <input
								type="hidden" name="page" value="${cri.page}"> <input
								type="hidden" name="amount" value="${cri.amount}"> <input
								type="hidden" name="type" value="${cri.type}"> <input
								type="hidden" name="keyword" value="${cri.keyword}">
							<div class="form-group">

								<input type="text" name='bno'
									class="form-control form-control-user"
									value='<c:out value="${vo.bno}"/>' readonly="readonly">

							</div>
							<div class="form-group">

								<input type="text" name='title'
									class="form-control form-control-user" placeholder="Title"
									value='<c:out value="${vo.title}"/>'>

							</div>
							<div class="form-group">
								<input type="text" name='content'
									class="form-control form-control-user" placeholder="Content"
									value='<c:out value="${vo.content}"/>'>
							</div>
							<div class="form-group">
								<input type="text" name='writer'
									class="form-control form-control-user" placeholder="Writer"
									value='<c:out value="${vo.writer}"/>' readonly="readonly">
							</div>

						</form>
						<div class="pull-right">
							<button class="btn modBtn ">Modify</button>
							
							<button class="btn deleteBtn ">Delete</button>

							<button class="btn listBtn ">go to List</button>

						</div>

					</div>

				</div>

			</div>
		</div>

	</div>


</div>

<form id="actionForm" action="/board/modify" method="get">
	<input type="hidden" name="bno" value="${cri.bno}"> <input
		type="hidden" name="page" value="${cri.page}"> <input
		type="hidden" name="amount" value="${cri.amount}"> <input
		type="hidden" name="type" value="${cri.type}"> <input
		type="hidden" name="keyword" value="${cri.keyword}">
</form>

<script>
	var actionForm = $("#form1");

	
	$(".listBtn").on("click", function(e) {
		actionForm.find("bno").remove();
		actionForm.attr("action", "/board/list");
		actionForm.submit();

	});
	
	$('.deleteBtn').on(
			"click",
			function() {

				console.log("button click");
				var formObj = $("#form1");
				formObj.attr("action", "/board/remove").attr("method","post").submit();

			});

	$('.modBtn').on(
			"click",
			function() {

				console.log("button click");
				var formObj = $("#form1");
				formObj.attr("action", "/board/modify").attr("method","post").submit();

			});
</script>
<%@include file="../includes/footer.jsp"%>