<%-- 
    Document   : home
    Created on : Oct 18, 2018, 10:02:00 AM
    Author     : Đỗ Trung Đức
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.ProductEntity"%>
<%@page import="util.MyUtils"%>
<% ArrayList<ProductEntity> productEntities = (ArrayList<ProductEntity>) request.getAttribute("productEntities"); %>
<% String status = (String) request.getAttribute("status"); %>
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
        <title>Trang chủ</title>
    </head>
    <body>
        <jsp:include page="/header" />
        <div class="container">
            <jsp:include page="/category" />
            <h3><i class="fas fa-calendar-alt"></i> Sản phẩm mới cập nhật</h3>
            <div class="grid-2">
                <% for (ProductEntity entity : productEntities) {%>
                <div class="product-box" id="<%= entity.getId()%>">
                    <div>
                        <a href="ProductDetail?id=<%= entity.getId()%>">
                            <img src="<%= entity.getPricture()%>" class="img-product" alt="simple">
                            <h6 class="product-name"><%= entity.getName()%></h6>
                        </a>
                        <p class="product-price"><%= MyUtils.priceToString(entity.getPrice())%> VNĐ</p>
                        <% if (entity.getQuantity() != 0) {%>
                        <p class="product-status-active"><i class="fas fa-shopping-bag"></i> Còn hàng</p>
                        <% } else { %>
                        <p class="product-status-deactive"><i class="fas fa-shopping-bag"></i> Liên hệ</p>
                        <% } %>
                        <button type="button" class="btn btn-primary btn-add-cart"><i class="fas fa-cart-plus"></i> Cho vào giỏ</button>
                    </div>
                </div>
                <% }%>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
    <script>
        $(".btn-add-cart").on('click', function () {
            var parent = $(this).parents(".product-box");
            var id = parent.attr("id");
            var isDuplicate = $("#cart-detail #" + id).length != 0;

            if (!isDuplicate) {
                var img = parent.find(".img-product").attr("src");
                var name = parent.find(".product-name").html();
                var price = parent.find(".product-price").html();
                price = price.substring(0, price.length - 3);
                price = price.replace(/\./g, "");

                var quantityCart = $("#cart-count-1").html();
                quantityCart++;
                $("#cart-count-1").html(quantityCart);
                $("#cart-count-2").html(quantityCart);

                var totalPrice = $("#cart-total-price").html();
                totalPrice = totalPrice.replace(/\./g, "");
                totalPrice = Number(totalPrice) + Number(price);
                $("#cart-total-price").html(totalPrice);
                var oldContent = $("#cart-detail").html();
                oldContent += '<img src="' + img + '" class="img-product" alt="simple">';
                oldContent += '<div id="' + id + '"><p>' + name + '</p><span class="price text-info"> ' + Number(price) + '</span>  Quantity: <span class="count">1</span</div>';


                $("#cart-detail").html(oldContent);
            } else {
                var countObj = $("#cart-detail #" + id + " .count");
                var count = countObj.html();
                count++;
                countObj.html(count);
            }
            /////ajax here
            $.ajax({
                url: "Cart",
                type: 'POST',
                dataType: 'html',
                data: {
                    service: "addcart",
                    id: id
                },
                error: function () {
                    notify("Lỗi", "Không thể xử lí dữ liệu");
                }
            }).done(function (result) {
                notify("Thông báo", result);
            });

        });
    </script>
    <% if (status != null) {%>
    <script>
        notify("Thông báo", "<%= status%>");
        $(".btn-danger, .close").on('click', function () {
            window.location.href = window.location.origin + window.location.pathname;
        });
    </script>
    <% }%>
</html>
