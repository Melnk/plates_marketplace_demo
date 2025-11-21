<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>

<h1>Заявки на продажу</h1>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Номер</th>
        <th>Продавец</th>
        <th>Статус</th>
        <th></th>
    </tr>

    <c:forEach var="r" items="${requests}">
        <tr>
            <td>${r.id}</td>
            <td>${r.plate.number}</td>
            <td>${r.sellerName}</td>
            <td>${r.status}</td>

            <td>
                <form action="/requests/${r.id}/approve" method="post">
                    <button>Одобрить</button>
                </form>

                <form action="/requests/${r.id}/reject" method="post">
                    <button>Отклонить</button>
                </form>
            </td>
        </tr>
    </c:forEach>

</table>

<a href="/plates">Назад к номерам</a>

</body>
</html>
