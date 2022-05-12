package com.example.exp1;

import dao.UsersDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UserLogin_useDao", value = "/UserLogin_useDao")
public class UserLogin_useDao extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        UsersDao usersDao = new UsersDao();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession loginFailed = request.getSession();
        try {
            if(usersDao.login(username, password)){
                /*Cookie cookie = new Cookie("name", username.equals("admin")?"管理员":username);
                response.addCookie(cookie);*/
                HttpSession loginName = request.getSession();
                loginName.setAttribute("loginName", username.equals("admin")?"管理员":username);
                loginFailed.setAttribute("loginFailed", false);
                response.sendRedirect("welcome.jsp");
                return;
            }else {
//              response.sendRedirect("loginFailed.html");
                loginFailed.setAttribute("loginFailed", true);
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
