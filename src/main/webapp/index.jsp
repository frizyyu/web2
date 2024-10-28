<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.models.PointCheckResult" %>
<%@ page import="org.example.models.Point" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Васильев Артём Р3219</title>
    <style>
        body {
            background-image: url("https://i.ytimg.com/vi/p0l1SPvzTQc/maxresdefault.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }

        .container {
            font-family: sans-serif;
            font-size: 20px;
        }

        .header {
            font-family: monospace;
            font-size: 24px;
            color: aquamarine;
            text-align: center;
            text-shadow:
                    -0   -1px 2px #000000,
                    0   -1px 2px #000000,
                    -0    1px 2px #000000,
                    0    1px 2px #000000,
                    -1px -0   2px #000000,
                    1px -0   2px #000000,
                    -1px  0   2px #000000,
                    1px  0   2px #000000,
                    -1px -1px 2px #000000,
                    1px -1px 2px #000000,
                    -1px  1px 2px #000000,
                    1px  1px 2px #000000,
                    -1px -1px 2px #000000,
                    1px -1px 2px #000000,
                    -1px  1px 2px #000000,
                    1px  1px 2px #000000;
        }

        .graph-side {
            height: 80vh;
            float: right;
            width: 40%;
            text-align: center;
            border: 1px solid black;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.82);
        }

        svg {
            margin-top: 10%;
            width: 90%;
            height: 90%;
        }

        .results-side {
            height: 80vh;
            float: right;
            width: 39%;
            border: 1px solid black;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.82);
            overflow-x: auto;
        }

        .res-table {
            margin: auto;
            width: 100%;
        }

        table {
            max-width: 100%;
            border-collapse: collapse;
        }

        tr, th, td {
            border: 1px solid black;
        }

        .input-side {
            height: 80vh;
            float: left;
            width: 20%;
            border: 1px solid black;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.82);
        }

        .input-group, .btn, .input-log, .shrek {
            margin-left: 20%;
        }

        .input-log {
            color: red;
        }

        .footer {
            text-align: center;
            position: absolute;
            width: 99%;
            bottom: 0;
            border: 1px solid black;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.82);
        }
        .dot{
            transition: 1.5s;
        }
        a {
            color: aquamarine;
            text-shadow:
                    -0   -1px 2px #000000,
                    0   -1px 2px #000000,
                    -0    1px 2px #000000,
                    0    1px 2px #000000,
                    -1px -0   2px #000000,
                    1px -0   2px #000000,
                    -1px  0   2px #000000,
                    1px  0   2px #000000,
                    -1px -1px 2px #000000,
                    1px -1px 2px #000000,
                    -1px  1px 2px #000000,
                    1px  1px 2px #000000,
                    -1px -1px 2px #000000,
                    1px -1px 2px #000000,
                    -1px  1px 2px #000000,
                    1px  1px 2px #000000;
        }

        .shrek{
            margin-left: 20%;
            margin-top: 5%;
            margin-bottom: 10%;
            height: 15%;
            width: 70%;
        }
        .input-group::before{
            content: "Потыкайте, пожалуйста";
            color: black;
        }
        .input-group:hover{
            color: darkslateblue;
        }

        .input-group p {
            display: block;
        }
    </style>
