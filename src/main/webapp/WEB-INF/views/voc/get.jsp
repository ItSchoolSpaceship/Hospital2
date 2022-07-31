<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@	taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">고객의소리 게시글</div>
			<div class="panel-body">
				<div class="form-group">
					<label>번호</label> <input class="form-control" name='board_number'
						value='<c:out value="${voc.board_number }" />' readonly="readonly">
				</div>

				<div class="form-group">
					<label>제목</label> <input class="form-control" name='board_title'
						value='<c:out value="${voc.board_title }" />' readonly="readonly">
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name='board_content'
						readonly="readonly"><c:out value="${voc.board_content }" /></textarea>
				</div>

				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='board_writer'
						value='<c:out value="${voc.board_writer }" />' readonly="readonly">
				</div>
				<sec:authentication property="principal" var="pinfo"/>
					<sec:authorize access="isAuthenticated()">
					<c:if test="${pinfo.username eq voc.board_writer }">
					<button data-oper='modify' class="btn btn-default">수정하기</button>
					</c:if>
				</sec:authorize>
				<button data-oper='list' class="btn btn-info">돌아가기</button>

				<form id='operForm' action="/voc/modify" method="get">
					<input type='hidden' id='bno' name='board_number' value='<c:out value="${voc.board_number }"/>'> 
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'> 
					<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
					<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
				</form>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="/resources/js/reply.js"></script>



<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/voc/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#board_number").remove();
			operForm.attr("action", "/voc/list")
			operForm.submit();

		});

	});
</script>

<%@ include file="../includes/footer.jsp"%>
