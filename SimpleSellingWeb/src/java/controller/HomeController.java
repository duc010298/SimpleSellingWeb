/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDao;
import dao.CustomerDao;
import dao.ProductDao;
import entity.CategoryEntity;
import entity.CustomerEntity;
import entity.ProductEntity;
import java.io.IOException;
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

/**
 *
 * @author Đỗ Trung Đức
 */
@WebServlet(name = "HomeController", urlPatterns = {"/index"})
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String statusLogin = request.getParameter("statusLogin");
        if(statusLogin != null) {
            if(statusLogin.equals("duplicate")) {
                String username = request.getParameter("username");
                request.setAttribute("statusLogin", "Bạn đã đăng nhập với tên " + username);
            }
            if(statusLogin.equals("sessionout")) {
                request.setAttribute("statusLogin", "Phiên đã hết hạn");
            }
            if(statusLogin.equals("failed")) {
                request.setAttribute("statusLogin", "Đăng nhập không thành công");
            }
            if(statusLogin.equals("success")) {
                request.setAttribute("statusLogin", "Đăng nhập thành công");
            }
            if(statusLogin.equals("logoutsuccess")) {
                request.setAttribute("statusLogin", "Đăng xuất thành công");
            }
            if(statusLogin.equals("registererror")) {
                request.setAttribute("statusLogin", "Đăng kí không thành công");
            }
            if(statusLogin.equals("registerduplicateusername")) {
                request.setAttribute("statusLogin", "Tên đăng nhập đã tồn tại");
            }
            if(statusLogin.equals("registersuccess")) {
                request.setAttribute("statusLogin", "Đăng kí thành công");
            }
        }
        
        HttpSession session = request.getSession();
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("user");
        if (customerEntity != null) {
            request.setAttribute("customer", customerEntity);
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
                customerEntity = new CustomerDao().login(username, password);
                if (customerEntity != null) {
                    session.setAttribute("user", customerEntity);
                    request.setAttribute("customer", customerEntity);
                }
            }
        }

        HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = new CategoryDao().getCategoryList();
        ArrayList<ProductEntity> productEntities = new ProductDao().getProductForIndex();
        request.setAttribute("categoryMap", hashMap);
        request.setAttribute("productEntities", productEntities);
        RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/home.jsp");
        dispatch.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
