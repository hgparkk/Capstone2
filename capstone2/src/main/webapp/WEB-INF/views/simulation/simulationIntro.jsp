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
				<div class="col-lg-8 col-xl-7 mt-5">
					<div>
						<div class="pt-3 ps-3 pe-3 context">
							<div class="fs-2 pt-3 fw-bold text-primary-emphasis">시뮬레이션 스토리보드</div>
							<div class="pt-5 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div>
									<div class="fs-5">시뮬레이션 시작 버튼을 누르면 랜덤하게 기업, 종목이 선택됩니다.</div>
									<div class="text-success">(종목은 보여지지 않습니다.)</div>
								</div>
							</div>
							<div class="pt-3 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div class="fs-5">시뮬레이션은 해당 종목이 마감되는 날로 부터 1년 전 부터 시작됩니다.</div>
							</div>
							<div class="pt-3 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div class="fs-5">사용자는 날마다 일정량의 탄소 배출권을 구매, 판매 혹은 아무 행동도 하지 않고 날을 넘길 수 있습니다.</div>
							</div>
							<div class="pt-3 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div class="fs-5">시뮬레이션이 끝나면 탄소 배출권 구매량, 최종 허용 배출량, 인증 배출량과의 차이, 수익 등의 시뮬레이션의 결과를 보여줍니다.</div>
							</div>
							<div class="pt-3 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div class="fs-5">해당 시뮬레이션의 결과 및 로그를 저장 할 수 있습니다.</div>
							</div>
							<div class="pt-3 d-flex">
								<span class="drag-block dot">&#183;</span>
								<div class="fs-5 text-danger">시뮬레이션 도중 시뮬레이션 페이지를 나가거나 새로고침을 하면 데이터를 잃습니다.</div>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-center">
						<button id="simuStart" class="btn btn-primary btn-lg me-3" type="button">시뮬레이션 시작</button>
						<button id="simulationLogView" class="btn btn-primary btn-lg ms-3" type="button">저장된 시뮬레이션 보기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="bottom"></div>
	<script>
		document.getElementById("simuStart").addEventListener("click",()=>{
			let loginInfo = "${sessionScope.login.userId}"
			if(loginInfo == ""){
				if(confirm("로그인이 필요합니다.\n로그인 창으로 이동하시겠습니까?")){
					location.href = "${pageContext.request.contextPath}" + "/loginView"
				}
			}else{
				location.href = "${pageContext.request.contextPath}" + "/simulationSet"
			}
		})
		
		document.getElementById("simulationLogView").addEventListener("click",()=>{
			let loginInfo = "${sessionScope.login.userId}"
			if(loginInfo == ""){
				if(confirm("로그인이 필요합니다.\n로그인 창으로 이동하시겠습니까?")){
					location.href = "${pageContext.request.contextPath}" + "/loginView"
				}
			}else{
				location.href = "${pageContext.request.contextPath}" + "/simulationLogView"
			}
		})
	</script>
</body>

</html>