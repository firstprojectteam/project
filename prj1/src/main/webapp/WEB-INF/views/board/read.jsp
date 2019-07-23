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
						<h4 class="card-title">${vo.bno}번  게시글</h4>
					</div>
					<div class="card-body">
						<div class="table">
							
							<div class="form-group">
							<label>Title</label>
								<input type="text" name='title'
									class="form-control form-control-user" placeholder="Title"
									value='<c:out value="${vo.title}"/>' readonly="readonly">

							</div>
							<div class="form-group" >
							<label >content</label>
								<input type="text" name='conent'
									class="form-control form-control-user" placeholder="Content"
									value='<c:out value="${vo.content}" />' readonly="readonly" style="height: 20rem;">
							</div>
							<div class="form-group">
							<label >writer</label>
								<input type="text" name='writer' 
									class="form-control form-control-user" placeholder="Writer"
									value='<c:out value="${vo.writer}"/>' readonly="readonly">
							</div>
							
							<div class="pull-right">
							<button class="btn modBtn ">Modify/Delete</button>

							<button class="btn listBtn ">go to List</button>
							
							</div>
							


						</div>
						
					</div>
				</div>
			</div>

		</div>


	</div>

					<form id="actionForm" action="/board/modify" method="get">
						<input type="hidden" name="bno" value="${cri.bno}"> 
						<input type="hidden" name="page" value="${cri.page}"> 
						<input type="hidden" name="amount" value="${cri.amount}"> 
						<input type="hidden" name="type" value="${cri.type}"> 
						<input type="hidden" name="keyword" value="${cri.keyword}">
					</form>
						
					<script>
					var actionForm = $("#actionForm");

							$(".modBtn").on("click", function(e) {
								actionForm.submit();
							});
					
							$(".listBtn").on("click", function(e) {
								actionForm.find("bno").remove();
								actionForm.attr("action", "/board/list");
								actionForm.submit();

							});
	</script>
	<%@include file="../includes/footer.jsp"%>