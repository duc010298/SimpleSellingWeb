/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDao;
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
@WebServlet(name = "CategoryDetailController", urlPatterns = {"/categoryDetail"})
public class CategoryDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("categoryId");
        String sortBy = request.getParameter("sortBy");
        ArrayList<ProductEntity> productEntitys = new ProductDao().getByCategory(id, sortBy);
        String category = new CategoryDao().getNameById(id);
        request.setAttribute("category", category);
        request.setAttribute("productEntities", productEntitys);
        RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/CategoryDetail.jsp");
        dispatch.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
