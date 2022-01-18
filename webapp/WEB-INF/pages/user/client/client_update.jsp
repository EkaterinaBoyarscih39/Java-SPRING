<%@ page import="com.dmnoky.taxidermy.model.user.Client" %>
<%@ page import="com.dmnoky.taxidermy.model.animal.Animal" %>
<%@ page import="com.dmnoky.taxidermy.model.user.sub.AnimalCount" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="../../templates/header.jsp"/>
<div class="container">
    <form:form method="POST" action="/client/update"
       modelAttribute="client" class="form-signin" >
        <h2 class="form-signin-heading">Обновить клиента</h2>
        <!--                          Client client                          -->
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
                <form:input type="hidden" path="password"/>
            </spring:bind>
            <spring:bind path="confirmPassword">
                <form:input type="hidden" path="confirmPassword"/>
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
                <form:input type="hidden" path="article"/>
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
            <c:set var="size" value="${client.phoneNumbers.size()}"/>
            <c:if test="${size > 0}">
                <spring:bind path="phoneNumbers">
                    <c:forEach var="i" begin="0" end="${client.phoneNumbers.size()-1}">
                        <div id="hidden-inform-phoneNumbers-${i}">
                            <form:input type="text" path="phoneNumbers[${i}]" class="form-control"
                                        placeholder="Телефонный номер ${i+1}"/>
                            <form:errors path="phoneNumbers[${i}]" delimiter=" " cssClass="has-error"/>
                        </div>
                    </c:forEach>
                </spring:bind>
            </c:if>
            <c:forEach var="i" begin="${size}" end="${size+2}">
                <% ((Client) request.getAttribute("client")).getPhoneNumbers().add(""); %>
                <spring:bind path="phoneNumbers[${i}]">
                    <div id="hidden-inform-phoneNumbers-${i}">
                        <form:input type="text" path="phoneNumbers[${i}]" class="form-control"
                                    placeholder="Телефонный номер ${i+1}"/>
                        <form:errors path="phoneNumbers[${i}]" delimiter=" " cssClass="has-error"/>
                    </div>
                </spring:bind>
            </c:forEach>
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
            <c:set var="size" value="${client.animalList.size()}"/>
            <c:if test="${size > 0}">
                <c:forEach var="i" begin="0" end="${size-1}">
                    <div class="list" id="element-animal-list-${i+1}">
                        <spring:bind path="animalList[${i}]">
                            <form:input type="text" path="animalList[${i}].id" class="form-control"
                                        placeholder="ID ${i+1}"/>
                            <form:errors path="animalList[${i}].id" delimiter=" " cssClass="has-error"/>
                            <input type="hidden" name="animalList[${i}].number" value="${client.animalCounts.get(i).count}"/>
                            <form:input type="text" path="animalCounts[${i}].count" class="form-control"
                                        placeholder="Количество"/>
                            <form:errors path="animalCounts[${i}]" delimiter=" " cssClass="has-error"/>
                        </spring:bind>
                    </div>
                </c:forEach>
            </c:if>
            <% ((Client) request.getAttribute("client")).getAnimalList().add(new Animal()); %>
            <% ((Client) request.getAttribute("client")).getAnimalCounts().add(new AnimalCount()); %>
            <spring:bind path="animalList[${size}]">
                <form:input type="text" path="animalList[${size}].id" class="form-control"
                            placeholder="ID ${size+1}"/>
                <form:errors path="animalList[${size}].id" delimiter=" " cssClass="has-error"/>
                <form:input type="text" path="animalCounts[${size}].count" class="form-control"
                            placeholder="Количество"/>
                <form:errors path="animalCounts[${size}]" delimiter=" " cssClass="has-error"/>
                <button class="button-inside-form" type="button" onClick=
                        "$('#hidden-inform-animals-${size+1}').show(); $('#button-inform-animals-${size+1}').hide();"
                        id="button-inform-animals-${size+1}">Новое поле</button>
            </spring:bind>
            <c:forEach var="i" begin="${size+1}" end="${size+3}">
                <% ((Client) request.getAttribute("client")).getAnimalList().add(new Animal()); %>
                <% ((Client) request.getAttribute("client")).getAnimalCounts().add(new AnimalCount()); %>
                <spring:bind path="animalList[${i}]">
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
                </spring:bind>
            </c:forEach>
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
            <c:set var="size" value="${client.notes.size()}"/>
            <c:if test="${size > 0}">
                <spring:bind path="notes">
                    <c:forEach var="i" begin="0" end="${size-1}">
                        <form:input type="text" path="notes[${i}]" class="form-control"
                                    placeholder="${i+1}"/><br/>
                    </c:forEach>
                </spring:bind>
            </c:if>
            <c:forEach var="i" begin="${size}" end="${size+2}">
                <% ((Client) request.getAttribute("client")).getNotes().add(""); %>
                <spring:bind path="notes[${i}]">
                    <form:input type="text" path="notes[${i}]" class="form-control"
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
