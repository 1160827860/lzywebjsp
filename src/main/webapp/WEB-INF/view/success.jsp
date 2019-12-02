<%@ page import="com.darksouls.dao.UserDao" %>
<%@ page import="com.darksouls.dao.UserDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.darksouls.vo.Message" %>
<%@ page import="com.darksouls.vo.User" %><%--
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
        UserDao dao = new UserDaoImpl();
        ArrayList<Message> arr ;
        arr = dao.selectAllMessage();
        User use;
        for(int i = 0;i < arr.size();i++){
            Message temp = arr.get(i);
             use = dao.selectAllUser(temp.getUser_id());
           out.println("用户名：" + use.getName() +"<br>");
          out.println("标题：" + temp.getTitle()+"<br>");
            out.println("内容：" + temp.getMessage()+"<br>");
          out.println("邮箱：" + use.getMail()+"<br>");
            out.println("时间：" + temp.getCteate_date()+"<br>");
            out.println("<br>");
        }
    %>
    <br>
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
