<%@ page import="com.dmnoky.taxidermy.model.user.Worker" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="../../templates/header.jsp"/>
<div class="container">
    <form:form method="POST" action="/worker/update"
       modelAttribute="worker" class="form-signin" >
        <h2 class="form-signin-heading">Обновить работника</h2>
        <!--                          Client worker                          -->
        <h3>Основная информация</h3>
        <div class="form-model">
            <spring:bind path="id">
                <form:input type="hidden" path="id"/>
            </spring:bind>
            <spring:bind path="email">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="email" path="email" class="form-control"
                                placeholder="e-mail"  autofocus="true"/>
                    <form:errors path="email" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="name">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="name" class="form-control"
                                placeholder="Имя"/>
                    <form:errors path="name" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="surname">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="surname" class="form-control"
                                placeholder="Фамилия"/>
                    <form:errors path="surname" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="password">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="password" class="form-control"
                                placeholder="Пароль"/>
                    <form:errors path="password" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="confirmPassword">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="password" path="confirmPassword" class="form-control"
                                placeholder="Повторите пароль"/>
                    <form:errors path="confirmPassword" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="article">
                <form:input type="hidden" path="article"/>
            </spring:bind>
        </div>

        <!--                          List<String> notes                          -->
        <h3>Задачи</h3>
        <button class="button-outside-form" style="display:none" type="button" onClick=
                "$('#hidden-form-notes').show(); $('#button-outside-notes').hide();"
                id="button-outside-notes">Открыть</button>
        <div class="form-model" id="hidden-form-notes">
            <c:set var="size" value="${worker.tasks.size()}"/>
            <c:if test="${size > 0}">
                <spring:bind path="tasks">
                    <c:forEach var="i" begin="0" end="${size-1}">
                        <form:input type="text" path="tasks[${i}]" class="form-control"
                                    placeholder="${i+1}"/><br/>
                    </c:forEach>
                </spring:bind>
            </c:if>
            <c:forEach var="i" begin="${size}" end="${size+2}">
                <% ((Worker) request.getAttribute("worker")).getTasks().add(""); %>
                <spring:bind path="tasks[${i}]">
                    <form:input type="text" path="tasks[${i}]" class="form-control"
                                placeholder="${i+1}"/><br/>
                </spring:bind>
            </c:forEach>
            <button class="button-outside-form" type="button" onClick=
                    "$('#hidden-form-notes').hide(); $('#button-outside-notes').show();">
                Закрыть
            </button>
        </div>
        <br/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Отправить" style="width: auto" class="btn btn-lg btn-primary btn-block"/>
    </form:form>
</div>
<c:import url="../../templates/footer.jsp"/>
