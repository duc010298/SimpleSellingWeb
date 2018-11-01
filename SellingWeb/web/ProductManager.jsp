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
        <form class="form-inline" method="get" action="dashboard">
            <input type="text" name="service" value="ProductManger" hidden>
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
        <!--        <br>
                <input class="form-control" id="myInput" type="text" placeholder="Tìm trong trang..">-->
        <br>
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
            <tbody id="myTable">
                <% for (ProductEntity productEntity : productEntitys) {%>
                <tr>
                    <td><%= productEntity.getId()%></td>
                    <td><%= productEntity.getName()%></td>
                    <td><%= productEntity.getQuantity()%></td>
                    <td><%= MyUtils.priceToString(productEntity.getPrice())%> VNĐ</td>
                    <td><img src="<%= productEntity.getPricture()%>" style="width: 90px"></td>
                    <td><%= productEntity.getDescription()%></td>
                    <td><%= productEntity.getStatus() == 1 ? "Active" : "Deactive"%></td>
                    <td><%= productEntity.getLastmodifier()%></td>
                    <td><a class="btn btn-primary" href="dashboard?service=ProductManger&subservice=edit&id=<%= productEntity.getId()%>">Update</a></td>
                    <td><button class="delete btn btn-danger" id="<%= productEntity.getId()%>">Delete</button></td>
                </tr>
                <% }%>
            </tbody>
        </table>

        <div class="btn-group">
            <% if (productEntitys.size() != 0) { %>
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

        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });

        $(".btn-page").on('click', function () {
            var page = $(this).attr("name");
            var url = new URL(window.location.href);
            var subservice = url.searchParams.get("subservice");
            var content = url.searchParams.get("content");
            var status = url.searchParams.get("status");

            if (subservice != "search") {
                window.location.href = document.location.origin + "/dashboard?service=ProductManger&page=" + page;
            } else {
                window.location.href = document.location.origin + "/dashboard?service=ProductManger&subservice=search&content=" + content + "&status=" + status + "&page=" + page;
            }
        });
    </script>
</html>
