/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDao;
import entity.ProductEntity;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Đỗ Trung Đức
 */
@WebServlet(name = "HomeController", urlPatterns = {"/index"})
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status = request.getParameter("status");
        if (status != null) {
            if (status.equals("duplicate")) {
                String username = request.getParameter("username");
                request.setAttribute("status", "Bạn đã đăng nhập với tên " + username);
            }
            if (status.equals("sessionout")) {
                request.setAttribute("status", "Phiên đã hết hạn");
            }
            if (status.equals("failed")) {
                request.setAttribute("status", "Đăng nhập không thành công");
            }
            if (status.equals("success")) {
                request.setAttribute("status", "Đăng nhập thành công");
            }
            if (status.equals("logoutsuccess")) {
                request.setAttribute("status", "Đăng xuất thành công");
            }
            if (status.equals("registererror")) {
                request.setAttribute("status", "Đăng kí không thành công");
            }
            if (status.equals("registerduplicateusername")) {
                request.setAttribute("status", "Tên đăng nhập đã tồn tại");
            }
            if (status.equals("registersuccess")) {
                request.setAttribute("status", "Đăng kí thành công");
            }
            if (status.equals("needLogin")) {
                request.setAttribute("status", "Bạn cần đăng nhập trước khi checkout");
            }
        }
        
        ArrayList<ProductEntity> productEntities = new ProductDao().getTop20Product();
        request.setAttribute("productEntities", productEntities);
        RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/home.jsp");
        dispatch.forward(request, response);
    }

}
