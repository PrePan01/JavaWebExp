<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PrePan
  Date: 2022/5/11
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <style>
    *{
      padding: 0;
      margin: 0;
    }
    .container{
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .comfirm{
      display: block;
      margin: 20px auto;
      width: 50px;
    }
    .form-item{
      margin-bottom: 10px;
    }
    .form-item-title{
      display: inline-block;
      width: 80px;
      text-align-last: justify;
      text-align: center;
      font-size: 20px;
    }
    .header{
      background-color: cornflowerblue;
      height: 100px;
      width: 100vw;
    }
    .title{
      line-height: 100px;
      display: inline-block;
      margin-left: 100px;
      color: beige;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <h1 class="title">xx系统</h1>
  </div>
  <h1 style="margin: 15px 0">登录</h1>
  <form action="UserLogin_useDao" method="post">
    <div class="form-item">
      <span class="form-item-title">用户名</span>：<input type="text" name="username" id="username">
    </div>
    <div class="form-item">
      <span class="form-item-title">密码</span>：<input type="password" name="password" id="password">
    </div>
    <c:if test="${loginFailed}">
      <div style="color:red">登陆失败！请检查用户名或密码</div>
    </c:if>
    <input type="submit" value="确认" class="comfirm">
  </form>
  <a href="register.html">没有账号？</a>
</div>
</body>
</html>
