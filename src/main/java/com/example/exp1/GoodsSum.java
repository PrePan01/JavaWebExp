package com.example.exp1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "GoodsSum", value = "/GoodsSum")
public class GoodsSum extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        ArrayList goodsList = (ArrayList) session.getAttribute("goods");
        if(goodsList != null && goodsList.size() != 0){
            PrintWriter out = resp.getWriter();
            out.write(Integer.toString(goodsList.size()));
        }else{
            PrintWriter out = resp.getWriter();
            out.write(0);
        }
    }
}
