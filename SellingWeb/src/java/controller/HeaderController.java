/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CustomerDao;
import entity.CustomerEntity;
import entity.ProductCartEntity;
import java.io.IOException;
import java.util.ArrayList;
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
@WebServlet(name = "HeaderController", urlPatterns = {"/header"})
public class HeaderController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        
        HttpSession session = request.getSession();
        //infor login
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
                customerEntity = new CustomerDao().loginFromRemeberMe(username, password);
                if (customerEntity != null) {
                    session.setAttribute("user", customerEntity);
                    request.setAttribute("customer", customerEntity);
                }
            }
        }
        
        //infor cart
        ArrayList<ProductCartEntity> productCartEntitys = session.getAttribute("cartDetail") == null ? new ArrayList<>() : (ArrayList<ProductCartEntity>) session.getAttribute("cartDetail");
        int totalQuantity = 0;
        float totalPrice = 0;
        for(ProductCartEntity cartEntity: productCartEntitys) {
            totalQuantity++;
            totalPrice += cartEntity.getPrice() * cartEntity.getQuantityInCart();
        }
        request.setAttribute("cartDetail", productCartEntitys);
        request.setAttribute("totalQuantity", totalQuantity);
        request.setAttribute("totalPrice", totalPrice);
        
        RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/header.jsp");
        dispatch.include(request, response);
    }
}
