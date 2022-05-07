package com.example.exp1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "ModifyUsers", value = "/ModifyUsers")
public class ModifyUsers extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("number"));
        String db = "jdbc:mysql://127.0.0.1:3306/exp";
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(db, "root", "123456");

            stmt = conn.prepareStatement("DELETE FROM users WHERE number = ?");
            stmt.setInt(1, index);
            int result = stmt.executeUpdate();
            if(result == 1){
                response.sendRedirect("admin.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int index = Integer.parseInt(request.getParameter("index"));

        String db = "jdbc:mysql://127.0.0.1:3306/exp";
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(db, "root", "123456");

            stmt = conn.prepareStatement("UPDATE users SET username = ?, password = ? WHERE number = ?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setInt(3, index);
            int result = stmt.executeUpdate();
            if(result == 1){
                response.sendRedirect("admin.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