</head>
<body>
<div class="container" id="container">
    <div class="header">
        <h2>Васильев Артём Р3219, вариант 408358</h2>
    </div>
    <div class="input-side">
        <img class="shrek" src="https://media1.tenor.com/m/aGSZzZMTL8IAAAAd/shrek-shrek-dancing.gif" alt="shrek" />
        <form>
            <div class="input-group">
                <details class="hide-elements" id="hide-elements">
                    <summary>Ввод Х и Y</summary>
                    <p>Выберите X:</p>
                    <div id="coord-x">
                        <input type="checkbox" id="x-2" name="x" value="-2">
                        <label for="x-2"> -2</label><br>
                        <input type="checkbox" id="x-1.5" name="x" value="-1.5">
                        <label for="x-1.5"> -1.5</label><br>
                        <input type="checkbox" id="x-1" name="x" value="-1">
                        <label for="x-1"> -1</label><br>
                        <input type="checkbox" id="x-0.5" name="x" value="-0.5">
                        <label for="x-0.5"> -0.5</label><br>
                        <input type="checkbox" id="x0" name="x" value="0">
                        <label for="x0"> 0</label><br>
                        <input type="checkbox" id="x0.5" name="x" value="0.5">
                        <label for="x0.5"> 0.5</label><br>
                        <input type="checkbox" id="x1" name="x" value="1">
                        <label for="x1"> 1</label><br>
                        <input type="checkbox" id="x1.5" name="x" value="1.5">
                        <label for="x1.5"> 1.5</label><br>
                        <input type="checkbox" id="x2" name="x" value="2">
                        <label for="x2"> 2</label><br>
                    </div>

                    <br>
                    <label for="coord-y">Введите Y: </label>
                    <input type="text" id="coord-y" name="coord-y" />
                </details>
                <div class="coord-r">
                    <p>Выберите R</p>
                    <button id="r1" type="button">1</button>
                    <button id="r1.5" type="button">1.5</button>
                    <button id="r2" type="button">2</button>
                    <button id="r2.5" type="button">2.5</button>
                    <button id="r3" type="button">3</button>
                </div>
            </div>
            <br>
            <div class="btn">
                <button id="send-btn" type="submit">Отправить</button>
            </div>
            <br>
            <div class="input-log" id="input-log">
                <!--Поле для вывода ошибок при вводе-->
            </div>
        </form>
    </div>
    <!--таблица для результатов-->
    <div class="results-side">
        <table class="res-table" id="res-table">
            <% PointCheckResult pcr = (PointCheckResult) request.getSession().getAttribute("pointCheckResult");
                if (pcr == null || pcr.getResults().isEmpty()) {
            %>
            <tr>
                Ничего нет :(
            </tr>
            <% } else { %>
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
            <% } %>
        </table>
    </div>
    <div id="result"></div>
    <!--график-->
    <div class="graph-side">
        <svg id="graph" xmlns="http://www.w3.org/2000/svg" width="650" height="650">

            <!--точка для отрисовки попадания-->
            <circle cx="300" cy="300" class="dot" id="dot" r="5" visibility="visible" stroke="black" fill="black" stroke-opacity="0" fill-opacity="0"></circle>

            <!-- Оси со стрелками -->
            <line stroke="gray" x1="0" x2="600" y1="300" y2="300"></line>
            <line stroke="gray" x1="300" x2="300" y1="0" y2="600"></line>
            <polygon points="300,0 294,15 306,15" stroke="white"></polygon>
            <polygon points="600,300 585,306 585,294" stroke="white"></polygon>

            <!-- Засечки -->
            <line stroke="gray" x1="400" x2="400" y1="310" y2="290"></line>
            <line stroke="gray" x1="500" x2="500" y1="310" y2="290"></line>

            <line stroke="gray" x1="200" x2="200" y1="310" y2="290"></line>
            <line stroke="gray" x1="100" x2="100" y1="310" y2="290"></line>

            <line stroke="gray" x1="290" x2="310" y1="100" y2="100"></line>
            <line stroke="gray" x1="290" x2="310" y1="200" y2="200"></line>

            <line stroke="gray" x1="290" x2="310" y1="400" y2="400"></line>
            <line stroke="gray" x1="290" x2="310" y1="500" y2="500"></line>

            <text x="385" y="330">R/2</text>
            <text x="495" y="330">R</text>

            <text x="90" y="330">-R</text>
            <text x="180" y="330">-R/2</text>

            <text x="255" y="205">R/2</text>
            <text x="270" y="105">R</text>

            <text x="250" y="405">-R/2</text>
            <text x="265" y="505">-R</text>

            <text x="310" y="15">Y</text>
            <text x="585" y="290">X</text>

            <!--Прямоугольник-->
            <rect x="300" y="300" width="100" height="200" fill="#0a0eff" fill-opacity="0.1" stroke="#0c0fff"></rect>

            <!--Треугольник-->
            <polygon points="200,300 300,200 300,300" fill="#0a0eff" fill-opacity="0.1" stroke="#0c0fff"></polygon>

            <!--Полукруг-->
            <path d="M 300 200 A 100 100, 0, 0, 1, 400 300 L 300 300 Z" fill="#0a0eff" fill-opacity="0.1"
                  stroke="#0c0fff"></path>
        </svg>
    </div>
    <div class="footer">
        <p>
            ВСЕ ПРАВА БЕЗЗАЩИТНЫ | <a href="https://frizyyu.github.io" title="my-site">САЙТИК</a>
        </p>
    </div>
</div>
<script type="module" src="main.js"></script>
<script type="module" src="checkboxChecker.js"></script>
</body>