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
        String id = request.getParameter("id");

        ProductEntity entity = new ProductDao().getProductById(id);
        request.setAttribute("entity", entity);

        ArrayList<ProductEntity> productEntities = new ProductDao().getTop20Product();
        request.setAttribute("productEntities", productEntities);

        RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/ProductDetail.jsp");
        dispatch.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
