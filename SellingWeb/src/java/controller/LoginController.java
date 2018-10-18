/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CustomerDao;
import entity.CustomerEntity;
import java.io.IOException;
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
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("logout") != null) {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username") || cookie.getName().equals("password")) {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("index?status=logoutsuccess");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        CustomerEntity customerEntityOld = (CustomerEntity) session.getAttribute("user");
        CustomerEntity customerEntity;

        if (customerEntityOld != null) {
            customerEntity = new CustomerDao().login(customerEntityOld.getUsername(), customerEntityOld.getPassword());
            if (customerEntity != null) {
                response.sendRedirect("index?status=duplicate&username=" + customerEntityOld.getUsername());
                return;
            } else {
                response.sendRedirect("index?status=sessionout");
                return;
            }
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember-me");

        customerEntity = new CustomerDao().login(username, password);
        if (customerEntity == null) {
            response.sendRedirect("index?status=failed");
            return;
        }

        session.setAttribute("user", customerEntity);

        if (rememberMe != null) {
            Cookie usernameCookie = new Cookie("username", customerEntity.getUsername());
            Cookie passwordCookie = new Cookie("password", customerEntity.getPassword());
            usernameCookie.setMaxAge(60 * 60 * 24 * 30);
            passwordCookie.setMaxAge(60 * 60 * 24 * 30);
            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);
        }
        response.sendRedirect("index?status=success");
    }
}
