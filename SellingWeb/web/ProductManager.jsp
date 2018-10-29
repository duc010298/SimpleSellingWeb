<%-- 
    Document   : ProductManager
    Created on : Oct 22, 2018, 9:04:25 PM
    Author     : Đỗ Trung Đức
--%>

<%@page import="util.MyUtils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.ProductEntity"%>
<%@page import="entity.AdminEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% AdminEntity adminEntity = (AdminEntity) request.getAttribute("admin");%>
<% ArrayList<ProductEntity> productEntitys = (ArrayList<ProductEntity>) request.getAttribute("productEntitys"); %>
<% int pageInt = (int) request.getAttribute("page");%>
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
        <title>Manger product</title>
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

        <h1>Quản lí sản phẩm</h1>
        <table class="table table-bordered table-custom">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Picture</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Last Modifier</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <% for (ProductEntity productEntity : productEntitys) {%>
                <tr>
                    <th><%= productEntity.getId()%></th>
                    <th><%= productEntity.getName()%></th>
                    <th><%= productEntity.getQuantity()%></th>
                    <th><%= MyUtils.priceToString(productEntity.getPrice())%> VNĐ</th>
                    <th><img src="<%= productEntity.getPricture()%>" style="width: 90px"></th>
                    <th><%= productEntity.getDescription()%></th>
                    <th><%= productEntity.getStatus() == 1 ? "Active" : "Deactive" %></th>
                    <th><%= productEntity.getLastmodifier()%></th>
                    <td><a class="btn btn-primary" href="dashboard?service=ProductManger&subservice=edit&id=<%= productEntity.getId()%>">Update</a></td>
                    <td><button class="delete btn btn-primary" id="<%= productEntity.getId()%>">Delete</button></td>
                </tr>
                <% }%>
            </tbody>
        </table>

        <div class="btn-group">
            <% if (productEntitys.size() != 0) { %>
            <% if (pageInt != 1) {%>
            <a href="dashboard?service=ProductManger&page=<%= pageInt - 1%>" class="btn"><</a>
            <% }%>
            <% if (pageInt > 3) {%>
            <a href="dashboard?service=ProductManger&page=<%= pageInt - 3%>" class="btn"><%= pageInt - 3%></a>
            <% }%>
            <% if (pageInt > 2) {%>
            <a href="dashboard?service=ProductManger&page=<%= pageInt - 2%>" class="btn"><%= pageInt - 2%></a>
            <% }%>
            <% if (pageInt > 1) {%>
            <a href="dashboard?service=ProductManger&page=<%= pageInt - 1%>" class="btn"><%= pageInt - 1%></a>
            <% }%>
            <a href="dashboard?service=ProductManger&page=<%= pageInt%>" class="btn btn-primary"><%= pageInt%></a>
            <a href="dashboard?service=ProductManger&page=<%= pageInt + 1%>" class="btn"><%= pageInt + 1%></a>
            <a href="dashboard?service=ProductManger&page=<%= pageInt + 2%>" class="btn"><%= pageInt + 2%></a>
            <a href="dashboard?service=ProductManger&page=<%= pageInt + 3%>" class="btn"><%= pageInt + 3%></a>
            <a href="dashboard?service=ProductManger&page=<%= pageInt + 1%>" class="btn">></a>
            <% } else {%>
            <a href="dashboard?service=ProductManger&page=<%= pageInt - 1%>" class="btn"><</a>
            <a href="dashboard?service=ProductManger&page=1" class="btn">1</a>
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
    </body>
    <script>
        function notify(title, message) {
            $("#notifyModal .modal-title").html(title);
            $("#notifyModal .modal-body").html(message);
            $("#notifyModal").modal({backdrop: "static"});
        }
        
        $(".delete").on('click', function () {
            var id = $(this).attr("id");
            $.ajax({
                url: "dashboard",
                type: 'POST',
                data: {
                    service: "deleteProduct",
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
</html>
