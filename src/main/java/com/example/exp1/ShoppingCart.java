package com.example.exp1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ShoppingCart", value = "/ShoppingCart")
public class ShoppingCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        String goodName = request.getParameter("goodName");

        HttpSession session = request.getSession();

        ArrayList goodsList = (ArrayList) session.getAttribute("goods");

        if(goodsList == null){
            ArrayList al = new ArrayList<>();
            al.add(goodName);
            session.setAttribute("goods", al);
        }else{
            goodsList.add(goodName);
        }
        response.sendRedirect("welcome.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
