<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
<h1>회원가입 페이지 입니다.</h1>

<form action="/member/join" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>

<table>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="member_id"> <input type="button" value="중복확인"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="member_pwd"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="member_name"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="member_address"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="member_email"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="member_phone"></td>
	</tr>
</table>
	<input type="submit" value="회원가입하기">
	<input type="button" value="취소">

</form>

</body>
</html>