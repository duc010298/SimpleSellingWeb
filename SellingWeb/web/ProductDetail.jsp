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
        <div class="container">
            <br>
            <h2>Chi tiết sản phẩm</h2>
            <div class="grid-3">
                <div class="product-box-detail">
                    <img src="<%= productEntity.getPricture()%>" class="img-product" alt="simple">
                </div>
                <div class="product-box-detail">
                    <div>
                        <h2><%= productEntity.getName()%></h2>
                        <p class="product-price-2"><%= MyUtils.priceToString(productEntity.getPrice())%> VNĐ</p>
                        <br>
                        <p class="description"><%= productEntity.getDescription()%></p>
                        <br>
                        <button type="button" class="btn btn-primary btn-add-cart"><i class="fas fa-cart-plus"></i> Cho vào giỏ</button>
                    </div>
                </div>
            </div>
            <br>
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
</html>
