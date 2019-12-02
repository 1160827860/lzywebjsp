<%--
  Created by IntelliJ IDEA.
  User: 李正阳
  Date: 2019/12/1
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String name = (String) request.getSession().getAttribute("USER_NAME");
        if(name == null){
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    %>
</body>
</html>
