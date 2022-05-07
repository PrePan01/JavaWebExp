package com.example.exp1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ShoppingCartDelete", value = "/ShoppingCartDelete")
public class ShoppingCartDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int i = Integer.parseInt(request.getParameter("i"));
        HttpSession session = request.getSession();
        ArrayList goodsList = (ArrayList) session.getAttribute("goods");
        goodsList.remove(i);
        session.setAttribute("goods", goodsList);
        response.sendRedirect("shoppingCart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
