<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
					<jsp:param value="시뮬레이션" name="title" />
					<jsp:param value="true" name="borderShow" />
				</jsp:include>
				<div class="col-lg-8 col-xl-7 mt-5 context">
					<div class="d-flex flex-column align-items-center">
						<span class="mb-3 fw-6 fw-bold">시뮬레이션 정보</span>
						<div class="border border-info p-5">
							<div class="pt-5">
								<div class="fs-5">시뮬레이션 기업 : ${simulation.companyName} (${simulation.companyKind})</div>
							</div>
							<div class="pt-3">
								<div class="fs-5">
									총 수익 :
									<c:if test="${simulation.simuRevenue > 0}">
										<span class="text-success">
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${simulation.simuRevenue}" />
										</span>
									</c:if>
									<c:if test="${simulation.simuRevenue == 0}">
										<span>
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${simulation.simuRevenue}" />
										</span>
									</c:if>
									<c:if test="${simulation.simuRevenue < 0}">
										<span class="text-danger">
											<fmt:formatNumber type="number" maxFractionDigits="3" value="${simulation.simuRevenue}" />
										</span>
									</c:if>
									(원)
								</div>
							</div>
							<div class="pt-3">
								<div class="fs-5">
									최종 초과 및 잉여 탄소 배출량 :
									<c:if test="${simulation.simuValue > 0}">
										<span class="text-success">${simulation.simuValue}</span> (톤)
									</c:if>
									<c:if test="${simulation.simuValue == 0}">
										<span>${simulation.simuValue}</span> (톤)
									</c:if>
									<c:if test="${simulation.simuValue < 0}">
										<span class="text-danger">${simulation.simuValue}</span> (톤)
									</c:if>
								</div>
								<span class="mb-3 fw-6 fw-bold">시뮬레이션 로그</span>
								<table id="simulationList" class="table table-hover">
									<thead>
										<th class="col">거래일</th>
										<th class="col">거래 가격</th>
										<th class="col">거래량</th>
										<th class="col">수익변동량</th>
									</thead>
									<tbody>
										<c:forEach items="${simulationLogList}" var="simulationLog">
											<tr>
												<td scope="row"><fmt:formatDate value="${simulationLog.kauDate}" pattern="MM월 dd일 E" /></td>
												<td>${simulationLog.kauValue}</td>
												<td>${simulationLog.simulogValue}</td>
												<c:if test="${simulationLog.kauValue * simulationLog.simulogValue * -1 > 0}">
													<td class="text-success"><fmt:formatNumber type="number" maxFractionDigits="3" value="${simulationLog.kauValue * simulationLog.simulogValue * -1}" /></td>
												</c:if>
												<c:if test="${simulationLog.kauValue * simulationLog.simulogValue * -1 == 0}">
													<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${simulationLog.kauValue * simulationLog.simulogValue * -1}" /></td>
												</c:if>
												<c:if test="${simulationLog.kauValue * simulationLog.simulogValue * -1 < 0}">
													<td class="text-danger"><fmt:formatNumber type="number" maxFractionDigits="3" value="${simulationLog.kauValue * simulationLog.simulogValue * -1}" /></td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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