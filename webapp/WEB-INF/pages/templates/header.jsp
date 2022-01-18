<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
	<head>
	    <title>${title}</title>
	    <meta charset="UTF-8" />
		<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	</head>
	<body>
		<div class="content">
			<header>
				<span class="logo-img"><img src="/resources/img/logo.png" alt="logo"></span>
				<span class="logo-text"><a href="/">Таксидермия</a></span>
				<span class="user-form">
					<sec:authorize access='!isAuthenticated()'>
						<a href="/login"><button>Войти</button></a>
						<%--<a href="/registration"><button>Регистрация</button></a>--%>
					</sec:authorize>
					<sec:authorize access='isAuthenticated()'>
						<sec:authentication property="principal.username" />
						<a href="/logout"><button>Выйти</button></a>
					</sec:authorize>
				</span>
			</header>
			<div id="main-nav-panel">
				<ul>
					<sec:authorize access="hasRole('ADMIN')">
						<li><a href="/admin/panel">Админ панель</a></li>
					</sec:authorize>
					<ul>
						<li><a href="/animal/list/1">Товары</a>
							<ul class="dropdown">
								<c:forEach var="i" begin="0" end="${subList.size()-1}">
									<li><a href="/animal/list/sub/${subList.get(i).getName()}/page/1">
									    ${subList.get(i).getName()}</a></li>
								</c:forEach>
							</ul>
						</li>
					</ul>
					<c:forEach var="i" begin="0" end="${typeList.size()-1}">
						<li><a href="/animal/list/type/${typeList.get(i).getName()}/page/1">
						    ${typeList.get(i).getName()}</a></li>
					</c:forEach>
				</ul>
			</div>
