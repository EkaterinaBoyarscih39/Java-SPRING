<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:import url="../../templates/header.jsp"/>
<div class="model-view">
    <sec:authorize access="hasRole('ADMIN')">
        <div class="admin-model-menu">
            <a href="/client/update/${client.id}"><button>Изменить</button></a>
            <form action="<c:url value="/client/remove"/>" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input id="remove-client-id" type="hidden" name="id" value="${client.id}">
                <input type="submit" value="Удалить" onclick="return confirm('Вы точно хотите удалить эту страницу?')">
            </form>
        </div>
    </sec:authorize>
    <h1>Клиент</h1>
    <h2>Основная информация</h2>
    <div class="form-model">
        <h3>ID</h3>
        <p>${client.id}</p>
        <h3>ФИ</h3>
        <p>${client.surname} ${client.name}</p>
        <h3>Эл. Почта</h3>
        <p>${client.email}</p>
        <h3>Номер</h3>
        <p>${client.article}</p>
        <h3>Пароль</h3>
        <p>${client.password}</p>
    </div>
    <h2>Телефонные номера</h2>
    <c:choose>
        <c:when test = "${client.phoneNumbers.size() > 0}">
            <div class="form-model">
                <ul>
                    <c:forEach var="item" items="${client.phoneNumbers}">
                        <li>${item}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:when>
        <c:otherwise>
            <p>Заметок нет</p>
        </c:otherwise>
    </c:choose>
    <h2>Адрес</h2>
    <c:choose>
        <c:when test = "${client.address != null}">
            <div class="form-model">
                <h3>Адрес</h3>
                <p>${client.address.address}</p>
                <h3>Дополнительный адрес</h3>
                <p>${client.address.moreAddress}</p>
                <h3>Город</h3>
                <p>${client.address.city}</p>
                <h3>Почтовый индекс</h3>
                <p>${client.address.postalCode}</p>
            </div>
        </c:when>
        <c:otherwise>
            <p>Адрес не указан</p>
        </c:otherwise>
    </c:choose>
    <h2>Товары</h2>
    <c:choose>
        <c:when test = "${client.animalList.size() > 0}">
            <div class="form-model">
                <ul>
                    <c:forEach var="i" begin="0" end="${client.animalList.size()-1}">
                        <li>
                            <a href="/animal/id/${client.animalList.get(i).id}" target="_blank">
                            ${client.animalList.get(i).name}</a>
                            Количество: ${client.animalCounts.get(i).count}
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:when>
        <c:otherwise>
            <p>Товаров нет</p>
        </c:otherwise>
    </c:choose>
    <h2>Заметки</h2>
    <c:choose>
        <c:when test = "${client.notes.size() > 0}">
            <div class="form-model">
                <ul>
                    <c:forEach var="item" items="${client.notes}">
                        <li>${item}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:when>
        <c:otherwise>
            <p>Заметок нет</p>
        </c:otherwise>
    </c:choose>
</div>
<c:import url="../../templates/footer.jsp"/>