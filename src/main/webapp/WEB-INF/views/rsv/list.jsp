<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

<style>
	#test-whiteline{
		color : white;
	}
	
.pull-right {
	 font-size: 50px;
	 float: inherit;
}
</style>
	
	<h2 id="test-whiteline">text</h2>
	<div>
	<h1 align="center">예약 페이지</h1>
	<table border="1" align="center" >
		<tr align="center">
			<td width="10%">예약번호</td>
			<td width="20%">아이디</td>
			<td width="20%">예약날짜</td>
			<td width="20%">시간</td>
			<td width="20%">증상</td>
		</tr>
		
		
			<c:forEach items="${list }" var="board">
				<tr>
					<td><c:out value="${board.reservation_number }" /></td>
					<td><a class='move' href='<c:out value="/rsv/detailPage?member_id=${board.member_id }"/>'>
							<c:out value="${board.member_id }" /></a></td>
					<td><c:out value="${board.reservation_date }" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${board.reservation_time }" /></td>
					<td><c:out value="${board.reservation_sympton }" /></td>
				</tr>
			</c:forEach>

	</table>

	
	<div class="pull-right" align="center">
  		<ul class="pagination" >
  			
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
  	
</body>

<h1> </h1>
<h1 id="test-whiteline">Test</h1>

<script type="text/javascript">
	$(function(){
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		history.replaceState({}, null, null);
		
		function checkModal(result)
		{
			if(result === '' || history.state)
			{
				return;			
			}
			
			if(parseInt(result) > 0)
			{
				$(".modal-body").html("게시글 "+parseInt(result)+" 번이 등록되었습니다.");		
			}
			$("#myModal").modal("show");
		}	
		
		$("#regBtn").on("click", function(){
			self.location = "/board/register";
		});
		
		var actionForm = $('#actionForm');
		
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			
			console.log('click');
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
/* 		$(".move").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/get");
			actionForm.submit();
		}); */
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
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
