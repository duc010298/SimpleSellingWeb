/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AdminDao;
import dao.CategoryDao;
import dao.ProductDao;
import entity.AdminEntity;
import entity.CategoryEntity;
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
                            HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = new CategoryDao().getCategoryList();
                            request.setAttribute("category", hashMap);
                            String id = request.getParameter("id");
                            ProductEntity productEntity = new ProductDao().getProductByIdForEdit(id);
                            request.setAttribute("productEntity", productEntity);
                            RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/EditProduct.jsp");
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
                    //edit here
                }
                default:
                    break;
            }
        } else {
            response.sendRedirect("AdminLogin");
        }
    }

}
