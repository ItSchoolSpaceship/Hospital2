<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>QnA 등록</h1>
	<form role="form" action="/qna/register" method="post">
	
		<div class="input_wrap">
			<label>Title</label>
			<input name="qna_title">
		</div>
		
		<div class="input_wrap">
			<label>Content</label>
			<textarea rows="3" name="qna_content"></textarea>
		</div>
		
		<div class="input_wrap">
			<label>Writer</label>
			<input name="qna_writer">
		</div>
		
		<button type="submit" class="btn">등록</button>
		<button type="reset" class="btn">다시 쓰기</button>
	
	
	</form>
	
</body>
</html>