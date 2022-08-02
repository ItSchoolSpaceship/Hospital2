<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>DentaCare - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">

    <link rel="stylesheet" href="/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/resources/css/flaticon.css">
    <link rel="stylesheet" href="/resources/css/icomoon.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="/main">유나이티드<span>치과</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="/main" class="nav-link">홈</a></li>
	          <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="services.html" class="nav-link">Services</a></li>
	          <li class="nav-item"><a href="doctors.html" class="nav-link">의료진</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">고객의 소리</a></li>
	          <li class="nav-item"><a href="http://localhost:9090/controller/map" class="nav-link">오시는 길</a></li>
	          <li class="nav-item cta"><a href="/register" class="nav-link" data-toggle="modal" data-target="#modalRequest"><span>예약하기</span></a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

    <section class="home-slider owl-carousel">
      <div class="slider-item bread-item" style="background-image: url('/resources/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container" data-scrollax-parent="true">
          <div class="row slider-text align-items-end">
            <div class="col-md-7 col-sm-12 ftco-animate mb-5">
              <p class="breadcrumbs" data-scrollax=" properties: { translateY: '70%', opacity: 1.6}"><span class="mr-2"></span></p>
              <h1 class="mb-3" data-scrollax=" properties: { translateY: '70%', opacity: .9}">고객의 소리</h1>
            </div>
          </div>
        </div>
      </div>
    </section>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
	
    h7 {
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
				<h7 class="mb-3">고객의 소리를 귀담아 듣겠습니다</h7>
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