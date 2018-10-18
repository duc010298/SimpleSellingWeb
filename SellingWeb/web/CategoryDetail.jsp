<%@page import="util.MyUtils"%>
<%@page import="entity.ProductEntity"%>
<%@page import="java.util.ArrayList"%>
<% ArrayList<ProductEntity> productEntities = (ArrayList<ProductEntity>) request.getAttribute("productEntities"); %>
<% String category = (String) request.getAttribute("category");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title><%= category%></title>
    </head>
    <body>
        <jsp:include page="/header" />
        <div class="container">
            <jsp:include page="/category" />
            <h3><i class="fas fa-calendar-alt"></i> <%= category%></h3>
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
        <br>
        <%@include file="footer.jsp" %>
    </body>
    <script>
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
