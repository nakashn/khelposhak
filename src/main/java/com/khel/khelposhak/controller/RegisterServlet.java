package com.khel.khelposhak.controller;

import com.khel.khelposhak.dao.RegisterDao;
import com.khel.khelposhak.model.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/regServ"})
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        RegisterDao userdao = new RegisterDao();
        UserModel user = new UserModel();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setAddress(address);

        {
            try {
                if (userdao.registerUser(user)) {
                    request.getRequestDispatcher("pages/login.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("pages/register.jsp").forward(request, response);
                }

            } catch (Exception ex) {
                System.out.println(ex.getLocalizedMessage());
            }
        }
    }
}
