<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.models.PointCheckResult" %>
<%@ page import="org.example.models.Point" %>
<html>
<head>
    <title>Результат</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 99vh;
        }
        .container {
            border: 1px solid black;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.82);
            text-align: center;
        }
        table{
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <% PointCheckResult pcr = (PointCheckResult) request.getSession().getAttribute("pointCheckResult");
        if (pcr == null || pcr.getResults().isEmpty()) {
    %>
    <h1>Результат</h1>
    <table>
        <tr>
            <th>Попали?</th>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Время работы (мс)</th>
            <th>Время</th>
        </tr>
    </table>
    <% } else { %>
    <h1>Результат</h1>
    <table>
        <tr>
            <th>Попали?</th>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Время работы (мс)</th>
            <th>Время</th>
        </tr>
        <% for (Point point : pcr.getResults()) { %>
        <tr>
            <td><%= point.getIsHit() ? "Да" : "Нет" %></td>
            <td><%= point.getX() %></td>
            <td><%= point.getY() %></td>
            <td><%= point.getR() %></td>
            <td><%= point.getTime() %></td>
            <td><%= point.getWorkTime() %></td>
        </tr>
        <% } %>
    </table>
    <% } %>
    <a href="index.jsp">Назад</a>
</div>
</body>
</html>