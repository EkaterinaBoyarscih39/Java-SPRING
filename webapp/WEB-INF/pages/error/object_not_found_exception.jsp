<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>${requestScope.get('title')} не найден</title>
    </head>
    <body>
        <h1>${requestScope.get('title')} не найден</h1>
        <p>Ошибка:  ${requestScope.get('exception').message}</p>
        <p>Некорректный URL: ${requestScope.get('url')}</p>
        <ul>
            <c:forEach items="${requestScope.get('exception').stackTrace}" var="ste">
                <li>${ste}</li>
            </c:forEach>
        </ul>
        <a href="/">Вернуться на главную страницу</a>
        </body>
</html>
