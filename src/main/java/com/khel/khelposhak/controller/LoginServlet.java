
package com.khel.khelposhak.controller;

import com.khel.khelposhak.dao.LoginDao;
import com.khel.khelposhak.model.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
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
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            LoginDao logDao = new LoginDao();
            
            UserModel userModel = logDao.loginUser(email, password);
            
            if(userModel != null){
                
                if(userModel.isAdmin()){
                    response.sendRedirect("dashboard.jsp");
                }else{
                    response.sendRedirect("pages/home.jsp");
                }
            }else{
                response.sendRedirect("page/login.jsp");
            }
        } catch (ClassNotFoundException ex) {
                System.out.println(ex.getLocalizedMessage());
        }
}
}