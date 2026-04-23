package com.khel.khelposhak.controller;

import com.khel.khelposhak.dao.CategoryDao;
import com.khel.khelposhak.dao.ProductDao;
import com.khel.khelposhak.model.CategoryModel;
import com.khel.khelposhak.model.ProductModel;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = {"/homeS"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao pdao = new ProductDao();
        CategoryDao cdao = new CategoryDao();

        String search = request.getParameter("search");
        String category = request.getParameter("category");
        String sort = request.getParameter("sort");

        List<ProductModel> products = pdao.getAllProduct();

        if (search != null && !search.trim().isEmpty()) {
            products = pdao.searchProducts(search);
            request.setAttribute("searchKeyword", search);
        }

        if (category != null && !category.isEmpty()) {
            int categoryId = Integer.parseInt(category);
            products = pdao.getProductsByCategory(categoryId);
            request.setAttribute("selectedCategory", categoryId);
        }

        if ("price".equals(sort)) {
            products = pdao.getProductOfMaxPrice();
            request.setAttribute("sortType", "Highest Price");
        }

        List<CategoryModel> categories = cdao.getAllCategories();

        request.setAttribute("products", products);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/pages/home.jsp").forward(request, response);
    }
}