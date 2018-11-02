<%-- 
    Document   : ProductDetail
    Created on : Oct 18, 2018, 11:17:10 AM
    Author     : Đỗ Trung Đức
--%>

<%@page import="util.MyUtils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.ProductEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ProductEntity productEntity = (ProductEntity) request.getAttribute("entity");%>
<% ArrayList<ProductEntity> productEntities = (ArrayList<ProductEntity>) request.getAttribute("productEntities");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="images/favicon.ico" rel="icon" type="image/png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title><%= productEntity.getName()%></title>
    </head>
    <body>
        <jsp:include page="/header" />
        <br>
        <h2>Chi tiết sản phẩm</h2>
        <div class="grid-3">
            <div class="product-box-detail">
                <img src="<%= productEntity.getPricture()%>" id="img-product-detail" class="img-product" alt="simple">
            </div>
            <div class="product-box-detail">
                <div>
                    <h2 id="product-name-detail"><%= productEntity.getName()%></h2>
                    <p class="product-price-2" id="product-detail-price"><%= MyUtils.priceToString(productEntity.getPrice())%> VNĐ</p>
                    <br>
                    <pre class="description"><%= productEntity.getDescription()%></pre>
                    <br>
                    <% if (productEntity.getQuantity() != 0) {%>
                    <p class="product-status-active"><i class="fas fa-shopping-bag"></i> Còn hàng</p>
                    <button type="button" class="btn btn-primary btn-add-cart-2" id="<%= productEntity.getId()%>"><i class="fas fa-cart-plus"></i> Cho vào giỏ</button>
                    <% } else { %>
                    <p class="product-status-deactive"><i class="fas fa-shopping-bag"></i> Liên hệ</p>
                    <button type="button" class="btn btn-add-cart" disabled><i class="fas fa-cart-plus"></i> Cho vào giỏ</button>
                    <% }%>
                </div>
            </div>
        </div>
        <br>
        <div class="container">
            <!--Sản phẩm liên quan-->
            <h3><i class="fas fa-calendar-alt"></i> Sản phẩm nổi trội</h3>
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
                        <button type="button" class="btn btn-primary btn-add-cart"><i class="fas fa-cart-plus"></i> Cho vào giỏ</button>
                        <% } else { %>
                        <p class="product-status-deactive"><i class="fas fa-shopping-bag"></i> Liên hệ</p>
                        <button type="button" class="btn btn-add-cart" disabled><i class="fas fa-cart-plus"></i> Cho vào giỏ</button>
                        <% } %>
                    </div>
                </div>
                <% }%>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
    <script>
        $(".btn-add-cart-2").on('click', function () {
            var id = $(this).attr("id");
            var isSuccess = true;
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
                    isSuccess = false;
                }
            }).done(function (result) {
                notify("Thông báo", result);
            });

            if (!isSuccess)
                return;

            var isDuplicate = $("#cart-detail #" + id).length != 0;

            if (!isDuplicate) {
                var img = $("#img-product-detail").attr("src");
                var name = $("#product-name-detail").html();
                var price = $("#product-detail-price").html();
                price = price.substring(0, price.length - 3);
                price = price.replace(/\./g, "");

                var quantityCart = $("#cart-count-1").html();
                quantityCart++;
                $("#cart-count-1").html(quantityCart);
                $("#cart-count-2").html(quantityCart);

                var totalPrice = $("#cart-total-price").html();
                totalPrice = totalPrice.replace(/\./g, "");
                totalPrice = Number(totalPrice) + Number(price);
                totalPrice = "" + totalPrice;
                var count = 0;
                for (var i = totalPrice.length - 1; i >= 0; i--) {
                    if (i == 0)
                        break;
                    count++;
                    if (count == 3) {
                        count = 0;
                        totalPrice = totalPrice.substring(0, i) + '.' + totalPrice.substring(i, totalPrice.length);
                    }
                }
                $("#cart-total-price").html(totalPrice);
                price = "" + price;
                price = price.trim();
                var count = 0;
                for (var i = price.length - 1; i >= 0; i--) {
                    if (i == 0)
                        break;
                    count++;
                    if (count == 3) {
                        count = 0;
                        price = price.substring(0, i) + '.' + price.substring(i, price.length);
                    }
                }
                var oldContent = $("#cart-detail").html();
                oldContent += '<img src="' + img + '" class="img-product" alt="simple">';
                oldContent += '<div id="' + id + '"><p>' + name + '</p><span class="price text-info"> ' + price + '</span>  Quantity: <span class="count">1</span</div>';


                $("#cart-detail").html(oldContent);
            } else {
                var countObj = $("#cart-detail #" + id + " .count");
                var count = countObj.html();
                count++;
                countObj.html(count);
            }

        });

        $(".btn-add-cart").on('click', function () {
            var parent = $(this).parents(".product-box");
            var id = parent.attr("id");
            var isSuccess = true;
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
                    isSuccess = false;
                }
            }).done(function (result) {
                notify("Thông báo", result);
            });

            if (!isSuccess)
                return;

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
                totalPrice = "" + totalPrice;
                var count = 0;
                for (var i = totalPrice.length - 1; i >= 0; i--) {
                    if (i == 0)
                        break;
                    count++;
                    if (count == 3) {
                        count = 0;
                        totalPrice = totalPrice.substring(0, i) + '.' + totalPrice.substring(i, totalPrice.length);
                    }
                }
                $("#cart-total-price").html(totalPrice);
                price = "" + price;
                price = price.trim();
                var count = 0;
                for (var i = price.length - 1; i >= 0; i--) {
                    if (i == 0)
                        break;
                    count++;
                    if (count == 3) {
                        count = 0;
                        price = price.substring(0, i) + '.' + price.substring(i, price.length);
                    }
                }
                var oldContent = $("#cart-detail").html();
                oldContent += '<img src="' + img + '" class="img-product" alt="simple">';
                oldContent += '<div id="' + id + '"><p>' + name + '</p><span class="price text-info"> ' + price + '</span>  Quantity: <span class="count">1</span</div>';


                $("#cart-detail").html(oldContent);
            } else {
                var countObj = $("#cart-detail #" + id + " .count");
                var count = countObj.html();
                count++;
                countObj.html(count);
            }

        });
    </script>
</html>
