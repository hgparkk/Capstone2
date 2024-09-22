<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit-no" />
<title>배출권 시장 시뮬레이터</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<style>
.this-img {
	width: 100%;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/inc/navbar.jsp">
		<jsp:param value="true" name="buttonAble" />
	</jsp:include>

	<section class="page-section">
		<div class="container pt-5">
			<div class="row justify-content-center">
				<jsp:include page="/WEB-INF/inc/top.jsp">
					<jsp:param value="탄소시장 소개" name="title" />
					<jsp:param value="true" name="borderShow" />
				</jsp:include>
				<div class="col-lg-8 col-xl-7">
					<div>
						<div class="pt-3 ps-3 pe-3 context">
							<div class="fs-2 border-bottom border-2 border-dark-subtle pt-3">탄소 시장이란?</div>
							<div class="pt-1 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div>배출권 거래제에 참여하고 있는 기업들이 탄소 배출권을 거래하기 위해 형성된 거래소로, 한국은 현재 한국거래소(KRX) 에서 운영중입니다.</div>
							</div>
							<div class="fs-2 border-bottom border-2 border-dark-subtle pt-5">배출권 거래제란?</div>
							<div class="pt-1 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div>탄소 배출량이 증가함에 따라 탄소중립을 실현하기 위해 배출권 거래제 회원에서 시행하는 제도입니다.</div>
							</div>
							<div class="fs-2 border-bottom border-2 border-dark-subtle pt-5">배출권 거래제의 메커니즘</div>
							<div class="pt-1 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div>환경부는 배출권 거래제 회원에게 특정 연도에 대한 배출량을 할당해주고, 배출권 거래제 회원은 이 할당량에 따른 탄소 배출권을 가집니다.</div>
							</div>
							<div class="pt-1 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div>배출권 거래제 회원은 매년 탄소 배출량을 인증하고 인증된 배출량에 따라 여유분과 부족분이 생기게 됩니다.</div>
							</div>
							<div class="pt-1 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div>
									여유분은 <span class="text-primary">탄소배출권으로 타 기업에게 판매</span>가 가능하고 <span class="text-danger">부족분은 탄소 배출권을 구매</span>하여 채워야 합니다.
								</div>
							</div>
							<img class="this-img pt-3" src="<c:url value="/image/OPN01050401.png" />">
							<div class="pt-5 d-flex justify-content-between item-aligns-center">
								<span class="fs-6 fw-bold">출처</span>
								<a href="https://ets.krx.co.kr/main/main.jsp">배출권시장 정보 플랫폼</a>
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