<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!-- [출처] [Spring Security] #6 스프링부트 회원가입 및 로그인하기 - View 연결하기, 로그인 세션 정보 확인, Security taglibs|작성자 sosow0212 -->


<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" align="center">Board Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
			
			<div>
			
             <form role="form" action="/rsv/register" method="post" align="center" >
             <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
             	<div class="form-group" >
             		<label>아이디</label>
 					 <input class="form-control1" name="member_id" >
 <%--  					<input type="text" name="member_id" placeholder="이름" value="${principal.MemberVo.member_id }"> --%>
             	</div> 
             	<div class="form-group">
             		<label>증상</label>
             		<textarea class="form-control1" rows="3" name="reservation_sympton"></textarea>                            	
             	</div>
             
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
	});
</script>


<%@include file="../includes/footer.jsp" %>