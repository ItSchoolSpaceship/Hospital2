<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%-- <c:set var="reservation"  value="${detail.reservation}"  />
<c:set var="member"  value="${detail.member}"  /> --%>

<style>
	form{
		font-size: 30px;
		margin-left: 100px;
	}
</style>

<%@include file="../includes/header.jsp" %>


	<h1 align="center">예약 페이지</h1>
	<form>
		<ul>
			<li>예약번호 : ${reserv.reservation_number}</li>
			<li>아이디 : ${reserv.member_id}</li>
			<li>이름 : ${member.member_name}</li>
			<li>전화번호 : ${member.member_phone}</li>
 			<li>예약날짜 : <fmt:formatDate pattern="yyyy년 MM월 dd일"
						value="${reserv.reservation_date}"/></li>
			<li>시간 : ${reserv.reservation_time}</li>
			<li>증상 : ${reserv.reservation_sympton}</li>
		</ul>
	</form>
	
		
<%-- 		<tr align="center" >
			<td><c:out value="${list.reservation_number}" /></td>
			<td>${list.member_id }</td>
			<td>${list.reservation_date}</td>
			<td>${list.reservation_time}</td>
			<td>${list.reservation_sympton}</td> --%>
			
			
			  <!-- modal 추가ㅣ -->
                          	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                          		aria-labelledby="myModalLabel" aria-hidden="true">
                          		<div class="modal-dialog">
                          			<div class="modal-content">
                          				<div class="modal-header">
                          					<button type="button" class="close" data-dismiss="modal"
                          						aria-hidden="true">&times;</button>
                          					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
                          				</div>
                          				<div class="modal-body">처리가 완료되었습니다.</div>
                          				<div class="modal-footer">
                          					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          					<button type="button" class="btn btn-primary">Save Changes</button>
                          				</div>
                          			</div>
                          		</div>
                          	</div>
                          	<!-- /.modal -->


<script> 
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
		
		$(".move").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/get");
			actionForm.submit();
		});
		
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