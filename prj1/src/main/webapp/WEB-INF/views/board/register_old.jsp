<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp" %>

        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-info">
                  <h4 class="card-title ">게시글 등록</h4>
                
                  
                </div>
                <div class="card-body">
                  <div class="table-responsive">
				<form class="user" action="/board/register" method="post">
					<div class="form-group">
						
							<input type="text" name = 'title' class="form-control form-control-user"
								placeholder="title">
					
					</div>
					<div class="form-group">
						<input type="text" name = 'content' class="form-control form-control-user"
							 placeholder="content">
					</div>
					<div class="form-group">
						<input type="text" name = 'writer' class="form-control form-control-user"
							 placeholder="writer">
					</div>
					<button class="btn btn-facebook">submit</button>
					<a href="/board/list" class="btn btn-secondary">
						go to List </a>
					<hr>
					
				</form>

			</div>
                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>
      

<%@include file="../includes/footer.jsp" %>