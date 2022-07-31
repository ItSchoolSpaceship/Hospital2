<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%-- <c:set var="reservation"  value="${detail.reservation}"  />
<c:set var="member"  value="${detail.member}"  /> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	<%-- <table border="1" align="center" >
		<tr align="center">
			<td width="10%">예약번호:${detail.reservation_number} </td>
			<td width="20%">아이디</td>
			<td width="20%">예약날짜</td>
			<td width="20%">시간</td>
			<td width="20%">증상</td>
		</tr>
		<tr align="center" >
			<td><c:out value="${detail.reservation_number}" /></td>
			<td>${detail.member_id }</td>
			<td>${detail.reservation_date}</td>
			<td>${detail.reservation_time}</td>
			<td>${detail.reservation_sympton}</td>
		</tr> --%>
			<%-- <c:forEach items="${detail }" var="board">
						<tr>
							<td><c:out value="${board.reservation_number }" /></td>
							<td><c:out value="${board.member_id }" /></a></td>
							<td><c:out value="${board.reservation_date }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.reservation_time }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.reservation_sympton }" /></td>
						</tr>
					</c:forEach> --%>
		
				<%-- <table width="100%"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>

					<c:forEach items="${list }" var="board">
						<tr>
							<td><c:out value="${board.bno }" /></td>
							<td><a class='move' href='<c:out value="${board.bno }"/>'>
									<c:out value="${board.title }" /></a></td>
							<td><c:out value="${board.writer }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate }" /></td>
						</tr> 
					</c:forEach>--%>
				</table>
		
<%-- 		<tr align="center" >
			<td><c:out value="${list.reservation_number}" /></td>
			<td>${list.member_id }</td>
			<td>${list.reservation_date}</td>
			<td>${list.reservation_time}</td>
			<td>${list.reservation_sympton}</td> --%>
			
<!-- 				private Long reservation_number;
	private String member_id;
	private Date reservation_date;
	private Date reservation_time;
	private String reservation_sympton; -->
		</tr>
	</table>
</body>
</html>