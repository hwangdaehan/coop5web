<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ERROR</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		setTimeout(function() { history.back(); }, 3000);
	});
</script>
</head>
<body>
	<h1>3초 뒤에 전 페이지로 리다이렉트 됩니당 ㅎㅎ</h1>
	<h4>${exception.getMessage()}</h4>
	<ul>
		<c:forEach items="${exception.getStackTrace()}" var="stack">
			<li>${stack.toString()}</li>
		</c:forEach>
	</ul>
</body>
</html>