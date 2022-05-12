<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <button id="showSum">查看购物车总数</button>
    <h3 id="goodsSum"></h3>
    <a href="/welcome.jsp"><h2>返回</h2></a>
    <ul>
        <%--<%
            ArrayList goodsList = (ArrayList) session.getAttribute("goods");
            if(goodsList != null && goodsList.size() != 0){
                for(int i = 0; i < goodsList.size();i++){
                    out.print("<li>" + goodsList.get(i) + "</li>"+"<a href='/ShoppingCartDelete?i="+i+"'>删除</a>");
                }
            }else{
                out.print("暂无商品");
            }
        %>--%>
        <c:forEach var="goodsItem" items="${goods}" varStatus="itemStatus">
            <li>${goodsItem}</li>
            <a href='/ShoppingCartDelete?i=${itemStatus.index}'>删除</a>
        </c:forEach>
    </ul>
    <script>
        function showSum(){
            var xhr = new XMLHttpRequest();
            xhr.open('GET','GoodsSum')
            xhr.onreadystatechange = function (){
                if(xhr.readyState === 4){
                    if(xhr.status >= 200 && xhr.status < 300){
                        document.getElementById("goodsSum").innerText = xhr.responseText
                    }
                }
            }
            xhr.send()
        }
        document.getElementById("showSum").addEventListener("click",showSum)
    </script>
</body>
</html>
