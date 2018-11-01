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
@WebServlet(name = "ProductDetail", urlPatterns = {"/ProductDetail"})
public class ProductDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        
        String id = request.getParameter("id");

        ProductEntity entity = new ProductDao().getProductById(id);
        request.setAttribute("entity", entity);
        
        int pageInt = 0;
        String page = request.getParameter("page");
        if(page == null) pageInt = 1;
        try {
            pageInt = Integer.parseInt(page);
        } catch(NumberFormatException ex) {
            pageInt = 1;
        }
        request.setAttribute("page", pageInt);

        ArrayList<ProductEntity> productEntities = new ProductDao().getTopByPage(pageInt);
        request.setAttribute("productEntities", productEntities);

        RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/ProductDetail.jsp");
        dispatch.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
