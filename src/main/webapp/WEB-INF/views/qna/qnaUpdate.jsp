<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result == 1}">
	<script type="text/javascript">
		alert('글수정 성공');
		location.href = "qnaList";
	</script>
	</c:if>
	
	<c:if test="${result != 1}">
	<script type="text/javascript">
		alert('글수정 실패');
		history.go(-1);
	</script>
	</c:if>


</body>
</html>