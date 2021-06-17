<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redirect View</title>
<script type="text/javascript" src="/project/assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#efrm').submit();
	});
</script>
</head>
<body>
	<form method="POST" action="${PATH}" name="efrm" id="efrm">
		<input type="hidden" name="msg" value="${MSG}" >
		<input type="hidden" name="mno" value="${MNO}" >
	</form>
</body>
</html>