<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="ko">

<head>
<meta charset="UTF-8">
<title>배출권 시장 시뮬레이터</title>
</head>

<body>
	<script>
		let alertMsg = "<c:out value='${msg}'/>"
		let alertUrl = "<c:out value='${url}'/>"

		alert(alertMsg)
		location.replace("${pageContext.request.contextPath}" + alertUrl)
	</script>
</body>

</html>