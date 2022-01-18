<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:import url="../../templates/header.jsp"/>
<div class="model-view">
    <sec:authorize access="hasRole('ADMIN')">
        <div class="admin-model-menu">
            <a href="/worker/update/${worker.id}"><button>Изменить</button></a>
            <form action="<c:url value="/worker/remove"/>" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input id="remove-worker-id" type="hidden" name="id" value="${worker.id}">
                <input type="submit" value="Удалить" onclick="return confirm('Вы точно хотите удалить эту страницу?')">
            </form>
        </div>
    </sec:authorize>
    <h1>${worker.surname} ${worker.name}</h1>
    <h2>Основная информация</h2>
    <div class="form-model">
        <h3>ID</h3>
        <p>${worker.id}</p>
        <h3>Эл. Почта</h3>
        <p>${worker.email}</p>
        <h3>Номер</h3>
        <p>${worker.article}</p>
    </div>
    <h2>Задачи</h2>
    <c:choose>
        <c:when test = "${worker.tasks.size() > 0}">
            <div class="form-model">
                <ul>
                    <c:forEach var="item" items="${worker.tasks}">
                        <li>${item}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:when>
        <c:otherwise>
            <p>Задач нет</p>
        </c:otherwise>
    </c:choose>
</div>
<c:import url="../../templates/footer.jsp"/>