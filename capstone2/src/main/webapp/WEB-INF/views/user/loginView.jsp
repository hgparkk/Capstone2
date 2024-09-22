<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit-no" />
<title>배출권 시장 시뮬레이터</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
</head>

<body>
	<jsp:include page="/WEB-INF/inc/navbar.jsp">
		<jsp:param value="true" name="buttonAble" />
	</jsp:include>
	
	<section class="page-section">
		<div class="container pt-5">
			<div class="row justify-content-center">
				<jsp:include page="/WEB-INF/inc/top.jsp">
					<jsp:param value="로그인" name="title" />
					<jsp:param value="false" name="borderShow" />
				</jsp:include>
				<div class="col-lg-8 col-xl-7 mt-5">

					<!-- 로그인 폼 -->
					<form action="<c:url value="/loginDo" />" method="POST">

						<!-- 로그인 요청을 한 URL -->
						<input type="hidden" value="${fromUrl}" name="fromUrl">

						<!-- ID 입력창 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputId" type="text" name="userId" />
							<label for="inputId">아이디</label>
						</div>

						<!-- PW 입력창 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputPw" type="password" name="userPw" />
							<label for="inputPw">비밀번호</label>
						</div>

						<!-- 로그인 실패 메시지 -->
						<div class="mb-3">
							<span class="text-danger">${failMsg}</span>
						</div>

						<!-- 회원가입 ID/PW 찾기 버튼 -->
						<div class="d-flex justify-content-center mb-3">
							<a class="me-1 text-black cursor-pointer" href="<c:url value="/registView" />">회원가입</a>
							<a class="ms-1 text-black cursor-pointer" href="<c:url value="/idpwFindView" />">ID/PW 찾기</a>
						</div>

						<!-- 로그인 버튼 -->
						<div class="d-flex justify-content-center">
							<button class="btn btn-primary btn-lg" type="submit">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<div class="bottom"></div>
</body>

</html>