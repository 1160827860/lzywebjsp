<%@ page import="java.util.HashMap" %>
<%@ page import="com.darksouls.dao.UserDao" %>
<%@ page import="com.darksouls.dao.UserDaoImpl" %>
<%@ page import="com.alibaba.druid.util.StringUtils" %><%--
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

<%!
    int init = 0;
%>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String userName = request.getParameter("name");
    String userPassword = request.getParameter("password");
    UserDao userDao = new UserDaoImpl();
    try {
    int n = userDao.selectUser(userName,userPassword);
    /**
     * 验证登陆
     */
    if(!StringUtils.isEmpty(userName)){
        if(n == 1){
    /**
     * 添加session，以及访问次数
     */
        init++;
            if(session.getAttribute(userName) !=null){
                int num = (int)session.getAttribute(userName);
                session.setAttribute(userName,num);
            }else {
                session.setAttribute(userName,init);
            }
            request.getSession().setAttribute("USER_NAME",userName);
            request.getSession().setAttribute("NUM",session.getAttribute(userName));
            request.getRequestDispatcher("../WEB-INF/view/success.jsp").forward(request,response);
        }else {
            request.setAttribute("ERROR_INFO","<span style='color:red;'>用户名密码错误！</span>");
            request.getRequestDispatcher("../index.jsp").forward(request,response);
        }
    }else {
            request.setAttribute("ERROR_INFO","<span style='color:red;'>用户名密码错误！</span>");
            request.getRequestDispatcher("../index.jsp").forward(request,response);
    }
    }catch (Exception e){
        e.printStackTrace();
    }
//        request.getRequestDispatcher("WEB-INF/view/error.jsp").forward(request,response);
%>
</body>
</html>
