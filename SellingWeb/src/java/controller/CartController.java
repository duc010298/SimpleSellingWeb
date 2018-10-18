/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDao;
import entity.CustomerEntity;
import entity.ProductCartEntity;
import entity.ProductEntity;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "CartController", urlPatterns = {"/Cart"})
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service.equals("checkout")) {
            HttpSession session = request.getSession();
            CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("user");
            if (customerEntity == null) {
                response.sendRedirect("index?status=needLogin");
                return;
            } else {
                request.setAttribute("customer", customerEntity);
            }

            ArrayList<ProductCartEntity> productCartEntitys = session.getAttribute("cartDetail") == null ? new ArrayList<>() : (ArrayList<ProductCartEntity>) session.getAttribute("cartDetail");
            int totalQuantity = session.getAttribute("totalQuantity") == null ? 0 : (int) session.getAttribute("totalQuantity");
            float totalPrice = session.getAttribute("totalPrice") == null ? 0 : (float) session.getAttribute("totalPrice");
            request.setAttribute("cartDetail", productCartEntitys);
            request.setAttribute("totalQuantity", totalQuantity);
            request.setAttribute("totalPrice", totalPrice);

            RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/checkout.jsp");
            dispatch.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String service = request.getParameter("service");
        if (service.equals("addcart")) {
            String id = request.getParameter("id");
            ProductEntity productEntity = new ProductDao().getProductById(id);

            HttpSession session = request.getSession();
            ArrayList<ProductCartEntity> productCartEntitys = (ArrayList<ProductCartEntity>) session.getAttribute("cartDetail");
            if (productCartEntitys == null) {
                productCartEntitys = new ArrayList<>();
                productCartEntitys.add(new ProductCartEntity(1, productEntity.getId(), productEntity.getName(), productEntity.getPrice(), productEntity.getPricture()));
                session.setAttribute("cartDetail", productCartEntitys);
                session.setAttribute("totalQuantity", 1);
                session.setAttribute("totalPrice", productEntity.getPrice());
                try (PrintWriter out = response.getWriter()) {
                    out.print("Add to cart successfully");
                }
                return;
            } else {
                int totalQuantity = (int) session.getAttribute("totalQuantity");
                float totalPrice = (float) session.getAttribute("totalPrice");
                for (ProductCartEntity cartEntity : productCartEntitys) {
                    if (productEntity.getId() == cartEntity.getId()) {
                        totalPrice += productEntity.getPrice();
                        int quantityInCart = cartEntity.getQuantityInCart();
                        cartEntity.setQuantityInCart(++quantityInCart);
                        session.setAttribute("totalPrice", totalPrice);
                        session.setAttribute("cartDetail", productCartEntitys);
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Add to cart successfully");
                        }
                        return;
                    }
                }
                totalQuantity++;
                totalPrice += productEntity.getPrice();
                productCartEntitys.add(new ProductCartEntity(1, productEntity.getId(), productEntity.getName(), productEntity.getPrice(), productEntity.getPricture()));
                session.setAttribute("cartDetail", productCartEntitys);
                session.setAttribute("totalQuantity", totalQuantity);
                session.setAttribute("totalPrice", totalPrice);
                try (PrintWriter out = response.getWriter()) {
                    out.print("Add to cart successfully");
                }
            }
        }
    }

}
