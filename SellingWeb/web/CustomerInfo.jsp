<%-- 
    Document   : CustomerInfo
    Created on : Oct 30, 2018, 11:38:28 AM
    Author     : Đỗ Trung Đức
--%>

<%@page import="util.MyUtils"%>
<%@page import="entity.InvoiceEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.CustomerEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% CustomerEntity customerEntity = (CustomerEntity) request.getAttribute("customerEntity");%>
<% ArrayList<InvoiceEntity> invoiceEntitys = (ArrayList<InvoiceEntity>) request.getAttribute("invoiceEntitys");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="images/favicon.ico" rel="icon" type="image/png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Thông tin tài khoản</title>
    </head>
    <body>
        <div class="modal fade" id="confirmPass">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Xác thực tài khoản</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="passwordConfirm">Nhập mật khẩu:</label>
                            <input type="password" class="form-control" id="passwordConfirm" placeholder="Nhập mật khẩu">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="btnConfirm" type="button" class="btn-modal btn btn-primary" data-dismiss="modal">Chấp nhận</button>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/header" />
        <div class="grid-7">
            <div class="jumbotron">
                <h3>Thông tin tài khoản: <%= customerEntity.getUsername()%></h3>
                <hr>
                <form action="" onsubmit="return updateInfo()">
                    <input type="text" id="customerId" value="<%= customerEntity.getId()%>" hidden>
                    <div class="form-group">
                        <label for="name">Họ và tên:</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Nhập họ và tên" value="<%= customerEntity.getName()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Địa chỉ:</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="Nhập địa chỉ" value="<%= customerEntity.getAddress()%>" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại:</label>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Nhập số điện thoại" value="<%= customerEntity.getPhone()%>" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Cập nhật thông tin</button>
                </form>
            </div>
            <div class="jumbotron">
                <h3>Đổi mật khẩu</h3>
                <hr>
                <form action="" onsubmit="return changePass()">
                    <div class="form-group">
                        <label for="oldPass">Mật khẩu cũ:</label>
                        <input type="password" class="form-control" id="oldPass" name="oldPass" placeholder="Nhập mật khẩu cũ" required>
                    </div>
                    <div class="form-group">
                        <label for="newPass">Mật khẩu mới:</label>
                        <input type="password" class="form-control" id="newPass" name="newPass" placeholder="Nhập mật khẩu mới" required>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Nhập lại mật khẩu:</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
                </form>
            </div>
        </div>
        <div class="jumbotron">
            <h3>Danh sách đơn hàng</h3>
            <hr>
            <table class="table table-bordered table-custom table-hover">
                <thead>
                    <tr>
                        <th>Ngày tạo</th>
                        <th>Tên người nhận</th>
                        <th>Địa chỉ giao hàng</th>
                        <th>Số điện thoại người nhận</th>
                        <th>Tổng số tiền</th>
                        <th>Trạng thái đơn hàng</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (InvoiceEntity entity : invoiceEntitys) {%>
                    <tr name="<%= entity.getId()%>">
                        <td><%= entity.getDate()%></td>
                        <td><%= entity.getName()%></td>
                        <td><%= entity.getAddress()%></td>
                        <td><%= entity.getPhone()%></td>
                        <td><%= MyUtils.priceToString(entity.getTotal())%> VNĐ</td>
                        <% if (entity.getStatus() == 1) { %>
                        <td>Chưa liên hệ</td>
                        <% } else if (entity.getStatus() == 2) { %>
                        <td>Đang giao hàng</td>
                        <% } else if (entity.getStatus() == 3) { %>
                        <td>Đã thanh toán</td>
                        <% } else if (entity.getStatus() == 0) { %>
                        <td>Đã hủy bỏ</td>
                        <% } %>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
        <%@include file="footer.jsp" %>
    </body>
    <script>
        function updateInfo() {
            $("#confirmPass").modal({backdrop: "static"});
            $("#btnConfirm").on('click', function () {
                var password = $("#passwordConfirm").val();
                $("#passwordConfirm").val("");

                if (password == "") {
                    notify("Lỗi", "Chưa nhập mật khẩu");
                    return;
                }

                var id = $("#customerId").val();
                var name = $("#name").val();
                var address = $("#address").val();
                var phone = $("#phone").val();

                //ajax here
                $.ajax({
                    url: "customer",
                    type: 'POST',
                    dataType: 'html',
                    data: {
                        service: "editInfoCustomer",
                        id: id,
                        name: name,
                        address: address,
                        phone: phone,
                        password: password
                    }
                }).done(function (result) {
                    notify("Thông báo", result);
                });
            });
            return false;
        }

        function changePass() {
            var id = $("#customerId").val();
            var oldPass = $("#oldPass").val();
            var newPass = $("#newPass").val();
            var confirmPassword = $("#confirmPassword").val();
            if (newPass != confirmPassword) {
                notify("Lỗi", "Mật khẩu không đúng");
                return;
            }

            $.ajax({
                url: "customer",
                type: 'POST',
                dataType: 'html',
                data: {
                    service: "changePassword",
                    id: id,
                    oldPass: oldPass,
                    newPass: newPass
                }
            }).done(function (result) {
                notify("Thông báo", result);
            });
            return false;
        }

        $("tbody>tr").on('click', function () {
            var invoiceId = $(this).attr("name");
            window.location.href = "customer?service=invoiceDetail&id=" + invoiceId;
        });
    </script>
</html>
