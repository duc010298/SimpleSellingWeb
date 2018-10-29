<%-- 
    Document   : checkoutStatus
    Created on : Oct 20, 2018, 12:26:02 PM
    Author     : Đỗ Trung Đức
--%>
<% String statusCheckout = (String) request.getAttribute("statusCheckout");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="images/favicon.ico" rel="icon" type="image/png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Thông báo</title>
    </head>
    <body>
        <jsp:include page="/header" />
        <div class="container">
            <div class="jumbotron">
                <h2><%= statusCheckout%></h2>
                <p>Bạn sẽ được chuyển về trang chủ trong 3s</p>
            </div>
        </div>
        <jsp:include page="/header" />
    </body>
    <script>
        setTimeout(function () {
            window.location.href = "index";
        }, 3000);
    </script>
</html>
