<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>${plate.number}</title></head>
<body>

<h1>Номер ${plate.number}</h1>
<p>Регион: ${plate.region}</p>
<p>Статус: ${plate.status}</p>

<form action="/plates/${plate.id}/delete" method="post">
    <button type="submit">Удалить</button>
</form>

<a href="/plates">Назад</a>

</body>
</html>
