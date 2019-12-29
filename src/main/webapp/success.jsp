<%@ page import="com.darksouls.dao.UserDao" %>
<%@ page import="com.darksouls.dao.UserDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.darksouls.vo.Message" %>
<%@ page import="com.darksouls.vo.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--
  Created by IntelliJ IDEA.
  User: 李正阳
  Date: 2019/11/14
  Time: 0:57
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="user" class="com.darksouls.vo.User" ></jsp:useBean>
<jsp:useBean id="message" class="com.darksouls.vo.Message"></jsp:useBean>
<jsp:useBean id="Dao" class="com.darksouls.dao.UserDaoImpl"></jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="checkUserLevel.jsp"></jsp:include>
    登陆成功
    ${USER_NAME}访问登陆Servlet的次数${NUM}<br>
    <form action="/jsp/messagecommit.jsp">
        留言标题：<br>
        <input type="text" name="title" id="title"><br>
        添加留言：<br>
       <textarea name="message" id="" cols="30" rows="10"></textarea><br>
        <button id="finish" name="finish">提交留言</button>
    </form>
    <br>
    所有留言如下：<br>

    <%
        ArrayList<Message> arr ;
        arr = Dao.selectAllMessage();
        session.setAttribute("arr",arr);
    %>

    <c:forEach items="${arr}"  var="i">
        <output>用户名：</output>${i.user.name}<br>
        <output>标题：</output> ${i.title}<br>
        <output>内容:</output>${i.message}<br>
        <output>邮箱：</output>${i.user.mail}<br>
        <output>时间:</output>${i.cteate_date}<br>  <br>
    </c:forEach>


    <%!
        private int visit = 0;
    %>
    <%
        visit ++;
        application.setAttribute("VISIT",visit);
    %>
    本页面一共被访问了${VISIT}次
</body>
</html>
