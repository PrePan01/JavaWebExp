package com.example.exp1;

import dao.UsersDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        UsersDao usersDao = new UsersDao();
        try {
            if(usersDao.register(request.getParameter("username"), request.getParameter("password"))){
                response.sendRedirect("regSuccess.html");
            }else {

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
