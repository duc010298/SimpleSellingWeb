/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CustomerDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Đỗ Trung Đức
 */
@WebServlet(name = "CustomerController", urlPatterns = {"/customer"})
public class CustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if(service.equals("register")) {
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String username = request.getParameter("username");
            if(name == null || address == null || phone == null || username == null || password == null) {
                response.sendRedirect("index?statusLogin=registererror");
                return;
            }
            if(name.isEmpty() || address.isEmpty() || phone.isEmpty() || username.isEmpty() || password.isEmpty()) {
                response.sendRedirect("index?statusLogin=registererror");
                return;
            }
            
            CustomerDao customerDao = new CustomerDao();
            if(customerDao.isDuplicateUsername(username)) {
                response.sendRedirect("index?statusLogin=registerduplicateusername");
                return;
            }
            if(customerDao.registerCustomer(name, address, phone, username, password) == 1) {
                response.sendRedirect("index?statusLogin=registersuccess");
            } else {
                response.sendRedirect("index?statusLogin=registererror");
            }
        }
    }

}
