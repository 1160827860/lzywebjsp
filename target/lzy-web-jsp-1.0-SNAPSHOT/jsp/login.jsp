<%--
  Created by IntelliJ IDEA.
  User: 李正阳
  Date: 2019/11/24
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="/jsp/loginservlet.jsp" method="post">
    账号:<br/>
    <input name="name" id="name" type="text"><br/>
    密码:<br/>
    <input name="password" id="password" type="password"><br/>
    <button type="submit" id="login" name="login">提交</button>
    <a href="register.jsp">注册</a>
</form>

</body>
</html>
