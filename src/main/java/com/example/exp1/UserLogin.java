package com.example.exp1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "UserLogin", value = "/UserLogin")
public class UserLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if(username.equals("admin") && password.equals("admin")){
            Cookie cookie = new Cookie("name", "管理员");
            response.addCookie(cookie);
            response.sendRedirect("welcome.jsp");
            return;
        }

        String db = "jdbc:mysql://127.0.0.1:3306/exp";
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(db, "root", "123456");
            stmt = conn.createStatement();
            String sql = "SELECT * FROM users";
            ResultSet result = stmt.executeQuery(sql);
            while(result.next()){
                String user = result.getString("username");
                String pwd = result.getString("password");
                if (username.equals(user) && password.equals(pwd)) {
                    Cookie cookie = new Cookie("name", username);
                    response.addCookie(cookie);
                    response.sendRedirect("welcome.jsp");
                    return;
                }
            }
            response.sendRedirect("loginFailed.html");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
