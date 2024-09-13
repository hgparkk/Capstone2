<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String title = request.getParameter("title");
String borderShow = request.getParameter("borderShow");
boolean isBorderShow = borderShow.equals("true");
pageContext.setAttribute("isBorderShow", isBorderShow);
%>

<c:if test="${isBorderShow}">
	<div class="border-bottom border-2 border-primary">
		<div class="fs-1 banner d-flex justify-content-center align-items-center">
			<span><%=title%></span>
		</div>
	</div>
</c:if>
<c:if test="${!isBorderShow}">
	<div>
		<div class="fs-1 login-banner d-flex justify-content-center align-items-center">
			<span><%=title%></span>
		</div>
	</div>
</c:if>