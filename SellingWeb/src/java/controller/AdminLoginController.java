/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AdminDao;
import entity.AdminEntity;
import java.io.IOException;
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
@WebServlet(name = "AdminLoginController", urlPatterns = {"/AdminLogin"})
public class AdminLoginController extends HttpServlet {

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
            request.setAttribute("status", "Đăng xuất thành công");
            RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/AdminLogin.jsp");
            dispatch.forward(request, response);
            return;
        }
        RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/AdminLogin.jsp");
        dispatch.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminEntity adminEntityOld = (AdminEntity) session.getAttribute("admin");
        AdminEntity adminEntity;

        if (adminEntityOld != null) {
            adminEntity = new AdminDao().loginFromRemeberMe(adminEntityOld.getUsername(), adminEntityOld.getPassword());
            if (adminEntity != null) {
                request.setAttribute("status", "Bạn đã đăng nhập với tên: " + adminEntity.getUsername());
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/AdminLogin.jsp");
                dispatch.forward(request, response);
                return;
            } else {
                HttpSession session2 = request.getSession(false);
                if (session2 != null) {
                    session.invalidate();
                }
                request.setAttribute("status", "Phiên đã hết hạn");
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/AdminLogin.jsp");
                dispatch.forward(request, response);
                return;
            }
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember-me");

        adminEntity = new AdminDao().login(username, password);
        if (adminEntity == null) {
            request.setAttribute("status", "Đăng nhập không thành công");
            RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/AdminLogin.jsp");
            dispatch.forward(request, response);
            return;
        }

        session.setAttribute("admin", adminEntity);
        
        if (rememberMe != null) {
            Cookie usernameCookie = new Cookie("username", adminEntity.getUsername());
            Cookie passwordCookie = new Cookie("password", adminEntity.getPassword());
            usernameCookie.setMaxAge(60 * 60 * 24 * 30);
            passwordCookie.setMaxAge(60 * 60 * 24 * 30);
            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);
        }
        
        
        response.sendRedirect("dashboard");

    }

}
