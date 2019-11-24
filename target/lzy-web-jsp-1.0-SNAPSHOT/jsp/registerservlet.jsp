<%@ page import="com.darksouls.dao.UserDao" %>
<%@ page import="com.darksouls.dao.UserDaoImpl" %>
<%@ page import="com.darksouls.vo.User" %><%--
  Created by IntelliJ IDEA.
  User: 李正阳
  Date: 2019/11/24
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String username = request.getParameter("name");
        String userpassword = request.getParameter("password");
        String email = request.getParameter("mail");
        UserDao userDao = new UserDaoImpl();
        if(userDao.SelectUser(username,userpassword) == 0){
            User user = new User(username,userpassword,email);
            userDao.InsertUser(user);
            request.getRequestDispatcher("../WEB-INF/view/success.jsp").forward(request,response);
        }else {
            request.getRequestDispatcher("../WEB-INF/view/error.jsp").forward(request,response);
        }
    %>
    <title>Title</title>
</head>
<body>

</body>
</html>
