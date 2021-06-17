<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/project/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#frm').submit();
	});
	
</script>
</head>
<body>
	<form method="POST" action="${PATH}" name="frm" id="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${nowPage}">
<c:if test="${PATH ne '/project/notice/noticeList.proj'}">
		<input type="hidden" name="notice_no" value="${notice_no}">
		<input type="hidden" name="mno" value="${notice_no}">
</c:if>
	</form>
</body>
</html>