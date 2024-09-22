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
					<jsp:param value="회원 정보" name="title" />
					<jsp:param value="false" name="borderShow" />
				</jsp:include>
				<div class="col-lg-8 col-xl-7 mt-5">

					<!-- 회원수정 폼 -->
					<form id="updateForm" action="<c:url value="/updateUserDo" />" method="POST">

						<!-- ID 입력창 -->
						<div class="form-floating mb-3 d-flex">
							<input class="form-control" id="inputId" type="text" name="userId" value="${sessionScope.login.userId}" readonly />
							<label for="inputId">아이디</label>
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

						<input id="containPw" type="hidden" name="containPw" value="false">

						<!-- Name 입력창 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputName" type="text" name="userName" value="${sessionScope.login.userName}" />
							<label for="inputName">이름</label>
						</div>

						<!-- email 입력창 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputEmail" type="text" name="userEmail" value="${sessionScope.login.userEmail}" readonly/>
							<label for="inputEmail">이메일( '@' 포함 )</label>
						</div>

						<!-- birth 입력창 -->
						<div class="form-floating mb-3">
							<input class="form-control" id="inputBirth" type="text" name="userBirth" value="${sessionScope.login.userBirth}" />
							<label for="inputBirth">생년월일(YYYYMMDD 8글자 입력)</label>
						</div>
					</form>

					<!-- 회원 탈퇴 폼 -->
					<form id="deleteForm" action="<c:url value="/deleteUserDo" />" method="POST">
						<input type="hidden" name="userId" value="${sessionScope.login.userId}">
					</form>

					<!-- 회원 정보 수정 , 탈퇴 버튼 -->
					<div class="d-flex flex-column align-items-center">
						<button id="updateUserBtn" class="btn btn-primary btn-lg" type="button">회원 정보 수정</button>
						<a id="deleteUserBtn" class="mt-5 text-black cursor-pointer">회원탈퇴</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="bottom"></div>
	<script>
	// PW 중복 여부
	const v_containPw = document.getElementById("containPw")
	
	// PW 입력창
	const v_inputPw = document.getElementById("inputPw")
	const v_inputCheckPw = document.getElementById("inputCheckPw")
	
	// PW 확인 결과
	const v_pwCheckSpan = document.getElementById("pwCheck")
	
	// PW 입력할 때 PW 일치 풀기
	function pwCheckInvalid(){
		v_pwCheckSpan.classList.remove("text-success")
		v_pwCheckSpan.classList.remove("text-danger")
		v_containPw.value = "false"
		v_pwCheckSpan.innerHTML = ""
	}
	
	v_inputPw.addEventListener("input",pwCheckInvalid);
	v_inputCheckPw.addEventListener("input",pwCheckInvalid);
	
	// PW 일치 확인 함수
	document.getElementById("pwChecKBtn").addEventListener("click",()=>{
		let v_inputPwValue = v_inputPw.value
		let v_inputCheckPwValue = v_inputCheckPw.value
		
		if(v_inputPwValue == v_inputCheckPwValue){
			v_containPw.value = "true";
			v_pwCheckSpan.classList.add("text-success")
			v_pwCheckSpan.innerHTML = "비밀번호가 일치합니다."
		}else{
			v_containPw.value = "false";
			v_pwCheckSpan.classList.add("text-danger")
			v_pwCheckSpan.innerHTML = "비밀번호가 일치하지 않습니다."
		}
	})
	
	document.getElementById("updateUserBtn").addEventListener("click",()=>{
		if(confirm("해당 내용으로 수정하시겠습니까?")){
			if(v_containPw.value == "false"){
				v_inputPw.value = "notpassword123!@#$%^&*"
			}
			document.getElementById("updateForm").submit();
		}
	})
	
	document.getElementById("deleteUserBtn").addEventListener("click",()=>{
		if(confirm("회원을 탈퇴하시겠습니까?\n탈퇴한 정보는 복구할 수 없습니다.")){
			document.getElementById("deleteForm").submit();
		}
	})
	
	</script>
</body>

</html>