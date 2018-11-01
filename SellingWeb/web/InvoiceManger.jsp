<%-- 
    Document   : InvoiceManger
    Created on : Oct 30, 2018, 8:10:39 PM
    Author     : Đỗ Trung Đức
--%>

<%@page import="util.MyUtils"%>
<%@page import="entity.InvoiceEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.AdminEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% AdminEntity adminEntity = (AdminEntity) request.getAttribute("admin");%>
<% ArrayList<InvoiceEntity> invoiceEntitys = (ArrayList<InvoiceEntity>) request.getAttribute("invoiceEntitys");%>
<% int pageInt = (int) request.getAttribute("page");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="images/favicon.ico" rel="icon" type="image/png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Quản lí hóa đơn</title>
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

        <h1>Quản lí hóa đơn</h1>
        <input class="form-control" id="myInput" type="text" placeholder="Tìm trong trang..">
        <br>
        <table class="table table-bordered table-custom table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Ngày tạo</th>
                    <th>Tên tài khoản</th>
                    <th>Tên người nhận hàng</th>
                    <th>Địa chỉ giao hàng</th>
                    <th>Số điện thoại người nhận</th>
                    <th>Tổng số tiền</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody id="myTable">
                <% for (InvoiceEntity entity : invoiceEntitys) {%>
                <tr id="<%= entity.getId()%>">
                    <td><%= entity.getId()%></td>
                    <td><%= entity.getDate()%></td>
                    <td><%= entity.getCustomerId()%></td>
                    <td><%= entity.getName()%></td>
                    <td><%= entity.getAddress()%></td>
                    <td><%= entity.getPhone()%></td>
                    <td><%= MyUtils.priceToString(entity.getTotal())%> VNĐ</td>
                    <% if (entity.getStatus() == 1) { %>
                    <td>Chưa liên hệ</td>
                    <% } else if (entity.getStatus() == 2) { %>
                    <td>Đang giao hàng</td>
                    <% } else if (entity.getStatus() == 3) { %>
                    <td>Đã thanh toán</td>
                    <% } else if (entity.getStatus() == 0) { %>
                    <td>Đã hủy bỏ</td>
                    <% } %>
                </tr>
                <% }%>
            </tbody>
        </table>
        <div class="btn-group">
            <% if (invoiceEntitys.size() != 0) { %>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </body>
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });

        $("#myTable>tr").on('click', function () {
            var id = $(this).attr("id");
            window.location.href = "dashboard?service=InvoiceManger&subservice=InvoiceDetail&id=" + id;
        });
        
        $(".btn-page").on('click', function () {
            var page = $(this).attr("name");
            var url = new URL(window.location.href);
            window.location.href = document.location.origin + "/dashboard?service=InvoiceManger&page=" + page;
        });
    </script>
</html>
