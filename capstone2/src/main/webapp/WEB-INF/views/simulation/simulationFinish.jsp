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
		<jsp:param value="false" name="buttonAble" />
	</jsp:include>

	<section class="page-section">
		<div class="container pt-5">
			<div class="row justify-content-center">
				<jsp:include page="/WEB-INF/inc/top.jsp">
					<jsp:param value="시뮬레이션" name="title" />
					<jsp:param value="false" name="borderShow" />
				</jsp:include>
				<div class="col-lg-8 col-xl-7 mt-5">
					<form action="<c:url value="/simulationSave" />" method="POST">
						<div>
							<div class="pt-3 ps-3 pe-3 context">
								<div class="pt-3 d-flex justify-content-center">
									<span class="fs-2 fw-bold">시뮬레이션이 종료되었습니다</span>
								</div>
								<div class="pt-3 d-flex justify-content-center">
									<div class="fs-3">시뮬레이션 결과</div>
								</div>
								<div class="border border-info p-5">
									<div class="pt-5">
										<div class="fs-5">시뮬레이션 기업 : ${quota.companyName} (${quota.companyKind})</div>
									</div>
									<div class="pt-3">
										<div class="fs-5">
											총 수익 :
											<span id="revenueShow"></span>
											(원)
										</div>
									</div>
									<div class="pt-3">
										<div class="fs-5">
											최종 초과 및 잉여 탄소 배출량 :
											<c:if test="${totalValue > 0}">
												<span class="text-success">${totalValue}</span> (톤)
											</c:if>
											<c:if test="${totalValue == 0}">
												<span>${totalValue}</span> (톤)
											</c:if>
											<c:if test="${totalValue < 0}">
												<span class="text-danger">${totalValue}</span> (톤)
											</c:if>
										</div>
										<div>(음수는 초과 배출량, 양수는 잉여 배출량 입니다)</div>
									</div>
									<div class="pt-3">
										<div class="fs-5">시뮬레이션 이름 정하기</div>
									</div>
									<div>
										<input class="form-control" type="text" name="simuAlias">
										<input type="hidden" name="simuNo" value="${simuNo}">
										<input type="hidden" name="userId" value="${sessionScope.login.userId}">
										<input type="hidden" name="quotaNo" value="${quota.quotaNo}">
										<input type="hidden" name="companyName" value="${quota.companyName}">
										<input type="hidden" name="simuRevenue" value="${revenue}">
										<input type="hidden" name="simuValue" value="${totalValue}">
									</div>
									<div>
										<span>(시뮬레이션 이름을 정하지 않고 저장하면 기본 이름으로 설정됩니다.)</span>
									</div>
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-center">
							<button class="btn btn-primary btn-lg me-2" type="submit">시뮬레이션 저장</button>
							<a href="<c:url value="/simulationIntro" />">
								<button class="btn btn-secondary btn-lg ms-2" type="button">저장하지 않고 나가기</button>
							</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<div class="bottom"></div>
	<script>
		const revenue = ${revenue}
		if(revenue > 0){
			document.getElementById("revenueShow").classList.add("text-success")
		}else if(revenue < 0){
			document.getElementById("revenueShow").classList.add("text-danger")
		}
		document.getElementById("revenueShow").innerHTML = revenue.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
	</script>
</body>

</html>