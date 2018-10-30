<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="entity.CategoryEntity"%>
<%@page import="entity.CategoryEntity"%>
<%@page import="java.util.ArrayList"%>
<% HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = (HashMap<CategoryEntity, ArrayList<CategoryEntity>>) request.getAttribute("categoryMap"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <a class="dropdown-item" href="categoryDetail?categoryId=<%= c.getId()%>"><%= c.getName()%></a>
                    <% } %>
                </div>
            </div>
            <% }%>
        </div>
        <div>
            <img src="https://www.tncstore.vn/image/cache/catalog/11112/NVidia_2080_756x302-756x302.jpg" class="rounded img-logo1" id="img-logo1" alt="simple">
        </div>
    </div>
</div>
<script>
    var total_catalog_item = document.querySelectorAll("#catalog>div").length;
    var height = 48 * total_catalog_item;
    document.getElementById("img-logo1").style.height = height + "px";
</script>