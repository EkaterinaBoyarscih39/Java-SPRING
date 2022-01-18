<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input type="text" path="article" class="form-control"
                                placeholder="Номер"/>
                    <form:errors path="article" delimiter=" "/>
                </div>
            </spring:bind>
        </div>
