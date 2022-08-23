<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" align="center">예약 페이지</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
			
			<div>
			
<%-- 			<div class="form-group">
	                        		<label>Bno</label><input class="form-control" name="bno"
	                        			value='<c:out value="${board.bno}"/>' readonly="readonly">
	                        	</div --%>
			
             <form role="form" action="/rsv/register" method="post" align="center" >
             <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
             	<div class="form-group" >
             		<label>아이디</label><input class="form-control1" name="member_id"
	                        			value=<sec:authentication property="principal.member.member_id"/> readonly="readonly">
				</div>
             	
             	<div class="form-group" >
             		<label>이름</label><input class="form-control1" name="member_name"
	                        			value=<sec:authentication property="principal.member.member_name"/> readonly="readonly">
				</div>
				<!-- readonly="readonly -->
				<br>
             	<div class="form-group">
             		<label>증상</label>
             		<textarea class="form-control1" rows="3" name="reservation_sympton"></textarea>                            	
             	</div>
             	<br>
             	<div>
       				<label>날짜입력<label>
       				<input type="date" min="2022-08-01" max="2099-12-31" name="reservation_date" step="1">
             	</div>
<!--              	<br>
             	<div>
             		<label>시간</label>
             		<input type="time" class="timepicker form-control1" name="reservation_time">
	            </div> -->
             	<br>
             	<div>
					<label for="pet-select">Choose a Time</label>
					<select name="reservation_time" id="pet-select">
						<option value="09:00">09:00</option>
						<option value="09:30">09:30</option>
						<option value="10:00">10:00</option>
						<option value="10:30">10:30</option>
						<option value="11:00">11:00</option>
						<option value="11:30">11:30</option>
						<option value="14:00">14:00</option>
						<option value="14:30">14:30</option>
						<option value="15:00">15:00</option>
						<option value="15:30">15:30</option>
						<option value="16:00">16:00</option>
						<option value="16:30">16:30</option>
						<option value="17:00">17:00</option>
						<option value="17:30">17:30</option>
					</select>
				</div>
				<br>
             
             	<button type="submit" class="btn btn-default" >Submit Button</button>
             	<button type="reset" class="btn btn-default" >Reset Button</button>
             </form>
			</div>
            
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
            
            
<script type="text/javascript">
$(document).ready(function () {
	$('input.timepicker').timepicker({
       timeFormat: 'HH:mm',
       interval: 30,
       startTime: '00:00',
       dynamic: false,
       dropdown: true,
       scrollbar: true
    });
});


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