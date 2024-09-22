<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="ko">

<head>
<meta charset="UTF-8" />
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
					<jsp:param value="페이지 소개" name="title" />
					<jsp:param value="true" name="borderShow" />
				</jsp:include>
				<div class="col-lg-8 col-xl-7">
					<div>
						<div class="pt-3 ps-3 pe-3 context">
							<div class="fs-2 border-bottom border-2 border-dark-subtle pt-3">개요</div>
							<div class="pt-1">
								<span class="drag-block dot">&#183;</span>실제 탄소시장의 데이터를 이용하여 가상 환경에서 탄소 배출권 거래를 시뮬레이션 할 수 있습니다.
							</div>
							<div class="fs-2 border-bottom border-2 border-dark-subtle pt-5">필요성</div>
							<div class="pt-1">
								<span class="drag-block dot">&#183;</span>탄소 배출권 거래 전략 학습을 위한 거래 가상 환경 제공
							</div>
							<div class="fs-2 border-bottom border-2 border-dark-subtle pt-5">목적</div>
							<div class="pt-1">
								<span class="drag-block dot">&#183;</span>탄소 시장과 탄소 배출권에 대한 이해
							</div>
							<div class="pt-1">
								<span class="drag-block dot">&#183;</span>탄소 시장 탄생 배경인 탄소 중립의 중요성과 의의 재확립
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="bottom"></div>
</body>

</html>