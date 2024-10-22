<%@ page import="java.util.*, java.text.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/table.css">
    <title>Таблица пользователей</title>
</head>
<body>
    <div class="container">
        <div class="block">
            <h2>Добавить нового пользователя</h2>
            <form name="f1" method="post" class="user-form">
                <label for="name">Имя пользователя:</label>
                <input id="name" name="name" type="text" value="Alexander" style="width: 450px;"/>
                
                <label for="email">E-mail:</label>
                <input id="email" name="email" type="email" value="sunmeatrich@gmail.com" style="width: 450px;"/>
                
                <input type="submit" name="submit" value="Добавить пользователя" class="submit-button" style="width: 472px;" />
            </form>
        </div>

        <div class="block">
            <h2>Существующие пользователи:</h2>
            
            <%! List<String> name_array = new ArrayList<String>(); %>
            <%! List<String> email_array = new ArrayList<String>(); %>
            <%! List<Date> reg_date_array = new ArrayList<Date>(); %>

            <% 
                try {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String submit = request.getParameter("submit");

                    if (submit != null && name != null && !name.trim().isEmpty() && email != null && !email.trim().isEmpty()) {
                        if ("Олег".equalsIgnoreCase(name)) {
                            throw new ServletException("Имя 'Олег' не разрешено.");
                        }
                        if (email.endsWith("mail.ru")){
                        	response.sendRedirect("error_mail.jsp");
                        }
                        name_array.add(name);
                        email_array.add(email);
                        reg_date_array.add(new Date());
                        response.sendRedirect("index.jsp");
                    }
                } catch (Exception e) {
                    // перенаправление на страницу ошибки
                    throw new ServletException("Ошибка при обработке данных", e);
                }
            %>

            <table class="user-table">
                <tr>
                    <th>Имя</th>
                    <th>Почта</th>
                    <th>Время регистрации</th>
                </tr>
                <% 
                    SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss", new Locale("uk", "UA"));
                %>
                <% for (int i = 0; i < name_array.size(); ++i) { %>
                    <tr>
                        <td><%= name_array.get(i) %></td>
                        <td><%= email_array.get(i) %></td>
                        <td><%= sdf.format(reg_date_array.get(i)) %></td>
                    </tr>
                <% } %>
            </table>
        </div>
    </div>
</body>
</html>