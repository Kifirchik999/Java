<%@ page import="Model.Point" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ojito makato
  Date: 12.10.2023
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
</head>
<body onload="draw();">
<div class="wrapper">
    <header id="header">
        <div class="inner-content-header">
        <span>
            Ержанов Куаныш Рамешович . Курсовая 
        </span>
        </div>
    </header>

    <div class="main-content">
        <div>
            <canvas id="canvas" onclick="canvasClick()" width="300" height="300"
                    style="background: #eeeeee; border-radius: 10px"></canvas>
            <%--            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>--%>
            <%--            <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"--%>
            <%--                    integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0=" crossorigin="anonymous"></script>--%>
            <script type="text/javascript">
                function draw() {
                    let canvas = document.getElementById("canvas");

                    let ctx = canvas.getContext("2d");

                    ctx.beginPath();
                    ctx.clearRect(0, 0, canvas.width, canvas.height);

                    // setting blue color
                    ctx.strokeStyle = "#3399ff";
                    ctx.fillStyle = "#3399ff";

                    // filling area
                    // rectangle
                    ctx.fillRect(canvas.width / 2, canvas.height / 2, canvas.width / 3, canvas.height / 3);
                    ctx.moveTo(canvas.width / 2, canvas.height / 2);
                    // 1/4 of circle
                    ctx.arc(150, 150, 50, -3.14 / 2, 3.14, 1);
                    ctx.fill();
                    // triangle
                    ctx.moveTo(150, 150);
                    ctx.lineTo(150, 100);
                    ctx.lineTo(200, 150);
                    ctx.lineTo(150, 150);
                    ctx.fill();

                    // setting black color
                    ctx.fillStyle = "black";
                    ctx.font = "12px serif";

                    // vertical 'R' marks
                    ctx.fillText("R", canvas.width / 1.95, canvas.height / 5.5);
                    ctx.fillText("R/2", canvas.width / 1.93, canvas.height / 2.85);
                    ctx.fillText("-R/2", canvas.width / 1.93, canvas.height / 1.475);
                    ctx.fillText("-R", canvas.width / 1.93, canvas.height / 1.184);

                    // horizontal 'R' marks
                    ctx.fillText("-R", canvas.width / 6.7, canvas.height / 2.05);
                    ctx.fillText("-R/2", canvas.width / 3.38, canvas.height / 2.05);
                    ctx.fillText("R/2", canvas.width / 1.59, canvas.height / 2.05);
                    ctx.fillText("R", canvas.width / 1.23, canvas.height / 2.05);
                    ctx.stroke();

                    ctx.beginPath();
                    ctx.strokeStyle = "black";
                    // graph arrows
                    // vertical arrow
                    ctx.moveTo(canvas.width / 2, 0);
                    ctx.lineTo(canvas.width / 2, canvas.height);
                    ctx.moveTo(canvas.width / 1.95, canvas.height * 0.03);
                    ctx.lineTo(canvas.width / 2, 0);
                    ctx.moveTo(canvas.width / 2.05, canvas.height * 0.03);
                    ctx.lineTo(canvas.width / 2, 0);
                    // horizontal arrow
                    ctx.moveTo(0, canvas.height / 2);
                    ctx.lineTo(canvas.width, canvas.height / 2);
                    ctx.moveTo(canvas.width * 0.97, canvas.height / 1.95);
                    ctx.lineTo(canvas.width, canvas.height / 2);
                    ctx.moveTo(canvas.width * 0.97, canvas.height / 2.05);
                    ctx.lineTo(canvas.width, canvas.height / 2);

                    // R unit marks
                    // vertical marks
                    ctx.moveTo(canvas.width / 2.04, canvas.height / 1.20);
                    ctx.lineTo(canvas.width / 1.96, canvas.height / 1.20);
                    ctx.moveTo(canvas.width / 2.04, canvas.height / 1.5);
                    ctx.lineTo(canvas.width / 1.96, canvas.height / 1.5);
                    ctx.moveTo(canvas.width / 2.04, canvas.height / 3);
                    ctx.lineTo(canvas.width / 1.96, canvas.height / 3);
                    ctx.moveTo(canvas.width / 2.04, canvas.height / 6);
                    ctx.lineTo(canvas.width / 1.96, canvas.height / 6);

                    // horizontal marks
                    ctx.moveTo(canvas.width / 1.2, canvas.height / 2.04);
                    ctx.lineTo(canvas.width / 1.2, canvas.height / 1.96);
                    ctx.moveTo(canvas.width / 1.5, canvas.height / 2.04);
                    ctx.lineTo(canvas.width / 1.5, canvas.height / 1.96);
                    ctx.moveTo(canvas.width / 3, canvas.height / 2.04);
                    ctx.lineTo(canvas.width / 3, canvas.height / 1.96);
                    ctx.moveTo(canvas.width / 6, canvas.height / 2.04);
                    ctx.lineTo(canvas.width / 6, canvas.height / 1.96);


                    ctx.stroke();
                }
            </script>
            <script src="js/graphic.js"></script>
            <script src="js/validPointLib.js"></script>
            <script type="text/javascript">
                const canvas = document.getElementById('canvas');
                const url = "http://localhost:8080/web-lab-2_war/controller";

                function canvasClick() {
                    // let canvas = document.getElementById('canvas');
                    canvas.addEventListener('click', event => {
                        let r = $('input[type="radio"]:checked:first').val();
                        if (!r) {
                            alert("R is undefined");
                        } else {
                            getPoint(r);
                        }
                    });
                }

                function getCoordinatePosition() {
                    const rect = canvas.getBoundingClientRect();
                    const x = event.clientX - rect.left
                    const y = event.clientY - rect.top
                    // console.log("x: " + x + " y: " + y)
                    return {x: x, y: y}
                }

                function getPoint(r) {
                    canvas.addEventListener('mousedown', function (e) {
                        let data = getCoordinatePosition(canvas, e)

                        let pointX = Math.round(data.x);
                        let pointY = Math.round(data.y);

                        let ctx = canvas.getContext("2d");

                        ctx.beginPath();
                        ctx.fillStyle = "red"
                        ctx.arc(pointX, pointY, 5, 0, 2 * Math.PI);
                        ctx.fill();
                        checkPointValid(r, pointX,pointY);
                        document.getElementById('x').value = checkPointValid(r, pointX,pointY).pointX;
                        document.getElementById('y').value = checkPointValid(r, pointX,pointY).pointY;
                        document.getElementById('btn').click();
                    })
                }
            </script>

        </div>

        <form action='controller' method="get" id="form-lab1">
            <input type="text" name="x" id="x" placeholder="enter x" maxlength="10">
            <input type="text" name="y" id="y" placeholder="enter y" maxlength="10">
            <div class="r">
                R:
                <label for="1">1</label>
                <input type="radio" value="1" name="radius" id="1">
                <label for="2">2</label>
                <input type="radio" value="2" name="radius" id="2">
                <label for="3">3</label>
                <input type="radio" value="3" name="radius" id="3">
                <label for="4">4</label>
                <input type="radio" value="4" name="radius" id="4">
                <label for="5">5</label>
                <input type="radio" value="5" name="radius" id="5">
            </div>
            <input type="submit" value="отправить форму" class="btn" id="btn">
        </form>
    </div>
    <div>
        <table class="table">
            <tr><th>X</th><th>Y</th><th>R</th><th>Результат</th></tr>"
            <% ArrayList<Point> data = new ArrayList<>();
                if (request.getSession().getAttribute("data") != null) {
                    data = (ArrayList<Point>) request.getSession().getAttribute("data");
                    for (int i=0; i < data.size();i++){ %>
            <tr><td><%=  data.get(i).getX() %></td>
                <td><%= data.get(i).getY() %></td>
                <td><%=  data.get(i).getR() %> </td>
                <td><%= data.get(i).getResult() %></td></tr>
            <%    }
            } %>

        </table>

    </div>
</div>

<script src="js/script.js"></script>
</body>
</html>
