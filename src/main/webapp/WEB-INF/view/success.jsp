<%--
  Created by IntelliJ IDEA.
  User: 李正阳
  Date: 2019/11/14
  Time: 0:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    登陆成功
    ${USER_NAME}访问登陆Servlet的次数${NUM}
    <form action="/jsp/messagecommit.jsp">
        添加留言：
        <input type="text" name="message" id="message">
        <button id="finish" name="finish">提交留言</button>
    </form>

</body>
</html>
