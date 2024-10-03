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
		<jsp:param value="false" name="buttonAble" />
	</jsp:include>

	<section class="page-section">
		<div class="container pt-5">
			<div class="row justify-content-center">
				<jsp:include page="/WEB-INF/inc/top.jsp">
					<jsp:param value="시뮬레이션" name="title" />
					<jsp:param value="false" name="borderShow" />
				</jsp:include>
				<div class="d-flex">
					<div class="d-flex flex-column col-8">
						<div class="d-flex justify-content-center">
							<span class="fs-5 text-danger">다음 날로 넘기면 다시 이전 날로 되돌아 갈 수 없습니다. 주의하여 주세요.</span>
						</div>
						<div class="mt-5 d-flex flex-column align-items-center">
							<div class="fs-3">현재 기업 : ${quota.companyName} (${quota.companyKind})</div>
							<div class="fs-4">
								초과 및 잉여 탄소 배출량 :
								<span id="finalTotalValue">${quota.quotaValue - quota.quotaValidValue}</span>
								(톤)
							</div>
							<div>(음수는 초과 배출량, 양수는 잉여 배출량 입니다)</div>
							<div class="banner"></div>
							<div class="mt-3 mb-3 fs-5">
								현재 탄소배출권 시세 :
								<span id="kauValue">${kau.kauValue}</span>
								(원) (
								<span id="kauDef" class="text-secondary">-</span>
								)
							</div>
							<div class="mt-3 mb-3">
								현재 날짜 :
								<span id="currentDate">
									<fmt:formatDate value="${kau.kauDate}" pattern="MM월 dd일 E" />
								</span>
							</div>
							<div class="mt-3 mb-3">
								시뮬레이션이 종료될 때까지 남은 거래일 :
								<span id="leftDay">${kauCount-kauSelect.kauSeq}</span>
								일
							</div>
							<div class="mt-3 mb-3">
								총 수익 :
								<span id="revenue">0</span>
								(원)
							</div>
							<div class="mt-5 mb-5">
								<div class="mt-3 mb-3">
									매매량 입력 (톤)
									<span class="text-danger"> (한번 매매시 매매 버튼이 비활성화 됩니다. 주의하여 주세요.) </span>
								</div>
								<div class="d-flex flex-column align-items-center">
									<div class="d-flex" style="width: 400px;">
										<div style="width: 150px;">
											<div class="form-check">
												<input id="buySelect" class="form-check-input" type="radio" name="buySellSelect" value="buy">
												<label class="form-check-label" for="buySelect">구매</label>
											</div>
											<div class="form-check">
												<input id="sellSelect" class="form-check-input" type="radio" name="buySellSelect" value="sell">
												<label class="form-check-label" for="sellSelect">판매</label>
											</div>
										</div>
										<input id="inputSimuLogValue" type="number" class="form-control">
										<button id="buySellButton" class="btn btn-outline-secondary" type="button" style="width: 80px;">매매</button>
									</div>
									<div class="mt-3 mb-3">
										<button id="simulationNextDayDo" class="btn btn-light btn-outline-dark" type="button">다음날로</button>
									</div>
									<form id="simulationEnd" action="<c:url value="/simulationEnd" />" method="POST">
										<input type="hidden" name="simuNo" value="${simuNo}" />
										<input type="hidden" name="companyName" value="${quota.companyName}">
										<input type="hidden" name="companyKind" value="${quota.companyKind}">
										<input type="hidden" name="quotaNo" value="${quota.quotaNo}" />
										<input id="simuRevenue" type="hidden" name="simuRevenue" />
										<input id="simuFianlvalue" type="hidden" name="simuFianlvalue" />
									</form>
									<div class="mt-3 mb-3">
										<button id="simulationEndBtn" class="btn btn-light btn-outline-dark" type="button">시뮬레이션 종료</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="d-flex flex-column align-items-center col-4">
						<span class="mb-3 fw-6 fw-bold">시뮬레이션 로그</span>
						<table id="simulationLog">
							<tr>
								<th><span class="ms-2 me-2">거래일</span></th>
								<th><span class="ms-2 me-2">거래가격</span></th>
								<th><span class="ms-2 me-2">거래량</span></th>
								<th><span class="ms-2 me-2">수익변동량</span></th>
							</tr>
						</table>
						<span id="noLogNotice">등록된 로그가 없습니다.</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="bottom"></div>
	<script>
		// 해당 시뮬레이션 번호
		const v_simuNo = ${simuNo}
	
		// 해당 종목의 총 거래일
		const v_kauCount = ${kauCount}
		
		// 현재 종목
		const v_kauKind = "${kauSelect.kauKind}"
		
		// 현재 시세 번호
		let v_kauNo = ${kau.kauNo}
			
		// 현재 시세
		let v_kauValue = ${kau.kauValue}
			
		// 현재 시세에 대한 document
		let v_kauValueDoc = document.getElementById("kauValue")
			
		// 현재 시세와 전날 시세와의 차이 document
		let v_kauDef = document.getElementById("kauDef")
		
		// 현재 날짜에 대한 document
		const v_currentDate = document.getElementById("currentDate")
		
		// 진행한 거래일
		let v_kauSeq = 1
		
		// 남은 거래일에 대한 document
		const v_leftDay = document.getElementById("leftDay")
	
		// 총 수익
		let v_revenue = 0
		
		// 총 수익에 대한 document
		const v_revenueDoc = document.getElementById("revenue")
		
		// 매매한 총 탄소배출권 량
		let v_totalValue = 0
		
		// 수익 3자리 , 표시 함수화 
		function revenueSet(curRevenue){
			if(curRevenue > 0){
				document.getElementById("revenue").classList.add("text-success")
			}else if(curRevenue < 0){
				document.getElementById("revenue").classList.add("text-danger")
			}
			document.getElementById("revenue").innerHTML = curRevenue.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
		}
		
		revenueSet(v_revenue);
		
		// 현재 매매량
		let v_simuLogValue = 0
		
		// 최종 탄소배출권 량
		const v_finalTotalValueDoc = document.getElementById("finalTotalValue")
		
		let v_finalTotalValue = parseInt(v_finalTotalValueDoc.innerHTML,10)
		
		if(v_finalTotalValue > 0){
			v_finalTotalValueDoc.classList.add("text-success")
		}else if(v_finalTotalValue == 0){
			v_finalTotalValueDoc.classList.add("text-secondary")
		}else{
			v_finalTotalValueDoc.classList.add("text-danger")
		}
	
		// 매매를 위한 document 선언
		const inputSimuLogValue = document.getElementById("inputSimuLogValue")
		
		const buySellButton = document.getElementById("buySellButton")
		
		buySellButton.addEventListener("click",()=>{
			v_simuLogValue = inputSimuLogValue.value;
			
			const buySellSelect = document.getElementsByName("buySellSelect")
			let buySellChoice = ""
			for(let i=0;i<buySellSelect.length;i++){
				if(buySellSelect[i].checked){
					buySellChoice = buySellSelect[i].value
				}
			}
			if(buySellChoice == "sell"){
				if(parseInt(${quota.quotaValue - quota.quotaValidValue} + v_totalValue) < 0){
					alert("보유한 탄소 배출권이 없습니다.")
					return
				}
				v_simuLogValue = v_simuLogValue * -1
			}else{
				v_simuLogValue = v_simuLogValue * 1
			}
			
			v_totalValue += v_simuLogValue
			v_revenue += v_simuLogValue * v_kauValue * -1
			
			for(let i=0;i<buySellSelect.length;i++){
				buySellSelect[i].disabled = true
			}
			buySellButton.disabled = true
		})
		
		// 다음날 행동 url
		const v_nextDayDoUrl = "<c:url value='/simulationNextDayDo' />"
		const v_getKAUforLogUrl = "<c:url value='/getKAUforLog' />"
		
		// 다음날 버튼 행동
		document.getElementById("simulationNextDayDo").addEventListener("click",()=>{
			$.ajax({
				type:'POST',
				url: v_nextDayDoUrl,
				data: { "simuNo" : v_simuNo, "kauNo" : v_kauNo, "simulogValue" : v_simuLogValue, "kauKind" : v_kauKind, "kauSeq" : v_kauSeq },
				success: function(result){
					if(v_kauSeq == v_kauCount - 1){
						document.getElementById("simuRevenue").value = v_revenue
						document.getElementById("simuFianlvalue").value = parseInt(${quota.quotaValue - quota.quotaValidValue} + v_totalValue)
				
						document.getElementById("simulationEnd").submit()
					}
					
					// 로그 만들기
					if(v_simuLogValue != 0){
						document.getElementById("noLogNotice").innerHTML = ""
						$.ajax({
							type:'POST',
							url: v_getKAUforLogUrl,
							data: {"kauNo":v_kauNo},
							success: function(result){
								const date = new Date(result["kauDate"])
								let dateString = ((date.getMonth() + 1) + "").padStart(2,"0") + "월 " + ((date.getDate()) + "").padStart(2,"0") + "일 "
								if(date.getDay() == 0){
									dateString +="일"
								}else if(date.getDay() == 1){
									dateString +="월"
								}else if(date.getDay() == 2){
									dateString +="화"
								}else if(date.getDay() == 3){
									dateString +="수"
								}else if(date.getDay() == 4){
									dateString +="목"
								}else if(date.getDay() == 5){
									dateString +="금"
								}else{
									dateString +="토"
								}
								
								let v_change = (parseInt(result["kauValue"]) * parseInt(v_simuLogValue)) * -1
								
								v_changeString = ""
								
								if(v_change > 0){
									v_change = v_change.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,",")
									v_change = "+" + v_change
									v_changeString = '</span></td><td><span class="ms-2 me-2 text-success">'+ v_change + " (원)" + '</span></th></tr>'
								}else if(v_change == 0){
									v_change = v_change.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,",")
									v_changeString = '</span></td><td><span class="ms-2 me-2">'+ v_change + " (원)" +'</span></th></tr>'
								}else{
									v_change = v_change.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,",")
									v_changeString = '</span></td><td><span class="ms-2 me-2 text-danger">'+ v_change + " (원)" +'</span></th></tr>'
								}
								
								document.getElementById("simulationLog").innerHTML += '<tr> <td><span class="ms-2 me-2">'+ dateString +
								'</span></td><td><span class="ms-2 me-2">'+ result["kauValue"] +
								'</span></td><td><span class="ms-2 me-2">'+ v_simuLogValue + v_changeString
							}
						})
					}
					
					// 초과 및 잉여 탄소 배출량에 있는 클래스 전부 지우기
					v_finalTotalValueDoc.classList.remove("text-success")
					v_finalTotalValueDoc.classList.remove("text-secondary")
					v_finalTotalValueDoc.classList.remove("text-danger")
					
					// 시세 차이에 있는 클래스 전부 지우기
					v_kauDef.classList.remove("text-success")
					v_kauDef.classList.remove("text-secondary")
					v_kauDef.classList.remove("text-danger")
					
					// 수익에 있는 클래스 전부 지우기
					document.getElementById("revenue").classList.remove("text-success")
					document.getElementById("revenue").classList.remove("text-secondary")
					document.getElementById("revenue").classList.remove("text-danger")
					
					// 초과 및 잉여 탄소 배출량 수치 바꾸기
					v_finalTotalValue = parseInt(${quota.quotaValue - quota.quotaValidValue} + v_totalValue)
					v_finalTotalValueDoc.innerHTML = v_finalTotalValue
					
					// 초과 및 잉여 탄소 배출량에 클래스 추가
					if(v_finalTotalValue > 0){
						v_finalTotalValueDoc.classList.add("text-success")
					}else if(v_finalTotalValue == 0){
						v_finalTotalValueDoc.classList.add("text-secondary")
					}else{
						v_finalTotalValueDoc.classList.add("text-danger")
					}
					
					// 전 시세 남기기
					let v_kauYesterdayValue = v_kauValue
					
					// 현재 시세 바꾸기
					v_kauValue = result["kauValue"]
					v_kauValueDoc.innerHTML = result["kauValue"]
					
					// 시세 차이 바꾸기 
					let v_kauDefValue = parseInt(result["kauValue"] - v_kauYesterdayValue)
					if(v_kauDefValue > 0){
						v_kauDef.innerHTML = "+" + v_kauDefValue
					}else{
						v_kauDef.innerHTML = v_kauDefValue
					}
					
					// 시세 차이에 클래스 추가
					if(v_kauDefValue > 0){
						v_kauDef.classList.add("text-success")
					}else if(v_kauDefValue == 0){
						v_kauDef.classList.add("text-secondary")
					}else{
						v_kauDef.classList.add("text-danger")
					}
					
					// 현재 날짜 바꾸기
					const date = new Date(result["kauDate"])
					let dateString = ((date.getMonth() + 1) + "").padStart(2,"0") + "월 " + ((date.getDate()) + "").padStart(2,"0") + "일 "
					if(date.getDay() == 0){
						dateString +="일"
					}else if(date.getDay() == 1){
						dateString +="월"
					}else if(date.getDay() == 2){
						dateString +="화"
					}else if(date.getDay() == 3){
						dateString +="수"
					}else if(date.getDay() == 4){
						dateString +="목"
					}else if(date.getDay() == 5){
						dateString +="금"
					}else{
						dateString +="토"
					}
					v_currentDate.innerHTML = dateString
					
					// 진행한 거래일 하루 늘리기
					v_kauSeq++
					
					// 남은 거래일 바꾸기
					v_leftDay.innerHTML = v_kauCount - v_kauSeq
					
					// 총 수익 바꾸기
					revenueSet(v_revenue)
					
					// 라디오 버튼 및 매매량 비우기
					const buySellSelect = document.getElementsByName("buySellSelect")
					for(let i = 0; i < buySellSelect.length; i++){
						buySellSelect[i].checked = false
					}
					inputSimuLogValue.value = ""
					
					// 라디오 버튼 및 매매 버튼 활성화
					for(let i = 0; i < buySellSelect.length; i++){
						buySellSelect[i].disabled = false
					}
					buySellButton.disabled = false
				}
			})
		})
		
		document.getElementById("simulationEndBtn").addEventListener("click",()=>{
			if(confirm("시뮬레이션을 종료하시겠습니까?\n(현재까지 한 기록으로 시뮬레이션을 종료합니다.)")){
				v_simuLogValue = 0
				$.ajax({
					type:'POST',
					url: v_nextDayDoUrl,
					data: { "simuNo" : v_simuNo, "kauNo" : v_kauNo, "simulogValue" : v_simuLogValue, "kauKind" : v_kauKind, "kauSeq" : v_kauSeq },
					success: function(result){
						document.getElementById("simuRevenue").value = v_revenue
						document.getElementById("simuFianlvalue").value = parseInt(${quota.quotaValue - quota.quotaValidValue} + v_totalValue)
				
						document.getElementById("simulationEnd").submit()
					}
				})
			}
		})
	</script>
</body>

</html>