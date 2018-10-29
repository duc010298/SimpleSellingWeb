<%-- 
    Document   : AddProduct
    Created on : Oct 23, 2018, 9:12:54 AM
    Author     : Đỗ Trung Đức
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="entity.ProductEntity"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="entity.CategoryEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.AdminEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% AdminEntity adminEntity = (AdminEntity) request.getAttribute("admin");%>
<% HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = (HashMap<CategoryEntity, ArrayList<CategoryEntity>>) request.getAttribute("category");%>
<% ProductEntity productEntity = (ProductEntity) request.getAttribute("productEntity"); %>
<% ArrayList<Integer> categoryIdList = (ArrayList<Integer>) request.getAttribute("categoryIdList");%>
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

        <div class="container">
            <div class="jumbotron">
                <h1>Sửa đổi thông tin sản phẩm</h1>
                <form onsubmit="return submitfunction()">
                    <input type="text" hidden="" value="add" name="service">
                    <div class="form-group">
                        <label for="name">Tên sản phẩm:</label>
                        <input type="text" class="form-control" id="name" name="name" required value="<%= productEntity.getName()%>">
                    </div>
                    <div class="form-group">
                        <label for="quantity">Số lượng sản phẩm:</label>
                        <input type="number" min="0" class="form-control" id="quantity" name="quantity" required value="<%= productEntity.getQuantity()%>">
                    </div>
                    <div class="form-group">
                        <label for="price">Giá tiền sản phẩm:</label>
                        <input type="text" class="form-control" id="price" name="price" required value="<%= new BigDecimal(productEntity.getPrice()).stripTrailingZeros().toPlainString()%>">
                    </div>
                    <div class="form-group">
                        <label for="picture">Đường dẫn ảnh của sản phẩm:</label>
                        <input type="text" class="form-control" id="picture" name="picture" required value="<%= productEntity.getPricture()%>">
                    </div>
                    <div class="form-group">
                        <label for="description">Miêu tả sản phẩm:</label>
                        <textarea  type="text" class="form-control" rows="7" id="description" name="description" required><%= productEntity.getDescription()%></textarea>
                    </div>
                    <div class="form-group">
                        <label for="status">Trạng thái:</label>
                        <select class="form-control" id="status">
                            <% if (productEntity.getStatus() == 1) { %>
                            <option value="1" selected>Active</option>
                            <option value="0">Deactive</option>
                            <% } else {%>
                            <option value="1">Active</option>
                            <option value="0" selected>Deactive</option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="category">Chọn danh mục cho sản phẩm:</label>
                        <% for (Map.Entry m : hashMap.entrySet()) { %>
                        <% CategoryEntity categoryEntity = (CategoryEntity) m.getKey();%>
                        <hr>
                        <h5><%= categoryEntity.getName()%></h5>
                        <% ArrayList<CategoryEntity> categoryEntitys = (ArrayList<CategoryEntity>) m.getValue(); %>
                        <% for (CategoryEntity c : categoryEntitys) {%>
                        <div class="form-check-inline">
                            <label class="form-check-label">
                                <% if (categoryIdList.contains(c.getId())) {%>
                                <input type="checkbox" class="form-check-input" value="<%= c.getId()%>" checked><%= c.getName()%>
                                <% } else {%>
                                <input type="checkbox" class="form-check-input" value="<%= c.getId()%>"><%= c.getName()%>
                                <% } %>
                            </label>
                        </div>
                        <% } %>
                        <% }%>
                    </div>
                    <button type="submit" class="btn btn-primary">Sửa thông tin sản phẩm</button>
                </form>
            </div>
        </div>

        <footer class="page-footer font-small blue">
            <div class="footer-copyright text-center py-3">© 2018 Copyright:
                <a href="#"> SimpleWeb.com</a>
            </div>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script>
                    function notify(title, message) {
                        $("#notifyModal .modal-title").html(title);
                        $("#notifyModal .modal-body").html(message);
                        $("#notifyModal").modal({backdrop: "static"});
                    }

                    function submitfunction() {
                        var url = new URL(window.location.href);
                        var id = url.searchParams.get("id");

                        var name = $("#name").val();
                        var quantity = $("#quantity").val();
                        var price = $("#price").val();
                        var picture = $("#picture").val();
                        var description = $("#description").val();
                        var status = $("#status").val();

                        var categoryArray = new Array();
                        var checkbox = $(":checkbox");

                        $.each(checkbox, function (index, value) {
                            if (value.checked) {
                                categoryArray.push(value.value);
                            }
                        });
                        var category = JSON.stringify(categoryArray);

                        $.ajax({
                            url: "dashboard",
                            type: 'POST',
                            dataType: 'html',
                            data: {
                                service: "editProduct",
                                id: id,
                                name: name,
                                quantity: quantity,
                                price: price,
                                picture: picture,
                                description: description,
                                status: status,
                                category: category
                            }
                        }).done(function (result) {
                            notify("Thông báo", result);
                        });


                        return false;
                    }
        </script>
    </body>
</html>
