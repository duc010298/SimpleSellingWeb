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
@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String value = request.getParameter("value");
        ArrayList<ProductEntity> productEntities = value.isEmpty() ? new ArrayList<>() : new ProductDao().searchProduct(value);
        request.setAttribute("value", value);
        request.setAttribute("productEntities", productEntities);
        RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/search.jsp");
        dispatch.forward(request, response);
    }

}
