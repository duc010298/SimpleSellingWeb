<%-- 
    Document   : home
    Created on : Oct 10, 2018, 9:30:28 AM
    Author     : Đỗ Trung Đức
--%>
<%@page import="entity.CustomerEntity"%>
<%@page import="util.MyUtils"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="entity.ProductEntity"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="entity.CategoryEntity"%>
<%@page import="entity.CategoryEntity"%>
<%@page import="java.util.ArrayList"%>
<% HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = (HashMap<CategoryEntity, ArrayList<CategoryEntity>>) request.getAttribute("categoryMap"); %>
<% ArrayList<ProductEntity> productEntities = (ArrayList<ProductEntity>) request.getAttribute("productEntities"); %>
<% CustomerEntity customerEntity = (CustomerEntity) request.getAttribute("customer"); %>
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
            <a class="navbar-brand" href="#">SE1215 Shopping</a>
            <div class="navbar-collapse collapse">
                <ul class="navbar-nav mr-auto">
                    <form class="form-inline" action="/action_page.php">
                        <input class="form-control mr-sm-2" type="text" placeholder="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </ul>
                <ul class="navbar-nav">
                    <% if (customerEntity == null) { %>
                    <li><a class="nav-link" href="login"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a></li> 
                        <% } else { %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            <i class="fas fa-user-circle"></i> <%= customerEntity.getName() %>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#"><i class="fas fa-user"></i> Thông tin tài khoản</a>
                            <a class="dropdown-item" href="login?logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
                        </div>
                    </li>
                    <% } %>
                    <li><a class="nav-link" href="#"><i class="fas fa-shopping-cart"></i> Giỏ hàng</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="jumbotron jumbotron-cate">
                <div class="grid">
                    <div class="btn-group-vertical group-cate" id="catalog">
                        <% for (Map.Entry m : hashMap.entrySet()) { %>

                        <div class="btn-group dropright">
                            <button type="button" class="btn btn-dark btn-lg btn-cate dropdown-toggle" data-toggle="dropdown">
                                <% CategoryEntity categoryEntity = (CategoryEntity) m.getKey();%>
                                <%= categoryEntity.getName()%>
                            </button>
                            <div class="dropdown-menu">
                                <% ArrayList<CategoryEntity> categoryEntitys = (ArrayList<CategoryEntity>) m.getValue(); %>
                                <% for (CategoryEntity c : categoryEntitys) {%>
                                <a class="dropdown-item" href="#"><%= c.getName()%></a>
                                <% } %>
                            </div>
                        </div>
                        <% }%>
                    </div>
                    <div>
                        <img src="https://robohash.org/iustoasperioresautem.jpg?size=1062x628&set=set1" class="rounded img-logo1" alt="simple">
                    </div>
                </div>
            </div>
            <h3><i class="fas fa-calendar-alt"></i> Sản phẩm mới cập nhật</h3>
            <div class="grid-2">
                <% for (ProductEntity entity : productEntities) {%>
                <div class="product-box">
                    <div>
                        <img src="<%= entity.getPricture()%>" class="img-product" alt="simple">
                        <h6 class="product-name"><%= entity.getName()%></h6>
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
        <footer class="page-footer font-small blue">
            <div class="footer-copyright text-center py-3">© 2018 Copyright:
                <a href="#"> SimpleWeb.com</a>
            </div>
        </footer>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script>
        function autoHeightLogo() {
            var total_catalog_item = $("#catalog>div").length;
            var height = 48 * total_catalog_item;
            $(".img-logo1").height(height);
        }

        autoHeightLogo();
    </script>

</html>
