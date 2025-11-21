<html>
<body>

<h1>Подать заявку на продажу</h1>

<form action="/requests/new" method="post">
    <input type="hidden" name="plate.id" value="${request.plate.id}"/>

    Продавец: <input type="text" name="sellerName"/><br>

    <button type="submit">Отправить</button>
</form>

</body>
</html>
