<%@ page import="java.io.Console" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        .header{
            background-color: cornflowerblue;
            height: 100px;
        }
        .title{
            line-height: 100px;
            display: inline-block;
            margin-left: 100px;
            color: beige;
        }
        .redirect{
            line-height: 100px;
            display: inline-block;
            float: right;
        }
        .redirect h2{
            margin: 0 30px;
            width: 100px;
            display: inline-block;
        }
        .redirect a{
            color: white;
            text-decoration: none;
        }

    /*    商品列表*/
        .goodList{
            width: 80vw;
            display: flex;
            justify-content: space-evenly;
            margin: 40px auto;
        }
        .goodItem{
            border: 1px solid black;
            width: 200px;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 0 10px 10px 10px;
        }
        .goodPrice{
            color: red;
            font-size: 18px;
        }
    /*    购物车*/
        .shopping-cart{
            float: right;
            top: 30vh;
            right: 10px;
            border: 1px solid lightskyblue;
            padding: 10px;
            font-size: 22px;
        }
    </style>
</head>
<body>
<%
    Cookie[] cookie = request.getCookies();
    String name = null;
    for (int i = 0; i < cookie.length; i++) {
        if (cookie[i].getName().equals("name")) {
            name = cookie[i].getValue();
        }
    }
%>
<div class="header">
    <h1 class="title">欢迎<%=name%>使用xx系统</h1>
    <div class="redirect">
        <%
            if(name.equals("管理员")){
                out.println("<h2><a href=\"admin.jsp\">管理页面</a></h2>");
            }
        %>
        <h2><a href="userInfo.html">个人中心</a></h2>
        <h2><a href="login.html">退出</a></h2>
    </div>

    <div class="goodList">
        <div class="goodItem">
            <img src="./assets/1.png" alt="" width="200px">
            <a href="/ShoppingCart?goodName=荣耀Magic4 12GB+256GB 釉白">荣耀Magic4 12GB+256GB 釉白</a>
            <div class="goodPrice">￥4899.00</div>
        </div>
        <div class="goodItem">
            <img src="./assets/2.png" alt="" width="200px">
            <a href="/ShoppingCart?goodName=小米11 Ultra 12GB+256GB 黑色">小米11 Ultra 12GB+256GB 黑色</a>
            <div class="goodPrice">￥3999.00</div>
        </div>
        <div class="goodItem">
            <img src="./assets/3.png" alt="" width="200px">
            <a href="/ShoppingCart?goodName=vivo X80 8GB+128GB 旅程 天玑9000旗舰芯片">vivo X80 8GB+128GB 旅程 天玑9000旗舰芯片</a>
            <div class="goodPrice">￥3699.00</div>
        </div>
        <div class="goodItem">
            <img src="./assets/4.png" alt="" width="200px">
            <a href="/ShoppingCart?goodName=OPPO Find X5 Pro 天玑版 12+256GB 白瓷">OPPO Find X5 Pro 天玑版 12+256GB 白瓷</a>
            <div class="goodPrice">￥5799.00</div>
        </div>
        <div class="goodItem">
            <img src="./assets/5.png" alt="" width="200px">
            <a href="/ShoppingCart?goodName=Apple iPhone 12 (A2404) 128GB 绿色">Apple iPhone 12 (A2404) 128GB 绿色</a>
            <div class="goodPrice">￥5199.00</div>
        </div>
        <div class="goodItem">
            <img src="./assets/6.png" alt="" width="200px">
            <a href="/ShoppingCart?goodName=Apple iPad Air5 10.9英寸平板电脑">Apple iPad Air5 10.9英寸平板电脑</a>
            <div class="goodPrice">￥4399.00</div>
        </div>
    </div>

    <a href="/shoppingCart.jsp">
        <div class="shopping-cart">
            购<br>物<br>车
        </div>
    </a>
</div>
<div class="body">

</div>
</body>
</html>
