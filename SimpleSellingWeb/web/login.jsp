<%-- 
    Document   : login
    Created on : Oct 10, 2018, 7:58:41 PM
    Author     : Đỗ Trung Đức
--%>
<% String status = (String) request.getAttribute("status"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html xmlns:th="http://www.thymeleaf.org">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Đăng nhập</title>
        <link href="images/favicon.ico" rel="icon" type="image/png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="container">
            <div class="signin-card">
                <a href="index"><h1 class="display1">Simple Selling Web</h1></a>
                <p class="subhead">Đăng nhập</p>
                <form action="login" method="post" role="form">
                    <div class="form-group">
                        <input class="form-control" name="username" type="text" size="18" alt="login" required/>
                        <span class="form-highlight"></span>
                        <span class="form-bar"></span>
                        <label class="float-label">Tên đăng nhập</label>
                    </div>
                    <div class="form-group">
                        <input class="form-control" name="password" type="password" size="18" alt="password" required>
                        <span class="form-highlight"></span>
                        <span class="form-bar"></span>
                        <label class="float-label">Mật khẩu</label>
                    </div>
                    <% if (status != null) {%>
                    <p class="subhead"><%= status%></p>
                    <% }%>
                    <div class="form-group">
                        <div class="checkbox checkbox-default">
                            <input id="remember" type="checkbox" checked name="remember-me">
                            <label><span class="chk-span checked" tabindex="2"></span>Nhớ đăng nhập</label>
                        </div>
                    </div>
                    <div>
                        <button class="btn btn-block btn-info ripple-effect" type="submit" name="Submit" alt="sign in">Đăng nhập
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script>
            $(".checkbox").on("click", function () {
                if (document.getElementById("remember").checked == true) {
                    $(".chk-span").attr("class", "chk-span");
                    document.getElementById("remember").checked = false;
                } else {
                    $(".chk-span").attr("class", "chk-span checked");
                    document.getElementById("remember").checked = true;
                }
            });
            <% if (status != null) {%>
            <% if (status.equals("Đăng xuất thành công")) {%>
            setTimeout(function () {
                window.location.href = "index";
            }, 5000);
            <% } %>
            <% }%>
        </script>
    </body>
</html>