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
					<jsp:param value="회원가입" name="title" />
					<jsp:param value="false" name="borderShow" />
				</jsp:include>
				<div class="col-lg-8 col-xl-7 mt-5">

					<!-- 회원가입 폼 -->
					<form id="registForm" action="<c:url value="/registDo" />" method="POST">

						<!-- ID 입력창 -->
						<div class="form-floating mb-3 d-flex">
							<input class="form-control" id="inputId" type="text" name="userId" />
							<label for="inputId">아이디</label>
						</div>

						<!-- ID 중복 체크 -->
						<div class="mb-3">
							<button type="button" id="dupChecKBtn" class="btn btn-secondary">중복확인</button>
							<span class="ms-3" id="dupCheck"></span>
						</div>

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

						<!-- Name 입력창 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputName" type="text" name="userName" />
							<label for="inputName">이름</label>
						</div>

						<!-- email 입력창 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputEmail" type="text" name="userEmail" />
							<label for="inputEmail">이메일( '@' 포함 )</label>
						</div>

						<!-- birth 입력창 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputBirth" type="text" name="userBirth" />
							<label for="inputBirth">생년월일(YYYYMMDD 8글자 입력)</label>
						</div>

						<!-- 회원가입 버튼 -->
						<div class="d-flex justify-content-center">
							<button id="registBtn" class="btn btn-primary btn-lg" type="button" disabled>회원가입</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<div class="bottom"></div>
	<script>
	
	// 가입버튼
	const v_registBtn = document.getElementById("registBtn")
	
	// ID 중복 여부
	let v_dupCheck = false
	
	// ID 입력창
	const v_inputId = document.getElementById("inputId")
	
	// ID 중복 여부 결과
	const v_dupCheckSpan = document.getElementById("dupCheck")
	
	// ID 체크 쿼리 Url
	const v_dupCheckUrl = "<c:url value='/idDupCheck' />"
	
	// ID 입력할 때 중복 체크 풀기
	v_inputId.addEventListener("input",()=>{
		v_dupCheckSpan.classList.remove("text-success")
		v_dupCheckSpan.classList.remove("text-danger")
		v_dupCheck = false
		v_dupCheckSpan.innerHTML = ""
		v_registBtn.disabled = true
	})
	
	// ID 중복 체크 확인 함수
	document.getElementById("dupChecKBtn").addEventListener("click",()=>{
		let v_inputIdValue = v_inputId.value
		 
		$.ajax({
			type:'POST',
			url: v_dupCheckUrl,
			data: { "inputId": v_inputIdValue},
			success: function(result){
				if(result){
					v_dupCheckSpan.classList.add("text-danger")
					v_dupCheckSpan.innerHTML = "중복되는 아이디가 존재합니다."
					v_dupCheck = false
					v_registBtn.disabled = true
				}else{
					v_dupCheckSpan.classList.add("text-success")
					v_dupCheckSpan.innerHTML = "사용가능한 아이디 입니다."
					v_dupCheck = true
					if(v_pwCheck){
						v_registBtn.disabled = false
					}
				}
			}
		})
	})
	
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
			if(v_dupCheck){
				v_registBtn.disabled = false
			}
		}else{
			v_pwCheck = false;
			v_pwCheckSpan.classList.add("text-danger")
			v_pwCheckSpan.innerHTML = "비밀번호가 일치하지 않습니다."
		}
	})
	
	const v_inputName = document.getElementById("inputName")
	const v_inputEmail = document.getElementById("inputEmail")
	const v_inputBirth = document.getElementById("inputBirth")
	
	// 회원 가입
	v_registBtn.addEventListener("click",()=>{
		if(v_dupCheck && v_pwCheck && v_inputName.value && v_inputEmail.value && v_inputBirth){
			document.getElementById("registForm").submit()
		}else{
			alert("모든 항목이 채워지지 않았습니다\n모든 항목을 채우고 다시 해주세요.")
			return
		}
	})
	</script>
</body>
</html>