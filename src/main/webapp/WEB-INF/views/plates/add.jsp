<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Добавить</title></head>
<body>

<h1>Создать номер</h1>

<form action="/plates/add" method="post">
    Номер: <input name="number"><br>
    Регион: <input name="region"><br>
    Статус: <input name="status" value="NEW"><br>

    <button type="submit">Сохранить</button>
</form>

</body>
</html>
