<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="../../templates/header.jsp"/>
<div class="container">
    <form:form method="POST" action="/worker/add"
               modelAttribute="worker" class="form-signin" >
        <h2 class="form-signin-heading">Добавить работника</h2>
        <!--                          Client client                          -->
        <c:import url="../user_add.jsp"/>
        <!--                          List<String> notes                          -->
        <h3>Задачи</h3>
        <button class="button-outside-form" style="display:none" type="button" onClick=
                "$('#hidden-form-notes').show(); $('#button-outside-notes').hide();"
                id="button-outside-notes">Открыть</button>
        <div class="form-model" id="hidden-form-notes">
            <spring:bind path="tasks">
                <form:input type="text" path="tasks[0]" class="form-control" placeholder="1"/><br/>
                <form:input type="text" path="tasks[1]" class="form-control" placeholder="2"/><br/>
                <form:input type="text" path="tasks[2]" class="form-control" placeholder="3"/><br/>
                <form:input type="text" path="tasks[3]" class="form-control" placeholder="4"/><br/>
            </spring:bind>
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