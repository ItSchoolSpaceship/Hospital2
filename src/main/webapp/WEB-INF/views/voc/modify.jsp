<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">고객의소리 게시글</div>
			<div class="panel-body">

				<form role="form" action="/voc/modify" method="post">

					<!-- 추가 -->
					<input type='hidden' name="${_csrf.parameterName }" value="${_csrf.token }"/> 
					<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
					<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>						
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>						
					<div class="form-group">
						<label>번호</label> <input class="form-control" name='board_number'
							value='<c:out value="${voc.board_number }" />' readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name='board_title'
							value='<c:out value="${voc.board_title }" />'>
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='board_content'><c:out
								value="${voc.board_content }" /></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='board_writer'
							value='<c:out value="${voc.board_writer }" />'>
					</div>

					<div class="form-group">
						<label>작성일</label> <input class="form-control" name='board_regdate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${voc.board_regdate }" />'
							readonly="readonly">
					</div>

					<div class="form-group">
						<label>수정일</label> <input class="form-control"
							name='board_updatedate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${voc.board_updatedate }"/> '
							readonly="readonly">
					</div>
					
				<sec:authentication property="principal" var="pinfo"/>
				
				<sec:authorize access="isAuthenticated()">
				
				<c:if test="${pinfo.username eq voc.board_writer }">
				
					<button type="submit" data-oper='modify' class="btn btn-default">
						수정하기</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">
						제거하기</button>
				</c:if>
				</sec:authorize>
				
					<button type="submit" data-oper='list' class="btn btn-info">
						List</button>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/voc/remove");
			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/voc/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}
			formObj.submit();
		});
	});
</script>

<%@ include file="../includes/footer.jsp"%>