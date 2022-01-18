<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="../templates/header.jsp"/>
<div class="model-view">
    <sec:authorize access="hasRole('ADMIN')">
        <div class="admin-model-menu">
            <a href="/product/update/${product.id}"><button>Изменить</button></a>
            <form action="<c:url value="/product/remove"/>" method="POST">
                <input id="remove-product-id" type="hidden" name="id" value="${product.id}">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="submit" value="Удалить" onclick="return confirm('Вы точно хотите удалить эту страницу?')">
            </form>
        </div>
    </sec:authorize>
    <h1>Продукт</h1>
    <h2>Основная информация</h2>
    <div class="form-model">
        <h3>ID</h3>
        <p>${product.id}</p>
        <h3>Наименование</h3>
        <p>${product.name}</p>
        <h3>Тип</h3>
        <p>${product.type}</p>
        <h3>URL</h3>
        <p>${product.url}</p>
        <h3>Цена</h3>
        <p>${product.price}</p>
        <h3>Описание</h3>
        <p>${product.content}</p>
    </div>
    <h2>Свойства</h2>
    <div class="form-model">
        <h3>Ширина</h3>
        <p>${product.width}</p>
        <h3>Высота</h3>
        <p>${product.height}</p>
        <h3>Вес</h3>
        <p>${product.weight}</p>
    </div>
    <h2>Адрес</h2>
    <c:choose>
        <c:when test = "${product.address != null}">
            <div class="form-model">
                <h3>Адрес</h3>
                <p>${product.address.address}</p>
                <h3>Дополнительный адрес</h3>
                <p>${product.address.moreAddress}</p>
                <h3>Город</h3>
                <p>${product.address.city}</p>
                <h3>Почтовый индекс</h3>
                <p>${product.address.postalCode}</p>
            </div>
        </c:when>
        <c:otherwise>
            <p>Адрес не указан</p>
        </c:otherwise>
    </c:choose>
</div>
<c:import url="../templates/footer.jsp"/>