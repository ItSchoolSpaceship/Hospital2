<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 수정 페이지</title>
</head>
<body>
	<form role="form" action="/rsv/modify" method="post">

		<div class="panel-heading">예약 수정</div>
		<div class="form-group">
			<%-- <label>예약번호</label> <input class="form-control" name='number'
				value='<c:out value="${board.reservation_number }" />' readonly="readonly"> --%>
				<label>예약 날짜</label> <input class="form-control"
							name='updateDate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.
			reservation_time }" /> '
							readonly="readonly">
		</div>
		

	</form>
</body>
</html>