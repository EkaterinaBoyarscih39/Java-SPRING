<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% this.getServletConfig().getServletContext().setAttribute("title", "Логин"); %>
<c:import url="templates/header.jsp"/>
<div class="container">
    <form method="POST" action="<c:url value="/j_spring_security_check"/>" class="form-signin">
        <h2 class="form-heading">Вход в систему</h2>
            <input name="j_article" type="text" class="form-control" placeholder="Номер"
                   autofocus="true"/>
            <input name="j_password" type="password" class="form-control" placeholder="Пароль"/>
            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
            <button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
            <%--<h4 class="text-center"><a href="/registration">Регистрация</a></h4>--%>
            <span><br/><c:out value="${message}"/></span>
    </form>
</div>
<c:import url="templates/footer.jsp"/>
