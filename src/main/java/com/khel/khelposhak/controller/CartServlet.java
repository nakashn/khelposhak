/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.khel.khelposhak.controller;

import com.khel.khelposhak.model.CartModel;
import com.khel.khelposhak.model.UserModel;
import com.khel.khelposhak.utils.SessionUtil;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author akashadhikari
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/CartS"})
public class CartServlet extends HttpServlet {

    private List<CartModel> getCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<CartModel> cart = (List<CartModel>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserModel user = (UserModel) SessionUtil.getAttribute(request, "user");
        //for saving the product information to session jun log in gary paxi add garna melx
        if (user == null) {
            String productId = request.getParameter("product_id");
            String size = request.getParameter("size");
            String quantity = request.getParameter("quantity");

            HttpSession session = request.getSession();
            session.setAttribute("pending id", productId);
            session.setAttribute("pedingSize", size);
            session.setAttribute("pedingSize", quantity);
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            

        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
