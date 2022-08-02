<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>/sample/admin page</h1>
	<p>principal : <sec:authentication property="principal"/></p>
	<p>MemberVO : <sec:authentication property="principal.member"/></p>
	<p>사용자이름: <sec:authentication property="principal.member.member_name"/></p>
	<p>핸드폰: <sec:authentication property="principal.member.member_phone"/></p>
	<p>사용자아이디 : <sec:authentication property="principal.username"/></p>
	<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList"/></p>
<form action="/member/logout" method='post'>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	<button>로그아웃</button>
	</form>
</body>
</html>