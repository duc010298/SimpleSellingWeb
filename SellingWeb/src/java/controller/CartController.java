/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.InvoiceDao;
import dao.InvoiceDetailDao;
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
import util.MyUtils;

/**
 *
 * @author Đỗ Trung Đức
 */
@WebServlet(name = "CartController", urlPatterns = {"/Cart"})
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        
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
            int totalQuantity = 0;
            float totalPrice = 0;
            for (ProductCartEntity cartEntity : productCartEntitys) {
                totalQuantity++;
                totalPrice += cartEntity.getPrice() * cartEntity.getQuantityInCart();
            }
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String service = request.getParameter("service");
        if (service.equals("addcart")) {
            String id = request.getParameter("id");
            ProductEntity productEntity = new ProductDao().getProductById(id);

            HttpSession session = request.getSession();
            ArrayList<ProductCartEntity> productCartEntitys = (ArrayList<ProductCartEntity>) session.getAttribute("cartDetail");
            if (productCartEntitys == null) {
                productCartEntitys = new ArrayList<>();
                productCartEntitys.add(new ProductCartEntity(1, productEntity.getId(), productEntity.getName(), productEntity.getQuantity(), productEntity.getPrice(), productEntity.getPricture()));
                session.setAttribute("cartDetail", productCartEntitys);
                try (PrintWriter out = response.getWriter()) {
                    out.print("Add to cart successfully");
                }
                return;
            } else {
                for (ProductCartEntity cartEntity : productCartEntitys) {
                    if (productEntity.getId().equals(cartEntity.getId())) {
                        int quantityInCart = cartEntity.getQuantityInCart();
                        cartEntity.setQuantityInCart(++quantityInCart);
                        session.setAttribute("cartDetail", productCartEntitys);
                        try (PrintWriter out = response.getWriter()) {
                            out.print("Add to cart successfully");
                        }
                        return;
                    }
                }
                productCartEntitys.add(new ProductCartEntity(1, productEntity.getId(), productEntity.getName(), productEntity.getQuantity(), productEntity.getPrice(), productEntity.getPricture()));
                session.setAttribute("cartDetail", productCartEntitys);
                try (PrintWriter out = response.getWriter()) {
                    out.print("Add to cart successfully");
                }
            }
        }

        if (service.equals("updateCart")) {
            String id = request.getParameter("id");
            String quantity = request.getParameter("quantity");
            HttpSession session = request.getSession();
            ArrayList<ProductCartEntity> productCartEntitys = (ArrayList<ProductCartEntity>) session.getAttribute("cartDetail");
            productCartEntitys.stream().filter((productCartEntity) -> (id.equals(String.valueOf(productCartEntity.getId())))).forEachOrdered((productCartEntity) -> {
                productCartEntity.setQuantityInCart(Integer.parseInt(quantity));
            });
            session.setAttribute("cartDetail", productCartEntitys);
            try (PrintWriter out = response.getWriter()) {
                out.print("Update cart successfully");
            }
        }

        if (service.equals("removeCart")) {
            String id = request.getParameter("id");
            HttpSession session = request.getSession();
            ArrayList<ProductCartEntity> productCartEntitys = (ArrayList<ProductCartEntity>) session.getAttribute("cartDetail");
            for (ProductCartEntity cartEntity : productCartEntitys) {
                if (id.equals(cartEntity.getId())) {
                    productCartEntitys.remove(cartEntity);
                    break;
                }
            }
            float totalPrice = 0;
            for (ProductCartEntity cartEntity : productCartEntitys) {
                totalPrice += cartEntity.getPrice() * cartEntity.getQuantityInCart();
            }
            session.setAttribute("cartDetail", productCartEntitys);
            try (PrintWriter out = response.getWriter()) {
                out.print(MyUtils.priceToString(totalPrice));
            }
        }

        if (service.equals("checkout")) {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            HttpSession session = request.getSession();
            CustomerEntity customerEntity = (CustomerEntity) session.getAttribute("user");
            ArrayList<ProductCartEntity> productCartEntitys = (ArrayList<ProductCartEntity>) session.getAttribute("cartDetail");

            float totalPrice = 0;
            for (ProductCartEntity cartEntity : productCartEntitys) {
                totalPrice += cartEntity.getPrice() * cartEntity.getQuantityInCart();
            }
            String invoiceId = new InvoiceDao().addInvoice(customerEntity.getId(), name, address, phone, totalPrice);
            if (invoiceId == null) {
                request.setAttribute("status", "Đơn hàng của quý khách chưa được gửi. Vui lòng quay lại giỏ hàng để thử gửi lại hoặc liên hệ với chúng tôi để được trợ giúp.");
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/checkoutStatus.jsp");
                dispatch.forward(request, response);
                return;
            }
            
            if(new InvoiceDetailDao().addInvoiceDetail(invoiceId, productCartEntitys)) {
                session.removeAttribute("cartDetail");
                request.setAttribute("status", "Đơn hàng đã được gửi thành công, bộ phận chăm sóc khách hàng sẽ liên hệ với quý khách để hướng dẫn thêm chi tiết");
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/checkoutStatus.jsp");
                dispatch.forward(request, response);
            } else {
                request.setAttribute("status", "Đơn hàng của quý khách chưa được gửi. Vui lòng quay lại giỏ hàng để thử gửi lại hoặc liên hệ với chúng tôi để được trợ giúp.");
                RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/checkoutStatus.jsp");
                dispatch.forward(request, response);
            }
            
        }
    }

}
