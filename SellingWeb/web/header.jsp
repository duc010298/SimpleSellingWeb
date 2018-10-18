<%-- 
    Document   : header
    Created on : Oct 18, 2018, 9:41:36 AM
    Author     : Đỗ Trung Đức
--%>

<%@page import="util.MyUtils"%>
<%@page import="util.MyUtils"%>
<%@page import="entity.ProductCartEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.CustomerEntity"%>
<%@page import="entity.CustomerEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% CustomerEntity customerEntity = (CustomerEntity) request.getAttribute("customer"); %>
<% ArrayList<ProductCartEntity> productCartEntitys = (ArrayList<ProductCartEntity>) request.getAttribute("cartDetail"); %>
<% int totalQuantity = (int) request.getAttribute("totalQuantity"); %>
<% float totalPrice = (float) request.getAttribute("totalPrice"); %>

<div class="modal fade" id="notifyModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">...</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">...</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<% if (customerEntity == null) { %>
<div class="modal fade" id="loginModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h2><i class="far fa-user-circle"></i> Đăng nhập</h2>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="login" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="username">Tên đăng nhập:</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu:</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
                    </div>
                    <div class="form-group form-check">
                        <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" name="remember-me"> Nhớ đăng nhập
                        </label>
                    </div>  
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="registerModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h2><i class="fas fa-user-plus"></i> Đăng kí</h2>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="customer" method="post" name="registerForm" onsubmit="return validateFormRegister()">
                <input type="text" hidden="" value="register" name="service">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">Họ và tên:</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Nhập họ và tên" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Địa chỉ:</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="Nhập địa chỉ" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại:</label>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Nhập số điện thoại" required>
                    </div>
                    <div class="form-group">
                        <label for="username1">Tên đăng nhập:</label>
                        <input type="text" class="form-control" id="username1" name="username" placeholder="Nhập tên đăng nhập" required>
                    </div>
                    <div class="form-group">
                        <label for="password1">Mật khẩu:</label>
                        <input type="password" class="form-control" id="password1" name="password" placeholder="Nhập mật khẩu" required>
                    </div>
                    <div class="form-group">
                        <label for="repassword">Nhập lại mật khẩu:</label>
                        <input type="password" class="form-control" id="repassword" name="repassword" placeholder="Nhập lại mật khẩu" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Đăng kí</button>
                </div>
            </form>
        </div>
    </div>
</div>
<% } %>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index">SE1215 Shopping</a>
    <div class="navbar-collapse collapse">
        <ul class="navbar-nav mr-auto">
            <form class="form-inline" action="/action_page.php">
                <input class="form-control mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </ul>
        <ul class="navbar-nav">
            <% if (customerEntity == null) { %>
            <li><div class="nav-link" href="#" id="registerBtn"><i class="fas fa-user-plus"></i> Đăng kí</div></li>
            <li><a class="nav-link" href="#" id="loginBtn"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a></li> 
                <% } else {%>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    <i class="fas fa-user-circle"></i> <%= customerEntity.getName()%>
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#"><i class="fas fa-user"></i> Thông tin tài khoản</a>
                    <a class="dropdown-item" href="login?logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
                </div>
            </li>
            <% }%>
            <li>
                <button type="button" class="btn btn-info nav-item" data-toggle="dropdown">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i> Cart <span class="badge badge-pill badge-danger" id="cart-count-1"><%= totalQuantity%></span>
                </button>
                <div class="dropdown-menu dropdown-cart">
                    <div class="grid-4">
                        <div><i class="fa fa-shopping-cart" aria-hidden="true"></i> <span class="badge badge-pill badge-danger" id="cart-count-2"><%= totalQuantity%></span></div>
                        <p>Total: <span class="text-info"><span id="cart-total-price"><%= MyUtils.priceToString(totalPrice)%></span> VNĐ</span></p>
                    </div>
                    <hr>
                    <div class="grid-5" id="cart-detail">
                        <% if (productCartEntitys != null) { %>
                        <% for (ProductCartEntity cartEntity : productCartEntitys) {%>
                        <img src="<%= cartEntity.getPricture()%>" class="img-product" alt="simple">
                        <div id="<%= cartEntity.getId()%>"><p><%= cartEntity.getName()%></p><span class="price text-info"> <%= MyUtils.priceToString(cartEntity.getPrice())%></span>  Quantity: <span class="count"><%= cartEntity.getQuantityInCart()%></span></div>
                                <% } %>
                                <% }%>
                    </div>
                    <hr>
                    <a href="Cart?service=checkout" class="btn btn-primary btn-block" role="button">Checkout</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<script>
    <% if (customerEntity == null) { %>
    document.getElementById("loginBtn").onclick = function () {
        $("#loginModal").modal({backdrop: "static"});
    };

    document.getElementById("registerBtn").onclick = function () {
        $("#registerModal").modal({backdrop: "static"});
    };

    function validateFormRegister() {
        $("#registerModal").modal('hide');
        var phone = document.forms["registerForm"]["phone"].value;
        var phoneRegex = /^[0-9]{10}$/;
        if (!phoneRegex.test(phone)) {
            notify("Thông báo", "Số điện thoại không đúng");
            return false;
        }

        var username = document.forms["registerForm"]["username"].value;
        var usernameRegex = /^[a-zA-Z0-9]{6,30}$/;
        if (!usernameRegex.test(username)) {
            notify("Thông báo", "Tên đăng nhập không đúng");
            return false;
        }
        var password = document.forms["registerForm"]["password"].value;
        var passwordRegex = /^.{8,32}$/;
        if (!passwordRegex.test(password)) {
            notify("Thông báo", "Mật khẩu không đúng");
            return false;
        }
        var repassword = document.forms["registerForm"]["repassword"].value;
        if (password !== repassword) {
            notify("Thông báo", "Mật khẩu nhập lại không đúng");
            return false;
        }
    }
    <% }%>

    function notify(title, message) {
        $("#notifyModal .modal-title").html(title);
        $("#notifyModal .modal-body").html(message);
        $("#notifyModal").modal({backdrop: "static"});
    }
</script>
