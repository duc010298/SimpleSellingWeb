<%-- 
    Document   : AdminLogin
    Created on : Oct 22, 2018, 8:19:47 PM
    Author     : Đỗ Trung Đức
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String status = (String) request.getAttribute("status"); %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng nhập</title>
    <link href="images/favicon.ico" rel="icon" type="image/png"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link href="css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="container">
    <div class="signin-card">
        <h1 class="display1">Đăng nhập vào hệ thống</h1>
        <form action="AdminLogin" method="post" role="form">
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
            <% if(status != null) { %>
            <p class="subhead"><%= status %></p>
            <% }%>
            <div class="form-group">
                <div class="checkbox checkbox-default">
                    <input id="remember" type="checkbox" checked name="remember-me">
                    <label><span class="chk-span checked" tabindex="2"></span>Nhớ đăng nhập</label>
                </div>
            </div>
            <div>
                <button class="btn btn-block btn-info ripple-effect" type="submit" name="Submit" alt="sign in">Đăng nhập</button>
            </div>
        </form>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
    $(".checkbox").on("click", function () {
        if(document.getElementById("remember").checked == true) {
            $(".chk-span").attr("class", "chk-span");
            document.getElementById("remember").checked = false;
        } else {
            $(".chk-span").attr("class", "chk-span checked");
            document.getElementById("remember").checked = true;
        }
    });
</script>
</body>
</html>