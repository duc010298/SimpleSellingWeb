/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CustomerDao;
import entity.CustomerEntity;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Đỗ Trung Đức
 */
@WebServlet(name = "CustomerController", urlPatterns = {"/customer"})
public class CustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        HttpSession session = request.getSession();
        CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("user");
        if (customerEntity == null) {
            response.sendError(401, "Bạn không có quyền truy cập trang này");
            return;
        }

        String service = request.getParameter("service");
        if (service != null) {
            if (service.equals("info")) {
                String id = request.getParameter("id");
                customerEntity = new CustomerDao().getInfoFromId(id);
                request.setAttribute("customerEntity", customerEntity);
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/CustomerInfo.jsp");
                dispatch.forward(request, response);
            }
        } else {
            response.sendError(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String service = request.getParameter("service");
        switch (service) {
            case "register": {
                String password = request.getParameter("password");
                String name = request.getParameter("name");
                System.out.println(name);
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String username = request.getParameter("username");
                if (name == null || address == null || phone == null || username == null || password == null) {
                    response.sendRedirect("index?status=registererror");
                    return;
                }
                if (name.isEmpty() || address.isEmpty() || phone.isEmpty() || username.isEmpty() || password.isEmpty()) {
                    response.sendRedirect("index?status=registererror");
                    return;
                }
                CustomerDao customerDao = new CustomerDao();
                if (customerDao.isDuplicateUsername(username)) {
                    response.sendRedirect("index?status=registerduplicateusername");
                    return;
                }
                if (customerDao.registerCustomer(name, address, phone, username, password) == 1) {
                    response.sendRedirect("index?status=registersuccess");
                } else {
                    response.sendRedirect("index?status=registererror");
                }
                break;
            }
            case "editInfoCustomer": {
                System.out.println("dasdasd");
                String id = request.getParameter("id");
                String password = request.getParameter("password");
                if (!new CustomerDao().authentication(id, password)) {
                    try (PrintWriter out = response.getWriter()) {
                        out.print("Mật khẩu không đúng");
                    }
                    return;
                }
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                if (new CustomerDao().updateInfor(id, name, address, phone)) {
                    try (PrintWriter out = response.getWriter()) {
                        out.print("Cập nhật thông tin thành công");
                    }
                } else {
                    try (PrintWriter out = response.getWriter()) {
                        out.print("Cập nhật thông tin không thành công");
                    }
                }
                break;
            }
            case "changePassword": {
                String id = request.getParameter("id");
                String oldPass = request.getParameter("oldPass");
                if (!new CustomerDao().authentication(id, oldPass)) {
                    try (PrintWriter out = response.getWriter()) {
                        out.print("Mật khẩu không đúng");
                    }
                    return;
                }
                String newPass = request.getParameter("newPass");
                if (new CustomerDao().changePassword(id, newPass)) {
                    try (PrintWriter out = response.getWriter()) {
                        out.print("Cập nhật thông tin thành công");
                    }
                } else {
                    try (PrintWriter out = response.getWriter()) {
                        out.print("Cập nhật thông tin không thành công");
                    }
                }
                break;
            }
            default:
                break;
        }
    }

}
