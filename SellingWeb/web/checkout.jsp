<%-- 
    Document   : checkout.jsp
    Created on : Oct 18, 2018, 11:24:48 AM
    Author     : Đỗ Trung Đức
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.ProductCartEntity"%>
<%@page import="util.MyUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<ProductCartEntity> productCartEntitys = (ArrayList<ProductCartEntity>) request.getAttribute("cartDetail"); %>
<% int totalQuantity = (int) request.getAttribute("totalQuantity"); %>
<% float totalPrice = (float) request.getAttribute("totalPrice"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="images/favicon.ico" rel="icon" type="image/png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Checkout</title>
    </head>
    <body>
        <jsp:include page="/header" />
        <div class="grid-6">
            <div class="jumbotron">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Ảnh</th>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int i = 1; %>
                        <% for (ProductCartEntity cartEntity : productCartEntitys) {%>
                        <tr>
                            <td class="align-middle"><%= i++%></td>
                            <td class="align-middle"><img src="<%= cartEntity.getPricture()%>" class="img-product-3" alt="simple"></td>
                            <td class="align-middle"><%= cartEntity.getName()%></td>
                            <td class="align-middle"><span class="price"><%= MyUtils.priceToString(cartEntity.getPrice())%></span> VNĐ</td>
                            <td class="align-middle"><input name="<%= cartEntity.getId()%>" class="quantityInCart" type="number" value ="<%= cartEntity.getQuantityInCart()%>" class="form-control quantity-input"></td>
                            <td class="align-middle"><span class="totalPrice-1"><%= MyUtils.priceToString(cartEntity.getPrice() * cartEntity.getQuantityInCart())%></span> VNĐ</td>
                            <td class="align-middle"><button type="button" class="btn btn-link"><h2><i class="fas fa-trash-alt"></i></h2></button></td>
                        </tr>
                        <% }%>
                        <tr>
                            <th colspan="6">Thành tiền</th>
                            <th><span id="totalPrice-2"><%= MyUtils.priceToString(totalPrice)%></span> VNĐ</th>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="jumbotron">
                <h2>Thông tin người mua hàng:</h2>
                <div class="form-group">
                    <label for="name">Họ và tên:</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Nhập họ và tên" required>
                </div>
                <div class="form-group">
                    <label for="address">Địa chị:</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="Nhập địa chỉ" required>
                </div>
                <div class="form-group">
                    <label for="phone">Số điện thoại:</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="Nhập số điện thoại" required>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
    <script>
        $(".quantityInCart").change(function () {
            //ajax here
            
            var parent = $(this).parents("tr");
            var price = parent.find(".price").html();
            price = price.replace(/\./g, "");
            var quantity = parent.find(".quantityInCart").val();
            var totalPrice1 = parent.find(".totalPrice-1").html();
            totalPrice1 = totalPrice1.replace(/\./g, "");
            var totalPrice2 = $("#totalPrice-2").html();
            totalPrice2 = totalPrice2.replace(/\./g, "");
            parent.find(".totalPrice-1").html(totalPrice1 * quantity);
            
            totalPrice2 = Number(totalPrice2) + totalPrice1 * quantity;
            $("#totalPrice-2").html(totalPrice2);
        });
    </script>
</html>
