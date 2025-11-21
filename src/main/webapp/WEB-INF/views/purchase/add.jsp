<html>
<body>

<h1>Купить номер ${purchase.plate.number}</h1>

<form action="/purchase/new" method="post">
    <input type="hidden" name="plate.id" value="${purchase.plate.id}"/>

    Ваше имя: <input name="buyerName"><br>

    <button type="submit">Отправить заявку</button>
</form>

</body>
</html>
