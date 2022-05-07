<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员操作界面</title>
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
        .modifyInputForm{
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            background-color: #fff;
            border: 1px solid black;
            width: 300px;
            height: 200px;
            padding: 10px;
            box-shadow: 2px 2px 2px rgba(0,0,0,0.4);
        }
        table{
            border-collapse:collapse;
            margin-top: 20px;
        }
        th{
            padding: 3px;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1 class="title">xx系统管理员操作页</h1>
    </div>
    <!--        修改信息框-->
    <div class="modifyInput" style="display: none">
        <form action="ModifyUsers" method="post" class="modifyInputForm">
            <h2 style="margin-bottom: 15px">修改信息</h2>
            <div>
                <span>序号：</span><input type="text" class="modifyInputValue" name="index" readonly style="background-color: lightgrey;border: 1px solid rgb(79,79,79);padding: 2px">
            </div>
            <div>
                <span>姓名：</span><input type="text" class="modifyInputValue" name="username">
            </div>
            <div>
                <span>密码：</span><input type="text" class="modifyInputValue" name="password">
            </div>
            <button class="submitModify" type="submit" style="display: inline-block">提交修改</button>
            <button class="cancelModify" type="button" style="display: inline-block">取消修改</button>
        </form>
    </div>
    <!--        表格-->
    <div>
        <table border="1px">
            <tr class="tableTr">
                <th style="width: 100px">操作</th>
                <th style="width: 100px">编号</th>
                <th style="width: 100px">用户名</th>
                <th style="width: 100px">密码</th>
            </tr>

            <%
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
                        String index = result.getString("number");
            %>
            <tr class="tableTr">
                <th>
                    <a href="#" class="modify" style="text-decoration: none;color: lightskyblue">修改</a>
                    <a href="/ModifyUsers?number=<%=index%>" class="delete" style="text-decoration: none;color: lightcoral">删除</a>
                </th>
                <th><%=index%></th>
                <th class="name"><%=user%></th>
                <th class="password"><%=pwd%></th>
            </tr>
            <%
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>
</div>

<script>
    let modifyBtn = document.querySelectorAll(".modify")
    let submitContainer = document.querySelector(".modifyInput")
    let submitModifyBtn = document.querySelector(".submitModify")
    let tableTr = document.querySelectorAll(".tableTr")
    let modifyInputValue = document.querySelectorAll(".modifyInputValue")
    let cancelModify = document.querySelector(".cancelModify")
    let index

    for(let modifyItem of modifyBtn){
        modifyItem.addEventListener("click",function (){
            submitContainer.style.display = ""
            // 内容赋值到修改输入框
            index = modifyItem.parentNode.parentNode.sectionRowIndex
            modifyInputValue[0].value = tableTr[index].children[1].innerText
            modifyInputValue[1].value = tableTr[index].children[2].innerText
            modifyInputValue[2].value = tableTr[index].children[3].innerText
        })
    }
    submitModifyBtn.addEventListener("click",function (){
        let afterModName = modifyInputValue[1].value
        let afterModPwd = modifyInputValue[2].value
        tableTr[index].children[2].innerText = afterModName
        tableTr[index].children[3].innerText = afterModPwd
        submitContainer.style.display = "none"
    })

    cancelModify.addEventListener("click",function (){
        submitContainer.style.display = "none"
    })
</script>
</body>
</html>
