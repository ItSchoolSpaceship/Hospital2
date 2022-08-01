<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<style>
#test-whiteline {
	color: white;
}

.pull-right {
	font-size: 50px;
	float: right;
	margin-right: 200px;
	padding-right: 100px;
}
</style>

<br>
<div>
	<h1 align="center">예약 페이지</h1>
	<table border="1" align="center">
		<tr align="center">
			<td width="10%">예약번호</td>
			<td width="10%">아이디</td>
			<td width="15%">예약날짜</td>
			<td width="15%">시간</td>
			<td width="20%">증상</td>
			<td width="5%">삭제</td>
			<td width="5%">수정</td>
		</tr>


		<c:forEach items="${list }" var="board">
			<tr>
				<td><c:out value="${board.reservation_number }" /></td>
				<td><a class='move'
					href='<c:out value="/rsv/detailPage?member_id=${board.member_id }"/>'>
						<c:out value="${board.member_id }" />
				</a></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${board.reservation_date }" /></td>
				<%-- 					<td><c:out value="${board.reservation_date }" /></td> --%>
				<td><c:out value="${board.reservation_time }" /></td>
				<td><c:out value="${board.reservation_sympton }" /></td>
				<td><a
					href="/rsv/remove?reservation_number=${board.reservation_number }"
					role="button" class="btn btn-outlint-info">삭제</a><td><a
					href="/rsv/modify?reservation_number=${board.reservation_number }"
					role="button" class="btn btn-outlint-info">수정</a></td>




			</tr>
			</c:forEach>

	</table>

	
	<div class="pull-right" align="center">
  		<ul class="pagination">
  			
  			<c:if test="${pageMaker.prev }">
  				<li class="paginate_button previous">
  					<a href="${pageMaker.startPage - 1}">Previous</a> 
  				</li>
  			</c:if>
  		
  			<c:forEach var="num" begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }">
  				<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : ""} ">
  					<a href="${num}">${num}</a>
  				</li>
  			</c:forEach>
  			
  			<c:if test="${pageMaker.next }">
  				<li class="paginate_button next">
  					<a href="${pageMaker.endPage + 1}">Next</a> 
  				</li>
  			</c:if>
  		</ul>
  	</div>
  		</div>
  	
   	<form id="actionForm" action="/rsv/list" method="get">
   		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
   		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
   		<input type="hidden" name="type" value="${pageMaker.cri.type}">
   		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
   	</form>
  	
  	            	<!-- modal 추가ㅣ -->
               	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
               		aria-labelledby="myModalLabel" aria-hidden="true">
               		<div class="modal-dialog">
               			<div class="modal-content">
               				<div class="modal-header">
               					<button type="button" class="close" data-dismiss="modal"
               						aria-hidden="true">&times;</button>
               					<h4 class="modal-title" id="myModalLabel">예약</h4>
               				</div>
               				<div class="modal-body">처리가 완료되었습니다.</div>
               				<div class="modal-footer">
               					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               					<!-- <button type="button" class="btn btn-primary">Save Changes</button> -->
               				</div>
               			</div>
               		</div>
               	</div>
               	<!-- /.modal -->
  	
</body>

<br>




<script type="text/javascript">
	$(function() {
		var result = '<c:out value="${result}"/>';

		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html(
						"예약번호 " + parseInt(result) + "번으로 예약되었습니다.");
			}
			$("#myModal").modal("show");
		}

		$("#regBtn").on("click", function() {
			self.location = "/board/register";
		});

		var actionForm = $('#actionForm');

		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/rsv/list");
		actionForm.submit();
		});

		var searchForm = $("#searchForm");

		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();

			searchForm.submit();
		});
	});
</script>
            

<%@include file="../includes/footer.jsp" %>
