<%@ page import="com.darksouls.dao.UserDao" %>
<%@ page import="com.darksouls.dao.UserDaoImpl" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
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
<jsp:include page="checkUserLevel.jsp"></jsp:include>
<%
    String message = request.getParameter("message");
    String usename = (String)request.getSession().getAttribute("USER_NAME");
    String title = request.getParameter("title");
    UserDao userDao = new UserDaoImpl();
    int id  = userDao.selectUserId(usename);
    java.util.Date utilDate = new java.util.Date();
    Date sqlDate = new Date(utilDate.getTime());
    userDao.insertMessage(message,id,title,sqlDate);
    request.getRequestDispatcher("../WEB-INF/view/success.jsp").forward(request,response);
%>
</body>
</html>
