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
					<jsp:param value="비밀번호 초기화" name="title" />
					<jsp:param value="false" name="borderShow" />
				</jsp:include>
				<div class="col-lg-8 col-xl-7 mt-5">

					<!-- PW 입력 폼 -->
					<form id="pwResetForm" action="<c:url value="/pwResetDo" />" method="POST">

						<input type="hidden" name="userId" value="${resetId}">
						
						<input type="hidden" name="userName" value="invalidName">
						<input type="hidden" name="userEmail" value="invalid@invalid.com">
						<input type="hidden" name="userBirth" value="00000000">

						<!-- PW 입력창 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputPw" type="password" name="userPw" />
							<label for="inputPw">비밀번호</label>
						</div>

						<!-- PW확인 입력창 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputCheckPw" type="password" />
							<label for="inputCheckPw">비밀번호확인</label>
						</div>

						<!-- 비밀번호 확인 -->
						<div class="mb-3">
							<button type="button" id="pwChecKBtn" class="btn btn-secondary">비밀번호확인</button>
							<span class="ms-3" id="pwCheck"></span>
						</div>

						<!-- 비밀번호 초기화 -->
						<div class="d-flex flex-column align-items-center">
							<button id="pwResetBtn" class="btn btn-primary btn-lg" type="button" disabled>비밀번호 초기화</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<div class="bottom"></div>
	<script>
	
		// PW 중복 여부
		let v_pwCheck = false
		
		// PW 입력창
		const v_inputPw = document.getElementById("inputPw")
		const v_inputCheckPw = document.getElementById("inputCheckPw")
		
		// PW 확인 결과
		const v_pwCheckSpan = document.getElementById("pwCheck")
		
		// PW 입력할 때 PW 일치 풀기
		function pwCheckInvalid(){
			v_pwCheckSpan.classList.remove("text-success")
			v_pwCheckSpan.classList.remove("text-danger")
			v_pwCheck = false
			v_pwCheckSpan.innerHTML = ""
			v_registBtn.disabled = true
		}
		
		v_inputPw.addEventListener("input",pwCheckInvalid);
		v_inputCheckPw.addEventListener("input",pwCheckInvalid);
		
		// PW 일치 확인 함수
		document.getElementById("pwChecKBtn").addEventListener("click",()=>{
			let v_inputPwValue = v_inputPw.value
			let v_inputCheckPwValue = v_inputCheckPw.value
			
			if(v_inputPwValue == v_inputCheckPwValue){
				v_pwCheck = true;
				v_pwCheckSpan.classList.add("text-success")
				v_pwCheckSpan.innerHTML = "비밀번호가 일치합니다."
				v_pwResetBtn.disabled = false
			}else{
				v_pwCheck = false;
				v_pwCheckSpan.classList.add("text-danger")
				v_pwCheckSpan.innerHTML = "비밀번호가 일치하지 않습니다."
			}
		})
		
		// PW 초기화 버튼
		const v_pwResetBtn = document.getElementById("pwResetBtn")
		
		v_pwResetBtn.addEventListener("click",()=>{
			if(v_pwCheck){
				document.getElementById("pwResetForm").submit()
			}else{
				alert("오류가 발생했습니다. 입력 정보를 다시한번 확인해주세요")
				return
			}
		})
	</script>
</body>

</html>