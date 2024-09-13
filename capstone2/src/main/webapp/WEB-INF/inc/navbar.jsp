<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
.login-bar {
	width: 100%;
}
</style>

<nav class="navbar navbar-expand-lg bg-primary fixed-top d-flex flex-column" data-bs-theme="dark">
	<c:if test="${sessionScope.login == null }">
		<div class="login-bar d-flex justify-content-end">
			<a class="pe-3 cursor-pointer" href="<c:url value="/loginView" />">로그인</a>
		</div>
	</c:if>
	<c:if test="${sessionScope.login != null }">
		<div class="login-bar d-flex justify-content-end">
			<a class="pe-3 cursor-pointer" href="<c:url value="/updateUserView" />">${sessionScope.login.userName}님</a>
			<a class="pe-3 cursor-pointer" href="<c:url value="/logoutDo" />">로그아웃</a>
		</div>
	</c:if>
	<div class="container">
		<a class="navbar-brand fw-bold cursor-pointer" href="<c:url value="/" />">배출권 시장 시뮬레이터</a>
		<button class="navbar-toggler fw-bold bg-secondary rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item mx-0 mx-lg-1">
					<a class="nav-link py-3 px-0 px-lg-3 rounded cursor-pointer fw-bold" href="<c:url value="/carbonMarketIntro" />">탄소시장 소개</a>
				</li>
				<li class="nav-item mx-0 mx-lg-1">
					<a class="nav-link py-3 px-0 px-lg-3 rounded cursor-pointer fw-bold" href="<c:url value="/simulationIntro" />">시뮬레이션</a>
				</li>
			</ul>
		</div>
	</div>
</nav>