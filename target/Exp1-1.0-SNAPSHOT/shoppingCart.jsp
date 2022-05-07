<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 13675
  Date: 2022/4/28
  Time: 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
</head>
<body>
    <h1>购物车</h1>
    <a href="/welcome.jsp"><h2>返回</h2></a>
    <ul>
        <%
            ArrayList goodsList = (ArrayList) session.getAttribute("goods");
            if(goodsList != null && goodsList.size() != 0){
                for(int i = 0; i < goodsList.size();i++){
                    out.print("<li>" + goodsList.get(i) + "</li>"+"<a href='/ShoppingCartDelete?i="+i+"'>删除</a>");
                }
            }else{
                out.print("暂无商品");
            }
        %>
    </ul>
</body>
</html>
