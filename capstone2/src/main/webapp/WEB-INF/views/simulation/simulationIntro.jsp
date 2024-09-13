<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit-no" />
<title>시뮬레이션</title>
<%@ include file="/WEB-INF/inc/header.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/inc/navbar.jsp"%>

	<section class="page-section">
		<div class="container pt-5">
			<div class="row justify-content-center">
				<jsp:include page="/WEB-INF/inc/top.jsp">
					<jsp:param value="시뮬레이션" name="title" />
					<jsp:param value="true" name="borderShow" />
				</jsp:include>
				<div class="col-lg-8 col-xl-7 mt-5">
					<div>
						<div class="pt-3 ps-3 pe-3 context">
							<div class="fs-2 pt-3">시뮬레이션 스토리보드</div>
							<div class="pt-1 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div>시뮬레이션 시작 버튼을 누르면 랜덤하게 기업, 종목이 선택된다.</div>
							</div>
							<div class="pt-1 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div>환경부는 배출권 거래제 회원에게 특정 연도에 대한 배출량을 할당해주고, 배출권 거래제 회원은 이 할당량에 따른 탄소 배출권을 가진다.</div>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-center">
						<button class="btn btn-primary btn-lg" type="button">시뮬레이션 시작</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

</html>