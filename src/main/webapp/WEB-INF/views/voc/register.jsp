<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">고객의 소리함</div>
			<div class="panel-body">
				<form role="form" action="/voc/register" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='board_title'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='board_content'></textarea>
					</div>
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='board_writer'
						 value='<sec:authentication property="principal.username"/>'readonly="readonly">
					</div>
					<button type="submit" class="btn btn-default">제출하기</button>
					<button type="reset" class="btn btn-default">다시쓰기</button>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp"%>
