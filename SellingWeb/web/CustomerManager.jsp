<%-- 
    Document   : CustomerManager
    Created on : Nov 2, 2018, 9:18:26 PM
    Author     : Đỗ Trung Đức
--%>

<%@page import="entity.CustomerEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.AdminEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% AdminEntity adminEntity = (AdminEntity) request.getAttribute("admin");%>
<% ArrayList<CustomerEntity> customerEntitys = (ArrayList<CustomerEntity>) request.getAttribute("customerEntitys"); %>
<% int pageInt = (int) request.getAttribute("page");%>
<% String content = (String) request.getAttribute("content"); %>
<% String status = (String) request.getAttribute("status"); %>
<% if (content == null) {
        content = "";
    } %>
<% if (status == null) {
        status = "";
    }%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="images/favicon.ico" rel="icon" type="image/png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Quản lí khách hàng</title>
    </head>
    <body>
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

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index">Manager</a>
            <div class="navbar-collapse collapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                            Quản lí sản phẩm
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="dashboard?service=ProductManger">Danh sách sản phẩm</a>
                            <a class="dropdown-item" href="dashboard?service=ProductManger&subservice=add">Thêm sản phẩm</a>
                        </div>
                    </li>
                    <li><a class="nav-link" href="dashboard?service=CategoryManager">Quản lí danh mục sản phẩm</a></li>
                    <li><a class="nav-link" href="dashboard?service=InvoiceManger">Quản lí hóa đơn</a></li>
                    <li><a class="nav-link" href="dashboard?service=CustomerManager">Quản lí khách hàng</a></li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            <i class="fas fa-user-circle"></i> <%= adminEntity.getUsername()%>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="AdminLogin?logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
                        </div>
                    </li>
                    <li><div class="nav-link">           .</div></li>
                </ul>
            </div>
        </nav>

        <h1>Quản lí khách hàng</h1>
        <form class="form-inline" method="get" action="dashboard">
            <input type="text" name="service" value="CustomerManager" hidden>
            <input type="text" name="subservice" value="search" hidden>
            <input class="form-control mr-sm-2" name="content" type="text" placeholder="Tìm kiếm" value="<%= content%>">
            <% if (status.equals("active")) { %>
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="status" value="active" checked="checked">Active
                </label>
            </div>
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="status" value="deactive">Deacive
                </label>
            </div>
            <% } else if (status.equals("deactive")) { %>
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="status" value="active">Active
                </label>
            </div>
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="status" value="deactive" checked="checked">Deacive
                </label>
            </div>
            <% } else { %>
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="status" value="active">Active
                </label>
            </div>
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="status" value="deactive">Deacive
                </label>
            </div>
            <% } %>
            <button type="submit" class="btn btn-success"><i class="fas fa-search"></i></button>
        </form>
        <br>
        <table class="table table-bordered table-custom">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên đăng nhập</th>
                    <th>Họ và tên</th>
                    <th>Địa chỉ</th>
                    <th>Số điện thoại</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <% for (CustomerEntity customerEntity : customerEntitys) {%>
                <tr>
                    <td><%= customerEntity.getId()%></td>
                    <td><%= customerEntity.getUsername()%></td>
                    <td><%= customerEntity.getName()%></td>
                    <td><%= customerEntity.getAddress()%></td>
                    <td><%= customerEntity.getPhone()%></td>
                    <% if (customerEntity.isStatus()) {%>
                    <td><button class="active btn btn-primary" name="<%= customerEntity.getId()%>">Active</button></td>
                    <% } else {%>
                    <td><button class="deactive btn btn-primary" name="<%= customerEntity.getId()%>">Deactive</button></td>
                    <% } %>
                </tr>
                <% } %>
            </tbody>
        </table>

        <div class="btn-group">
            <% if (customerEntitys.size() != 0 && pageInt != 0) { %>
            <% if (pageInt != 1) {%>
            <button class="btn btn-page" name="<%= pageInt - 1%>"><</button>
            <% }%>
            <% if (pageInt > 3) {%>
            <button class="btn btn-page" name="<%= pageInt - 3%>"><%= pageInt - 3%></button>
            <% }%>
            <% if (pageInt > 2) {%>
            <button class="btn btn-page" name="<%= pageInt - 2%>"><%= pageInt - 2%></button>
            <% }%>
            <% if (pageInt > 1) {%>
            <button class="btn btn-page" name="<%= pageInt - 1%>"><%= pageInt - 1%></button>
            <% }%>
            <button class="btn btn-primary btn-page" name="<%= pageInt%>"><%= pageInt%></button>
            <button class="btn btn-page" name="<%= pageInt + 1%>"><%= pageInt + 1%></button>
            <button class="btn btn-page" name="<%= pageInt + 2%>"><%= pageInt + 2%></button>
            <button class="btn btn-page" name="<%= pageInt + 3%>"><%= pageInt + 3%></button>
            <button class="btn btn-page" name="<%= pageInt + 1%>">></button>
            <% } else {%>
            <button class="btn btn-primary btn-page" name="<%= pageInt - 1%>"><</button>
            <button class="btn btn-primary btn-page" name="1">1</button>
            <% }%>
        </div>

        <footer class="page-footer font-small blue">
            <div class="footer-copyright text-center py-3">© 2018 Copyright:
                <a href="#"> SimpleWeb.com</a>
            </div>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script>
            function notify(title, message) {
                $("#notifyModal .modal-title").html(title);
                $("#notifyModal .modal-body").html(message);
                $("#notifyModal").modal({backdrop: "static"});
            }

            $(".btn-page").on('click', function () {
                var page = $(this).attr("name");
                window.location.href = document.location.origin + "/dashboard?service=CustomerManager&page=" + page;
            });

            $(".active").on('click', function () {
                var id = $(this).attr("name");

                $.ajax({
                    url: "dashboard",
                    type: 'POST',
                    data: {
                        service: "changeStatusCustomer",
                        status: false,
                        id: id
                    },
                    error: function () {
                        notify("Lỗi", "Không thể xử lí dữ liệu");
                    }
                }).done(function (result) {
                    notify("Thông báo", result);
                    $(".btn-danger").on('click', function () {
                        location.reload();
                    });
                });
            });

            $(".deactive").on('click', function () {
                var id = $(this).attr("name");

                $.ajax({
                    url: "dashboard",
                    type: 'POST',
                    data: {
                        service: "changeStatusCustomer",
                        status: true,
                        id: id
                    },
                    error: function () {
                        notify("Lỗi", "Không thể xử lí dữ liệu");
                    }
                }).done(function (result) {
                    notify("Thông báo", result);
                    $(".btn-danger").on('click', function () {
                        location.reload();
                    });
                });
            });
        </script>
    </body>
</html>
