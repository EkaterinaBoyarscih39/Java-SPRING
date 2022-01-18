<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% this.getServletConfig().getServletContext().setAttribute("title", "Главная"); %>
<c:import url="templates/header.jsp"/>
	<h1>Таксидермия</h1>
	<c:choose>
		<c:when test = "${listOfTasks.size() > 0}">
			<ul>
				<c:forEach var="worker" items="${listOfTasks}">
					<li><h3><a href="/worker/id/${worker.id}" target="_blank">${worker.name}</a></h3></li>
					<ul1>
                        <h2>Задачи</h2>
						<c:forEach var="task" items="${worker.tasks}">
                            <li>${task}</li>
						</c:forEach>
                        <hr>
					</ul1>
				</c:forEach>
			</ul>
		</c:when>
		<c:when test = "${worker!=null}">
			<h3><a href="/worker/id/${worker.id}" target="_blank">Добро пожаловать ${worker.name}!</a>
				Ваши задачи:  </h3><br/>
			<ul>
				<c:forEach var="task" items="${worker.tasks}">
					<li>${task}</li>
				</c:forEach>
			</ul>
		</c:when>
		<c:when test = "${user!=null}">
			<h3><a href="/client/id/${user.id}" target="_blank">Добро пожаловать ${user.name}!</a>
				Ваши заказы:  </h3><br/>
			<ul>
				<c:forEach var="animal" items="${user.animalList}">
					<li><a href="/animal/id/${animal.id}" target="_blank">${animal.name}</a></li>
				</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
			<p><a href="/login"><button>Пожайлуста авторизируйтесь</button></a></p>
		</c:otherwise>
	</c:choose>
<c:import url="templates/footer.jsp"/>
