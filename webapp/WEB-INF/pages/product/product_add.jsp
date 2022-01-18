<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="../templates/header.jsp"/>
<div class="container">
    <form:form method="POST" action="/product/add"
           modelAttribute="product" class="form-signin" >
        <h2 class="form-signin-heading">Добавить продукт</h2>
        <!--                          Product product                          -->
        <h3>Основная информация</h3>
        <div class="form-model">
            <spring:bind path="name">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="name" class="form-control"
                                placeholder="Наименование"/>
                    <form:errors path="name" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="url">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="url" class="form-control"
                                placeholder="URL"/>
                    <form:errors path="url" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="type">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="type" class="form-control"
                                placeholder="Тип"/>
                    <form:errors path="type" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="price">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="price" class="form-control"
                                placeholder="Цена"/>
                    <form:errors path="price" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="content">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="content" class="form-control"
                                placeholder="Описание"/>
                    <form:errors path="content" delimiter=" "/>
                </div>
            </spring:bind>
        </div>
        <h3>Свойства</h3>
        <button class="button-outside-form" style="display:none" type="button" onClick=
                    "$('#hidden-form-properties').show(); $('#button-outside-properties').hide();"
                    id="button-outside-properties">Открыть</button>
        <div class="form-model" id="hidden-form-properties">
            <spring:bind path="width">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input path="width" class="form-control"
                                placeholder="Ширина"/>
                    <form:errors path="width" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="height">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input path="height" class="form-control"
                                placeholder="Высота"/>
                    <form:errors path="height" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="weight">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input path="weight" class="form-control"
                                placeholder="Вес"/>
                    <form:errors path="weight" delimiter=" "/>
                </div>
            </spring:bind>
        <button class="button-outside-form" type="button" onClick=
                        "$('#hidden-form-properties').hide();
                        $('#button-outside-properties').show();">Закрыть</button>
        </div>
        <!--                          Address address                          -->
        <h3>Адрес</h3>
        <button class="button-outside-form" style="display:none" type="button" onClick=
                "$('#hidden-form-address').show(); $('#button-outside-address').hide();"
                id="button-outside-address">Открыть</button>
        <div class="form-model" id="hidden-form-address">
            <spring:bind path="address.address">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="address.address" class="form-control"
                                placeholder="Адрес"/>
                    <form:errors path="address.address" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="address.moreAddress">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="address.moreAddress" class="form-control"
                                placeholder="Дополнительный адрес"/>
                    <form:errors path="address.moreAddress" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="address.city">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="address.city" class="form-control"
                                placeholder="Город"/>
                    <form:errors path="address.city" delimiter=" "/>
                </div>
            </spring:bind>
            <spring:bind path="address.postalCode">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="address.postalCode" class="form-control"
                                placeholder="Почтовый индекс"/>
                    <form:errors path="address.postalCode" delimiter=" "/>
                </div>
            </spring:bind>
            <button class="button-outside-form" type="button" onClick=
                    "$('#hidden-form-address').hide();
                        $('#button-outside-address').show();">Закрыть</button>
        </div>
        <br/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Отправить" style="width: auto" class="btn btn-lg btn-primary btn-block"/>
    </form:form>
</div>
<c:import url="../templates/footer.jsp"/>