/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AdminDao;
import dao.CategoryDao;
import dao.CustomerDao;
import dao.InvoiceDao;
import dao.InvoiceDetailDao;
import dao.ProductDao;
import entity.AdminEntity;
import entity.CategoryEntity;
import entity.CustomerEntity;
import entity.InvoiceDetailEntity;
import entity.InvoiceEntity;
import entity.ProductEntity;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONValue;

/**
 *
 * @author Đỗ Trung Đức
 */
@WebServlet(name = "DashBoardController", urlPatterns = {"/dashboard"})
public class DashBoardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        HttpSession session = request.getSession();
        AdminEntity adminEntity = (AdminEntity) session.getAttribute("admin");

        if (adminEntity != null) {
            request.setAttribute("admin", adminEntity);
        } else {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                String username = null;
                String password = null;
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username")) {
                        username = cookie.getValue();
                    }
                    if (cookie.getName().equals("password")) {
                        password = cookie.getValue();
                    }
                }
                adminEntity = new AdminDao().loginFromRemeberMe(username, password);
                if (adminEntity != null) {
                    session.setAttribute("admin", adminEntity);
                    request.setAttribute("admin", adminEntity);
                }
            }
        }

        if (adminEntity != null) {
            String service = request.getParameter("service");
            service = service == null ? "ProductManger" : service;

            switch (service) {
                case "ProductManger": {
                    String subservice = request.getParameter("subservice");
                    if (subservice != null) {
                        if (subservice.equals("add")) {
                            HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = new CategoryDao().getCategoryList();
                            request.setAttribute("category", hashMap);
                            RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/AddProduct.jsp");
                            dispatch.forward(request, response);
                            return;
                        } else if (subservice.equals("edit")) {
                            String id = request.getParameter("id");
                            ArrayList<Integer> categoryIdList = new CategoryDao().getCategoryIdListFromProductId(id);
                            request.setAttribute("categoryIdList", categoryIdList);
                            HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = new CategoryDao().getCategoryList();
                            request.setAttribute("category", hashMap);
                            ProductEntity productEntity = new ProductDao().getProductByIdForEdit(id);
                            request.setAttribute("productEntity", productEntity);
                            RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/EditProduct.jsp");
                            dispatch.forward(request, response);
                            return;
                        } else if (subservice.equals("search")) {
                            String content = request.getParameter("content");
                            String page = request.getParameter("page");
                            String status = request.getParameter("status");
                            int pageInt;
                            try {
                                pageInt = Integer.parseInt(page);
                            } catch (NumberFormatException ex) {
                                pageInt = 1;
                            }
                            request.setAttribute("page", pageInt);
                            ArrayList<ProductEntity> productEntitys = new ProductDao().getProductByPageAndSearch(pageInt, content, status);
                            request.setAttribute("productEntitys", productEntitys);
                            
                            request.setAttribute("content", content);
                            request.setAttribute("status", status);
                            RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/ProductManager.jsp");
                            dispatch.forward(request, response);
                            return;
                        }
                    }

                    String page = request.getParameter("page");
                    int pageInt;
                    try {
                        pageInt = Integer.parseInt(page);
                    } catch (NumberFormatException ex) {
                        pageInt = 1;
                    }
                    request.setAttribute("page", pageInt);
                    ArrayList<ProductEntity> productEntitys = new ProductDao().getProductByPage(pageInt);
                    request.setAttribute("productEntitys", productEntitys);
                    RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/ProductManager.jsp");
                    dispatch.forward(request, response);
                    break;
                }
                case "CategoryManager": {
                    HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = new CategoryDao().getCategoryListForManager();
                    request.setAttribute("category", hashMap);
                    RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/CategoryManager.jsp");
                    dispatch.forward(request, response);
                    return;
                }
                case "CustomerManager": {
                    RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/CustomerManager.jsp");
                    dispatch.forward(request, response);
                    break;
                }
                case "InvoiceManger": {
                    String subservice = request.getParameter("subservice");
                    if (subservice != null) {
                        if (subservice.equals("InvoiceDetail")) {
                            String id = request.getParameter("id");
                            InvoiceEntity invoiceEntity = new InvoiceDao().getInvoiceById(id);
                            CustomerEntity customerEntity = new CustomerDao().getInfoFromId(invoiceEntity.getCustomerId());
                            ArrayList<InvoiceDetailEntity> invoiceDetailEntitys = new InvoiceDetailDao().getDetailById(id);
                            ArrayList<ProductEntity> productEntitys = new ArrayList<>();
                            for (InvoiceDetailEntity detailEntity : invoiceDetailEntitys) {
                                ProductEntity entity = new ProductDao().getProductById(detailEntity.getProductId());
                                productEntitys.add(entity);
                            }

                            request.setAttribute("invoiceEntity", invoiceEntity);
                            request.setAttribute("customerEntity", customerEntity);
                            request.setAttribute("invoiceDetailEntitys", invoiceDetailEntitys);
                            request.setAttribute("productEntitys", productEntitys);
                            RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/InvoiceDetail.jsp");
                            dispatch.forward(request, response);
                        }
                        return;
                    }
                    String page = request.getParameter("page");
                    int pageInt;
                    try {
                        pageInt = Integer.parseInt(page);
                    } catch (NumberFormatException ex) {
                        pageInt = 1;
                    }
                    request.setAttribute("page", pageInt);

                    ArrayList<InvoiceEntity> invoiceEntitys = new InvoiceDao().getInvoiceListByPage(pageInt);
                    request.setAttribute("invoiceEntitys", invoiceEntitys);
                    RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/InvoiceManger.jsp");
                    dispatch.forward(request, response);
                    break;
                }
                default:
                    break;
            }
        } else {
            response.sendRedirect("AdminLogin");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        AdminEntity adminEntity = (AdminEntity) session.getAttribute("admin");

        if (adminEntity != null) {
            request.setAttribute("admin", adminEntity);
        } else {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                String username = null;
                String password = null;
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username")) {
                        username = cookie.getValue();
                    }
                    if (cookie.getName().equals("password")) {
                        password = cookie.getValue();
                    }
                }
                adminEntity = new AdminDao().loginFromRemeberMe(username, password);
                if (adminEntity != null) {
                    session.setAttribute("admin", adminEntity);
                    request.setAttribute("admin", adminEntity);
                }
            }
        }

        if (adminEntity != null) {
            String service = request.getParameter("service");
            if (service == null) {
                return;
            }
            switch (service) {
                case "addProduct":
                    String name = request.getParameter("name");
                    String quantity = request.getParameter("quantity");
                    String priceStr = request.getParameter("price");
                    float price;
                    try {
                        price = Float.parseFloat(priceStr);
                    } catch (NumberFormatException ex) {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Giá tiền không được nhập chính xác");
                        }
                        return;
                    }
                    String picture = request.getParameter("picture");
                    String description = request.getParameter("description");
                    String categoryJson = request.getParameter("category");
                    ArrayList<Integer> category = new ArrayList<>();
                    JSONArray data = (JSONArray) JSONValue.parse(categoryJson);
                    for (int i = 0; i < data.size(); i++) {
                        category.add(Integer.parseInt((String) data.get(i)));
                    }
                    String idProduct = new ProductDao().addProduct(name, quantity, price, picture, description);
                    if (idProduct == null) {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Thêm sản phẩm không thành công");
                        }
                        return;
                    }
                    if (new CategoryDao().addProductToCategory(idProduct, category)) {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Thêm sản phẩm thành công");
                        }
                    } else {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Thêm sản phẩm không thành công");
                        }
                    }
                    break;
                case "addCategory1": {
                    String value = request.getParameter("value");
                    boolean status = new CategoryDao().addCategoryLevel1(value);
                    if (status) {
                        request.setAttribute("status", "Thêm danh mục thành công");
                    } else {
                        request.setAttribute("status", "Thêm danh mục không thành công");
                    }
                    HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = new CategoryDao().getCategoryListForManager();
                    request.setAttribute("category", hashMap);
                    RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/CategoryManager.jsp");
                    dispatch.forward(request, response);
                    break;
                }
                case "addCategory2": {
                    String value = request.getParameter("value");
                    String categoryParent = request.getParameter("categoryParent");
                    boolean status = new CategoryDao().addCategoryLevel2(value, categoryParent);
                    if (status) {
                        request.setAttribute("status", "Thêm danh mục thành công");
                    } else {
                        request.setAttribute("status", "Thêm danh mục không thành công");
                    }
                    HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = new CategoryDao().getCategoryListForManager();
                    request.setAttribute("category", hashMap);
                    RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/CategoryManager.jsp");
                    dispatch.forward(request, response);
                    break;
                }
                case "changeStatusCategory": {
                    String id = request.getParameter("id");
                    String status = request.getParameter("status");
                    if (new CategoryDao().changeStatus(id, status)) {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Đổi trạng thái thành công");
                        }
                    } else {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Đổi trạng thái không thành công");
                        }
                    }
                    break;
                }
                case "editCategory": {
                    String id = request.getParameter("id");
                    String newName = request.getParameter("newName");
                    if (new CategoryDao().updateNameCategory(id, newName)) {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Đổi tên thành công");
                        }
                    } else {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Đổi tên không thành công");
                        }
                    }
                    break;
                }
                case "deleteProduct": {
                    String id = request.getParameter("id");
                    int status = new ProductDao().deleteProduct(id);
                    switch (status) {
                        case 0:
                            try (PrintWriter out = response.getWriter()) {
                                out.print("Lỗi, không thể xóa sản phẩm");
                            }
                            break;
                        case 1:
                            try (PrintWriter out = response.getWriter()) {
                                out.print("Đã xóa sản phẩm thành công");
                            }
                            break;
                        case 2:
                            try (PrintWriter out = response.getWriter()) {
                                out.print("Không thể xóa sản phẩm do đã có hóa đơn liên kết với sản phẩm, đã thay đổi trạng thái sản phẩm");
                            }
                            break;
                        default:
                            break;
                    }
                    break;
                }
                case "editProduct": {
                    String idEdit = request.getParameter("id");
                    String nameEdit = request.getParameter("name");
                    String quantityEdit = request.getParameter("quantity");
                    String priceStrEdit = request.getParameter("price");
                    float priceEdit;
                    try {
                        priceEdit = Float.parseFloat(priceStrEdit);
                    } catch (NumberFormatException ex) {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Giá tiền không được nhập chính xác");
                        }
                        return;
                    }
                    String pictureEdit = request.getParameter("picture");
                    String descriptionEdit = request.getParameter("description");
                    String status = request.getParameter("status");
                    String categoryJsonEdit = request.getParameter("category");
                    ArrayList<Integer> categoryEdit = new ArrayList<>();
                    JSONArray dataEdit = (JSONArray) JSONValue.parse(categoryJsonEdit);
                    for (int i = 0; i < dataEdit.size(); i++) {
                        categoryEdit.add(Integer.parseInt((String) dataEdit.get(i)));
                    }
                    //remove category
                    if (!new CategoryDao().removeOldCategory(idEdit)) {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Sửa đổi thông tin sản phẩm không thành công");
                        }
                        return;
                    }

                    if (!new CategoryDao().addProductToCategory(idEdit, categoryEdit)) {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Sửa đổi thông tin sản phẩm không thành công");
                        }
                        return;
                    }
                    //update
                    if (new ProductDao().updateProduct(idEdit, nameEdit, quantityEdit, priceEdit, pictureEdit, descriptionEdit, status)) {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Sửa đổi sản phẩm thành công");
                        }
                    } else {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Sửa đổi sản phẩm không thành công");
                        }
                    }
                }
                case "updateStatusInvoice": {
                    String status = request.getParameter("status");
                    String id = request.getParameter("id");
                    if (new InvoiceDao().updateStatusInvoice(id, status)) {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Đổi trạng thái thành công");
                        }
                    } else {
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Đổi trạng thái không thành công");
                        }
                    }
                    break;
                }
                default:
                    break;
            }
        } else {
            response.sendRedirect("AdminLogin");
        }
    }

}
