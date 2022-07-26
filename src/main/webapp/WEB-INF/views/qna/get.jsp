<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <style>
<style type="text/css">
.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;
    font-size: 20px;	
}
input{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 10px;
}
.btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 140px;
    height: 41px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
}
</style>
</head>
<body>
<h1>QnA 페이지</h1>
	<div class="input_wrap">
		<label>번호</label>
		<input name="qna_number" readonly="readonly" value='<c:out value="${qna.qna_number}"/>' >
	</div>
	
	<div class="input_wrap">
		<label>member_id</label>
		<input name="member_id" readonly="readonly" value='<c:out value="${qna.member_id}"/>'> 
	</div>
	<div class="input_wrap">
		<label>제목</label>
		<input name="qna_title" readonly="readonly" value='<c:out value="${qna.qna_title}"/>' >
	</div>
	<div class="input_wrap">
		<label>내용</label>
		<textarea rows="3" readonly="readonly" name="qna_content"><c:out value="${qna.qna_content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>작성자</label>
		<input name="qna_writer" readonly="readonly" value='<c:out value="${qna.qna_writer}"/>' >
	</div>
	
<%-- 	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 수정일</label>
		<input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>' >
	</div> --%>
			
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록 페이지</a> 
		<a class="btn" id="modify_btn">수정 하기</a>
	</div>
	
	<form id="infoForm" action="/qna/modify" method="get">
	<input type="hidden" name="${_csrf.parameterName }"
								value="${_csrf.token }" />
	
		<input type="hidden" id="qna_number" name="qna_number" value='<c:out value="${qna.qna_number}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
		
	</form>

<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#qna_number").remove();
		form.attr("action", "/qna/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/qna/modify");
		form.submit();
	});	
</script>
	
</body>
</html>