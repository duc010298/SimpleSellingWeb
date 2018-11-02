<%-- 
    Document   : InvoiceDetailOnCustomer
    Created on : Nov 2, 2018, 10:03:24 AM
    Author     : Đỗ Trung Đức
--%>

<%@page import="entity.ProductEntity"%>
<%@page import="entity.InvoiceDetailEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.InvoiceEntity"%>
<%@page import="util.MyUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% InvoiceEntity invoiceEntity = (InvoiceEntity) request.getAttribute("invoiceEntity");%>
<% ArrayList<InvoiceDetailEntity> invoiceDetailEntitys = (ArrayList<InvoiceDetailEntity>) request.getAttribute("invoiceDetailEntitys"); %>
<% ArrayList<ProductEntity> productEntitys = (ArrayList<ProductEntity>) request.getAttribute("productEntitys");%>
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
        <jsp:include page="/header" />
        <div class="grid-9">
            <div class="jumbotron">
                <h1>Thông tin đơn hàng</h1>
                <hr>
                <p>Ngày đặt hàng: <b><%= invoiceEntity.getDate()%></b></p>
                <p>Tên người nhận hàng: <b><%= invoiceEntity.getName()%></b></p>
                <p>Địa chỉ giao hàng: <b><%= invoiceEntity.getAddress()%></b></p>
                <p>Số điện thoại người nhận hàng: <b><%= invoiceEntity.getPhone()%></b></p>
                <p>Tổng số tiền đơn hàng: <b><%= MyUtils.priceToString(invoiceEntity.getTotal())%> VNĐ</b></p>
                <% if (invoiceEntity.getStatus() == 1) { %>
                <p>Trạng thái: <b>Chưa liên hệ</b></p>
                <% } else if (invoiceEntity.getStatus() == 2) { %>
                <p>Trạng thái: <b>Đang giao hàng</b></p>
                <% } else if (invoiceEntity.getStatus() == 3) { %>
                <p>Trạng thái: <b>Đã thanh toán</b></p>
                <% } else if (invoiceEntity.getStatus() == 0) { %>
                <p>Trạng thái: <b>Đã hủy bỏ</b></p>
                <% }%>
            </div>
            <div class="jumbotron">
                <h1>Chi tiết đơn hàng</h1>
                <hr>
                <table class="table table-bordered table-custom">
                <thead>
                    <tr>
                        <th>Ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
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
                        <td><img src="<%= productEntity.getPricture()%>" style="width: 90px"></td>
                        <td><%= productEntity.getName()%></td>
                        <td><%= MyUtils.priceToString(detailEntity.getPrice())%> VNĐ</td>
                        <td><%= detailEntity.getQuantity()%></td>
                        <td><%= MyUtils.priceToString(detailEntity.getPrice() * detailEntity.getQuantity())%> VNĐ</td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            </div>
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
    </script>
</html>
