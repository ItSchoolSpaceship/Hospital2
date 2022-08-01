<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<head>
	<style>
	
/* 	<section> 
	.div.panel-heading {
	position: relative;
    width: 100%;
    display: block;
    padding:105px 0;
    } */
  
   
    .ftco-section {
    position: relative;
    width: 100%;
    display: block;
	}

	.container {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
	}
	
    h6 {
	font-size: 30px;
    font-weight: 400;
    background: #2f89fc;
    background: linear-gradient(135deg, #2f89fc 0%, #2cbcbc 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#2f89fc', endColorstr='#00dc94', GradientType=1 );
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    margin-bottom: 1.5rem !important;
   
    }
 	
 	p {
 	 margin-bottom: 1.5rem !important;
 	}
 	
 	th {
 	text-align: center;
 	}
 </style>
</head>

<!-- /.row -->

<section class - "ftco-section">
<div class="container">
	<div class="row">
	<div class="col-lg-12">
	 <div class-"row justify-content-center mb-6 pb-5">
		<div class="panel panel-default">
		 <div class="col-md-7 text-center heading-section ftco-animate">
			<div class="ftco-section">	
			<div class="panel-heading">
				<h6>고객의 소리를 귀담아 듣겠습니다</h6>
				<p> 불편사항이나 개선사항을 말씀해주시면 반영하겠습니다. </p>
				<button id='regBtn' type="button" class="btn btn-xs pull-right">
						작성하기</button>
					<form id='searchForm' action="/voc/list" method='get'>
					 
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T' ?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C' ?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W' ?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC' ?'selected':''}"/>>제목 or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW' ?'selected':''}"/>>제목 or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC' ?'selected':''}"/>>제목 or 내용 or 작성자</option>
							</select> 
							<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'/> 
							<input type='hidden'name='pageNum' value='<c:out value="${pageMaker.cri.pageNum }"/>'/> 
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount }"/>'/>
							
							<button class='btn btn-default'>이전 글 검색</button>
						</form>	
					</div>
				</div>
			</div>
		</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>

					<c:forEach items="${list }" var="board">
						<tr>
							<td><c:out value="${board.board_number }" /></td>
							<td><a class='move' href='<c:out value="${board.board_number }"/>'>
									<c:out value="${board.board_title }" /></a></td>
							<td><c:out value="${board.board_writer }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.board_regdate }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.board_updatedate }" /></td>
						</tr>
					</c:forEach>
				</table>

			<div class='row'>
				<div class='col-lg-12'>

					

				</div>
			</div>

			<div class="pull-right">
				<ul class="pagination">
						
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous"><a
							href="${pageMaker.startPage -1 }">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }">
								<a href="${num }">${num }</a>
							</li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
					</c:if>

					</ul>
				</div>
			</div>
	</section>
			<form id='actionForm' action="/voc/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'> 
				<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
				<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'/>
				<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
			</form>

			<!-- modal 추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">알림창</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		var result = '<c:out value="${result}"/>';

		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {

			if (result === '' || history.state)
				return;

			//=== value와 data type 비교 ex)num=100; num===100(true)
			//num==='100'(false)

			if (parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}

			$("#myModal").modal("show");
		}

		$("#regBtn").on("click", function() {

			self.location = "/voc/register";

		});

		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {

			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		$(".move").on(
				"click",
				function(e) {

					e.preventDefault();
					actionForm.append("<input type='hidden' name='board_number' value='"
							+ $(this).attr("href") + "'>");
					actionForm.attr("action", "/voc/get");
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
	<script>
		$(document).ready(function() {
		$('#dataTables-example').DataTable({ responsive: true});
		$(".sidebar-nav")
			.attr("class", "sidebar-nav navbar-collapse collapse")
			.attr("aria-expanded", 'false')
			.attr("style", "height:1px");
		});
	</script>
	
<%@ include file="../includes/footer.jsp"%>