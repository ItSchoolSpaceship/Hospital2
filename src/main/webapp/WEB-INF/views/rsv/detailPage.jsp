<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%-- <c:set var="reservation"  value="${detail.reservation}"  />
<c:set var="member"  value="${detail.member}"  /> --%>

<%@include file="../includes/header.jsp" %>


	<h1 align="center">예약 페이지</h1>
	<form>
		<ul>
			<li>예약번호:${reserv.reservation_number}</li>
			<li>아이디:${reserv.member_id}</li>
 			<li>예약날짜:${reserv.reservation_date}</li>
			<li>시간:${reserv.reservation_time}</li>
			<li>증상:${reserv.reservation_sympton}</li>
			<li>이름:${member.member_name}</li>
			<li>전화번호:${member.member_phone}</li>
		</ul>
	</form>
	
		
<%-- 		<tr align="center" >
			<td><c:out value="${list.reservation_number}" /></td>
			<td>${list.member_id }</td>
			<td>${list.reservation_date}</td>
			<td>${list.reservation_time}</td>
			<td>${list.reservation_sympton}</td> --%>
			
<%@include file="../includes/footer.jsp" %>