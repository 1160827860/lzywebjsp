<%--
  Created by IntelliJ IDEA.
  User: 李正阳
  Date: 2019/11/24
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="/jsp/registerservlet.jsp" method="post">
    注册：<br>
    姓名：<br>
    <input id="name" name="name"type="text"><br>
    密码:<br>
    <input id="password" name="password" type="password"><br>
    重复密码：<br>
    <input id="repassword" name="repassword" type="password"><br>
    邮箱：<br>
    <input id="mail" name="mail" type="text"><br>
    <button type="submit" id="register" name="register">提交</button>
</form>
</body>
</html>
