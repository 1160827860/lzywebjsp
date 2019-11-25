<%@ page import="com.darksouls.dao.UserDao" %>
<%@ page import="com.darksouls.dao.UserDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: 李正阳
  Date: 2019/11/24
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String message = request.getParameter("message");
    String usename = (String)request.getSession().getAttribute("USER_NAME");
    UserDao userDao = new UserDaoImpl();
    int id  = userDao.SelectUserId(usename);
    userDao.InsertMessage(message,id);
    request.getRequestDispatcher("../WEB-INF/view/success.jsp").forward(request,response);
%>
</body>
</html>
