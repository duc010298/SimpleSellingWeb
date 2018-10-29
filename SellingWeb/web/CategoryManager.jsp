<%-- 
    Document   : CategoryManager
    Created on : Oct 25, 2018, 9:09:14 AM
    Author     : Đỗ Trung Đức
--%>

<%@page import="java.util.HashMap"%>
<%@page import="entity.CategoryEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="entity.AdminEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% AdminEntity adminEntity = (AdminEntity) request.getAttribute("admin");%>
<% HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = (HashMap<CategoryEntity, ArrayList<CategoryEntity>>) request.getAttribute("category");%>
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
        <title>Category Manager</title>
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

        <div class="container">
            <div class="jumbotron">
                <h5>Thêm danh mục cấp 1</h5>
                <form method="post" action="dashboard">
                    <input type="text" name="service" value="addCategory1"  hidden>
                    <div class="form-group">
                        <label for="value">Nhập tên danh mục:</label>
                        <input type="text" class="form-control" id="value" name="value" placeholder="Nhập tên danh mục" required>
                    </div>
                    <button class="btn btn-success" type="submit">Thêm</button>
                </form>
                <hr>
                <h5>Thêm danh mục cấp 2</h5>
                <form method="post" action="dashboard">
                    <input type="text" name="service" value="addCategory2"  hidden>
                    <div class="form-group">
                        <label for="value">Nhập tên danh mục:</label>
                        <input type="text" class="form-control" id="value" name="value" placeholder="Nhập tên danh mục" required>
                    </div>
                    <div class="form-group">
                        <label for="categoryParent">Chọn danh mục cấp 1:</label>
                        <select class="form-control" id="categoryParent" name="categoryParent">
                            <% for (Map.Entry m : hashMap.entrySet()) { %>
                            <% CategoryEntity categoryEntity = (CategoryEntity) m.getKey();%>
                            <option value="<%= categoryEntity.getId()%>"><%= categoryEntity.getName()%></option>
                            <% }%>
                        </select>
                    </div>
                    <button class="btn btn-success" type="submit">Thêm</button>
                </form>
            </div>
        </div>
        <br>
        <div class="jumbotron">
            <% for (Map.Entry m : hashMap.entrySet()) { %>
            <% CategoryEntity categoryEntity = (CategoryEntity) m.getKey();%>
            <h3 class="mr-sm-2"><%= categoryEntity.getName()%></h3>
            <button class="btn btn-primary mr-sm-2 editCategory" name="<%= categoryEntity.getId()%>">Edit</button>
            <% if (categoryEntity.isStatus()) {%>
            <button class="btn btn-danger mr-sm-2 disableCategory" name="<%= categoryEntity.getId()%>">Disable</button>
            <% } else {%>
            <button class="btn btn-success mr-sm-2 enableCategory" name="<%= categoryEntity.getId()%>">Enable</button>
            <% } %>
            <table class="table table-bordered table-category">
                <thead>
                    <tr>
                        <th>Tên danh mục</th>
                        <th>Sửa</th>
                        <th>Đổi trạng thái</th>
                    </tr>
                </thead>
                <% ArrayList<CategoryEntity> categoryEntitys = (ArrayList<CategoryEntity>) m.getValue(); %>
                <% for (CategoryEntity c : categoryEntitys) {%>
                <tbody>
                    <tr>
                        <td><%= c.getName()%></td>
                        <td><button class="btn btn-primary editCategory" name="<%= c.getId()%>">Edit</button></td>
                        <td>
                            <% if (c.isStatus()) {%>
                            <button class="btn btn-danger disableCategory" name="<%= c.getId()%>">Disable</button>
                            <% } else {%>
                            <button class="btn btn-success enableCategory" name="<%= c.getId()%>">Enable</button>
                            <% } %>
                        </td>
                    </tr>
                </tbody>
                <% } %>
            </table>
            <% } %>
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
    </script>
    <% String status = (String) request.getAttribute("status"); %>
    <% if (status != null) {%>
    <script>
        notify("Thông báo", "<%=status%>");
    </script>
    <% }%>
    <script>
        $(".disableCategory").on('click', function () {
            var name = $(this).attr("name");
            $.ajax({
                url: "dashboard",
                type: 'POST',
                data: {
                    service: "changeStatusCategory",
                    id: name,
                    status: "enable"
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

        $(".enableCategory").on('click', function () {
            var name = $(this).attr("name");
            $.ajax({
                url: "dashboard",
                type: 'POST',
                data: {
                    service: "changeStatusCategory",
                    id: name,
                    status: "disable"
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

        $(".editCategory").on('click', function () {
            var newName = prompt("Nhập tên mới cho danh mục");

            if (newName == null || newName == "") {
                return;
            }
            
            var name = $(this).attr("name");
            $.ajax({
                url: "dashboard",
                type: 'POST',
                data: {
                    service: "editCategory",
                    id: name,
                    newName: newName
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
