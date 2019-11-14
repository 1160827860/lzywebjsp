<%--
  Created by IntelliJ IDEA.
  User: 李正阳
  Date: 2019/11/13
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆界面</title>
</head>
<body>
    ${ERROR_INFO}
    <form action="login" method="post">
        账号:<br/>
        <input name="name" id="name" type="text"><br/>
        密码:<br/>
        <input name="password" id="password" type="password"><br/>
        <button type="submit">提交</button>
    </form>

</body>
</html>
