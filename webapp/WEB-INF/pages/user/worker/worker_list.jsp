<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../templates/header.jsp"/>
<h1>Список</h1>
<ul>
    <c:forEach var="item" items="${listWorker}">
        <li><a href="/worker/id/${item.id}" target="_blank">${item.name}</a></li>
    </c:forEach>
</ul>
<br/>
<div class="page-navigation-list">
    <c:if test="${countRows > 1}">
        <c:if test="${requestScope.get('page') > 1}">
            <button><a href="<c:url value="/worker/list/1"/>">1</a></button>
            <button><a href="/worker/list/${requestScope.get('page')-1}">-1</a></button>
        </c:if>
        <input type="text" placeholder="${requestScope.get('page')}/${countRows}"
               id="main-input-value" title="Введите значение"/>
        <button onclick="location.href = '/worker/list/'+
            document.getElementById('main-input-value').value">
            Go
        </button>
        <c:if test="${countRows > requestScope.get('page')}">
            <button><a href="/worker/list/${requestScope.get('page')+1}">+1</a></button>
            <button><a href="/worker/list/${countRows}">${countRows}</a></button>
        </c:if>
    </c:if>
</div>
<c:import url="../../templates/footer.jsp"/>
