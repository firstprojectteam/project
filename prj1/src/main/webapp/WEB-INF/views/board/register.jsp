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
						<h4 class="card-title">Simple Table</h4>
					</div>
					<div class="card-body">
						<div class="table">
							<form class="user" action="/board/register" method="post">
								<div class="form-group">

									<input type="text" name='title'
										class="form-control form-control-user" placeholder="title">

								</div>
								<div class="form-group">
									<input type="text" name='content'
										class="form-control form-control-user" placeholder="content">
								</div>
								<div class="form-group">
									<input type="text" name='writer'
										class="form-control form-control-user" placeholder="writer">
								</div>
								<button class="btn btn-facebook">submit</button>
								<a href="/board/list" class="btn btn-secondary"> go to List
								</a>
								<hr>

							</form>

						</div>
					</div>
				</div>
			</div>

		</div>
		

	</div>

	
	<%@include file="../includes/footer.jsp"%>