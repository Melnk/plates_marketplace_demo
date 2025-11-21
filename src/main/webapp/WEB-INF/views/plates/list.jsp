<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Номера</title></head>
<body>

<h1>Список номеров</h1>

<a href="/plates/add">Добавить номер</a>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Номер</th>
        <th>Регион</th>
        <th>Статус</th>
        <th></th>
    </tr>

    <c:forEach var="p" items="${plates}">
        <tr>
            <td>${p.id}</td>
            <td>${p.number}</td>
            <td>${p.region}</td>
            <td>${p.status}</td>
            <td><a href="/plates/${p.id}">Подробнее</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
