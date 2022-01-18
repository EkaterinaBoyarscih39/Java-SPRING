<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="../../templates/header.jsp"/>
<div class="container">
    <form:form method="POST" action="/client/add"
               modelAttribute="client" class="form-signin" >
        <h2 class="form-signin-heading">Добавить клиента</h2>
        <!--                          Client client                          -->
        <h3>Основная информация</h3>
        <div class="form-model">
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
                <form:input type="hidden"  path="password" value="clientPassword0"/>
            </spring:bind>
            <spring:bind path="confirmPassword">
                <form:input type="hidden" path="confirmPassword" value="clientPassword0"/>
            </spring:bind>
            <%--<spring:bind path="password">
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
            </spring:bind>--%>
            <spring:bind path="article">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="article" class="form-control"
                                placeholder="Номер"/>
                    <form:errors path="article" delimiter=" "/>
                </div>
            </spring:bind>
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
        <!--                          List<String> phoneNumbers                          -->
        <h3>Телефон</h3>
        <button class="button-outside-form" style="display:none" type="button" onClick=
                "$('#hidden-form-phoneNumbers').show(); $('#button-outside-phoneNumbers').hide();"
                id="button-outside-phoneNumbers">Открыть</button>
        <div class="form-model" id="hidden-form-phoneNumbers">
            <spring:bind path="phoneNumbers">
                <form:input type="text" path="phoneNumbers[0]" class="form-control"
                            placeholder="Телефонный номер"/>
                <form:errors path="phoneNumbers[0]" delimiter=" " cssClass="has-error"/>
                <form:input type="text" path="phoneNumbers[1]" class="form-control"
                            placeholder="Доп. телефонный номер"/>
                <form:errors path="phoneNumbers[1]" delimiter=" " cssClass="has-error"/>
            </spring:bind>
            <br/>
            <button class="button-outside-form" type="button" onClick=
                    "$('#hidden-form-phoneNumbers').hide();
                    $('#button-outside-phoneNumbers').show();">Закрыть</button>
        </div>
        <!--                          List<Animals> animals                         -->
        <h3>Товары</h3>
        <button class="button-outside-form" style="display:none" type="button" onClick=
                    "$('#hidden-form-animals').show(); $('#button-outside-animals').hide();"
                    id="button-outside-animals">Открыть</button>
        <div class="form-model" id="hidden-form-animals">
            <h4>Выбрать из текущего списка по ID</h4>
            <spring:bind path="animalList">
                <form:input type="text" path="animalList[0].id" class="form-control"
                            placeholder="ID 1"/>
                <form:errors path="animalList[0].id" delimiter=" " cssClass="has-error"/>
                <form:input type="text" path="animalCounts[0].count" class="form-control"
                            placeholder="Количество"/>
                <form:errors path="animalCounts[0]" delimiter=" " cssClass="has-error"/>
                <button class="button-inside-form" type="button" onClick=
                        "$('#hidden-inform-animals-1').show(); $('#button-inform-animals-1').hide();"
                        id="button-inform-animals-1">Новое поле</button>
                <c:forEach var="i" begin="1" end="4">
                    <div style="display:none" id="hidden-inform-animals-${i}">
                        <form:input type="text" path="animalList[${i}].id" class="form-control"
                                    placeholder="ID ${i+1}"/>
                        <form:errors path="animalList[${i}].id" delimiter=" " cssClass="has-error"/>
                        <form:input type="text" path="animalCounts[${i}].count" class="form-control"
                                    placeholder="Количество"/>
                        <form:errors path="animalCounts[${i}]" delimiter=" " cssClass="has-error"/>
                        <button class="button-inside-form" type="button" onClick=
                                "$('#hidden-inform-animals-${i+1}').show(); $('#button-inform-animals-${i+1}').hide();"
                                id="button-inform-animals-${i+1}">Новое поле</button>
                    </div>
                </c:forEach>
            </spring:bind>
            <h4>Создать</h4>
            <div><a href="/animal/add" target="_blank">Переход на форму</a></div>
            <button class="button-outside-form" type="button" onClick=
                    "$('#hidden-form-animals').hide();
                    $('#button-outside-animals').show();">Закрыть</button>
        </div>
        <!--                          List<String> notes                          -->
        <h3>Заметки</h3>
        <button class="button-outside-form" style="display:none" type="button" onClick=
                "$('#hidden-form-notes').show(); $('#button-outside-notes').hide();"
                id="button-outside-notes">Открыть</button>
        <div class="form-model" id="hidden-form-notes">
            <spring:bind path="notes">
                <form:input type="text" path="notes[0]" class="form-control" placeholder="1"/><br/>
                <form:input type="text" path="notes[1]" class="form-control" placeholder="2"/><br/>
                <form:input type="text" path="notes[2]" class="form-control" placeholder="3"/><br/>
                <form:input type="text" path="notes[3]" class="form-control" placeholder="4"/><br/>
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