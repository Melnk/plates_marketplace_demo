<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>Доступные номера</h1>

<table class="table table-striped">
    <thead>
    <tr>
        <th>ID</th>
        <th>Номер</th>
        <th>Регион</th>
        <th>Статус</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="p" items="${plates}">
        <tr>
            <td>${p.id}</td>
            <td>${p.number}</td>
            <td>${p.region}</td>
            <td>${p.status}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="/plates/add-test" class="btn btn-primary mt-3">Добавить тестовый номер</a>
