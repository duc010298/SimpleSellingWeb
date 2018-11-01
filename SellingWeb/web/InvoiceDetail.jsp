<%-- 
    Document   : InvoiceDetail
    Created on : Oct 31, 2018, 9:58:19 AM
    Author     : Đỗ Trung Đức
--%>

<%@page import="util.MyUtils"%>
<%@page import="entity.ProductEntity"%>
<%@page import="entity.InvoiceDetailEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.CustomerEntity"%>
<%@page import="entity.InvoiceEntity"%>
<%@page import="entity.AdminEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% AdminEntity adminEntity = (AdminEntity) request.getAttribute("admin");%>
<% InvoiceEntity invoiceEntity = (InvoiceEntity) request.getAttribute("invoiceEntity"); %>
<% CustomerEntity customerEntity = (CustomerEntity) request.getAttribute("customerEntity"); %>
<% ArrayList<InvoiceDetailEntity> invoiceDetailEntitys = (ArrayList<InvoiceDetailEntity>) request.getAttribute("invoiceDetailEntitys"); %>
<% ArrayList<ProductEntity> productEntitys = (ArrayList<ProductEntity>) request.getAttribute("productEntitys");%>
<% boolean canAccept = true;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="images/favicon.ico" rel="icon" type="image/png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Chi tiết hóa đơn</title>
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

        <div class="grid-8">
            <div class="jumbotron">
                <!--invoice info-->
                <h1>Thông tin đơn hàng</h1>
                <hr>
                <p>Ngày đặt hàng: <b><%= invoiceEntity.getDate()%></b></p>
                <p>Tên người nhận hàng: <b><%= invoiceEntity.getName()%></b></p>
                <p>Địa chỉ giao hàng: <b><%= invoiceEntity.getAddress()%></b></p>
                <p>Số điện thoại người nhận hàng: <b><%= invoiceEntity.getPhone()%></b></p>
                <p>Tổng số tiền đơn hàng: <b><%= MyUtils.priceToString(invoiceEntity.getTotal())%> VNĐ</b></p>
                <hr>
                <p>Trạng thái</p>
                <div class="form-inline">
                    <% if (invoiceEntity.getStatus() == 1) { %>
                    <select class="form-control mr-sm-2" id="status">
                        <option selected value="1">Chưa liên hệ</option>
                        <option value="2">Đang giao hàng</option>
                        <option value="3">Đã thanh toán</option>
                        <option value="0">Đã hủy bỏ</option>
                    </select>
                    <button class="btn btn-success" id="changeStatus">Đổi trạng thái</button>
                    <% } else if (invoiceEntity.getStatus() == 2) { %>
                    <select class="form-control mr-sm-2" id="status">
                        <option value="1">Chưa liên hệ</option>
                        <option selected value="2">Đang giao hàng</option>
                        <option value="3">Đã thanh toán</option>
                        <option value="0">Đã hủy bỏ</option>
                    </select>
                    <button class="btn btn-success" id="changeStatus">Đổi trạng thái</button>
                    <% } else if (invoiceEntity.getStatus() == 3) { %>
                    <b>Đã thanh toán</b>
                    <% } else if (invoiceEntity.getStatus() == 0) { %>
                    <b>Đã hủy bỏ</b>
                    <% }%>
                </div>
            </div>
            <div class="jumbotron">
                <!--account info-->
                <h1>Thông tin tài khoản đặt hàng</h1>
                <hr>
                <p>Tài khoản: <b><%= customerEntity.getUsername()%></b></p>
                <p>Họ và tên: <b><%= customerEntity.getName()%></b></p>
                <p>Địa chỉ: <b><%= customerEntity.getAddress()%></b></p>
                <p>Số điện thoại: <b><%= customerEntity.getPhone()%></b></p>
            </div>
        </div>
        <div class="jumbotron">
            <!--invoice detail info-->
            <h1>Chi tiết đơn hàng</h1>
            <hr>
            <table class="table table-bordered table-custom">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Số còn trong kho</th>
                        <th>Tổng tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (InvoiceDetailEntity detailEntity : invoiceDetailEntitys) { %>
                    <% ProductEntity productEntity = null; %>
                    <% for (ProductEntity entity : productEntitys) { %>
                    <% if (entity.getId().equals(detailEntity.getProductId())) { %>
                    <% productEntity = entity; %>
                    <% }%>
                    <% }%>
                    <tr>
                        <td><%= detailEntity.getProductId()%></td>
                        <td><img src="<%= productEntity.getPricture()%>" style="width: 90px"></td>
                        <td><%= productEntity.getName()%></td>
                        <td><%= MyUtils.priceToString(detailEntity.getPrice())%> VNĐ</td>
                        <td><%= detailEntity.getQuantity()%></td>
                        <td><%= productEntity.getQuantity()%></td>
                        <td><%= MyUtils.priceToString(detailEntity.getPrice() * detailEntity.getQuantity())%> VNĐ</td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script>
        function notify(title, message) {
            $("#notifyModal .modal-title").html(title);
            $("#notifyModal .modal-body").html(message);
            $("#notifyModal").modal({backdrop: "static"});
        }

        $("#changeStatus").on('click', function () {
            var status = $("#status").val();
            //validate quantity
        <% if (canAccept) { %>
                if(status == 1 || status == 2) {
                    notify("Lỗi", "Bạn không thể đổi trạng thái, số lượng hàng trong kho không đủ");
                    return;
                }
        <% }%>

            var url = new URL(window.location.href);
            var id = url.searchParams.get("id");
            $.ajax({
                url: "dashboard",
                type: 'POST',
                data: {
                    service: "updateStatusInvoice",
                    id: id,
                    status: status
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
