<%--
  Created by IntelliJ IDEA.
  User: 李正阳
  Date: 2019/12/22
  Time: 23:36
  To change this template use File | Settings | File Templates.
  Servlet课后作业
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>注册确定页面</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        request.getSession().setAttribute("fistname",request.getParameter("fistname"));
        request.getSession().setAttribute("lastname",request.getParameter("lastname"));
        request.getSession().setAttribute("address",request.getParameter("address"));
        request.getSession().setAttribute("emailaddress",request.getParameter("emailaddress"));
        String[] hobby = request.getParameterValues("hobby");
        request.getSession().setAttribute("hobby",hobby);
        request.getSession().setAttribute("question",request.getParameter("question"));
        request.getSession().setAttribute("answer",request.getParameter("answer"));
    %>
    用户姓名：${fistname}${lastname}<br>
    地址：${address}<br>
    email：${emailaddress}<br>
    爱好:<c:forEach items="${hobby}" var="p">
        ${p},
    </c:forEach>
    密码问题：${question}<br>
    答案${answer}<br>
    <button ><a href="/html_homework/RegSuccess.html">确定注册</a></button>
</body>
</html>
