<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
</head>
<body>
<h1>로그인 페이지 입니다.</h1>
<form method='post' action="/login">
<div>
	<input type='text' name='username' value='admin'>
</div>
<div>
	<input type='password' name='password' value='admin'>
</div>
<div>
	<input type='submit'>
</div>
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
</form>

</body>
</html>