<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>

<h1>Заявки на покупку</h1>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Номер</th>
        <th>Покупатель</th>
        <th>Статус</th>
        <th></th>
    </tr>

    <c:forEach var="p" items="${purchases}">
        <tr>
            <td>${p.id}</td>
            <td>${p.plate.number}</td>
            <td>${p.buyerName}</td>
            <td>${p.status}</td>

            <td>
                <form action="/purchase/${p.id}/approve" method="post">
                    <button>Подтвердить сделку</button>
                </form>
            </td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
