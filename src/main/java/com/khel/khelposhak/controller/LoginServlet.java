package com.khel.khelposhak.controller;

import com.khel.khelposhak.dao.LoginDao;
import com.khel.khelposhak.model.UserModel;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "Login", urlPatterns = {"/LogServ"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        LoginDao logDao = new LoginDao();
        UserModel userModel = logDao.loginUser(email, password);
        String cp = request.getContextPath();
        if (userModel != null) {
            
            if (userModel.isAdmin()) {
                response.sendRedirect(cp + "/pages/Admindashboard.jsp");
            } else {
                response.sendRedirect(cp + "/pages/home.jsp");
            }
        } else {
            request.setAttribute("error", "incorrect id or pw");
            request.getRequestDispatcher("/pages/login.jsp").forward(request,response);
        }
    }
}
