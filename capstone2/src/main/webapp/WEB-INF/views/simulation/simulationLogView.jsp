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
					<jsp:param value="시뮬레이션" name="title" />
					<jsp:param value="true" name="borderShow" />
				</jsp:include>
				<div class="col-lg-8 col-xl-7 mt-5 context">
					<div class="d-flex flex-column align-items-center">
						<span class="mb-3 fw-6 fw-bold">시뮬레이션 목록</span>
						<table id="simulationList" class="table table-hover">
							<thead>
								<th class="col">번호</th>
								<th class="col">시뮬레이션 이름</th>
								<th class="col">총 수익</th>
								<th class="col">최종 탄소배출 허용량</th>
							</thead>
							<tbody>
								<c:forEach items="${simulationList}" var="simulation">
									<tr>
										<td scope="row">${simulation.simuNo}</td>
										<td><a href="<c:url value="/simulationLogDetailView?simuNo=${simulation.simuNo}" />">${simulation.simuAlias}</a></td>
										<td>${simulation.simuRevenue}</td>
										<td>${simulation.simuValue}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="bottom"></div>
</body>

</html>