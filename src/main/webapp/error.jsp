<%@ page isErrorPage="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/error.css">
    <title>Ошибка</title>
</head>
<body>
    <div class="container">
        <h1>Произошла ошибка</h1>
        <p>Извините, <%= exception.getMessage() %></p>
        <p>Пожалуйста, вернитесь на <a href="index.jsp">главную страницу</a>.</p>
    </div>
</body>
</html>