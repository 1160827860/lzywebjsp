<%@ page import="java.util.HashMap" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %><%--
  Created by IntelliJ IDEA.
  User: 李正阳
  Date: 2019/12/24
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    HashMap<String,String> books ;
    books = (HashMap<String,String>)request.getSession().getAttribute("books");
    Cookie[] cookies =request.getCookies();
    String p =null;
    if(cookies != null && cookies.length > 0){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals( "name")){
                p = cookie.getValue();
                break;
            }
        }
    }
    request.getSession().setAttribute("n",books.get(p));
%>

<table width="100%"   border="0" cellspacing="1" cellpadding="0" bgcolor="#f5f5f5">
        <tr>
            <td><img width="200px" height="300px" src="${n.picPath}"></td><br>
        </tr>
        <tr>
            <td>书名：</td><td>${n.name}</td>
        </tr>
        <tr>
            <td>书籍编号：</td><td>${n.id}</td>
        </tr>
        <tr>
            <td>作者：</td><td>${n.article}</td>
        </tr>
        <tr>
            <td>价格：</td><td>${n.price}￥</td>
        </tr>
        <tr>
            <td>出版社：</td><td>${n.publishHouse}</td>
        </tr>
        <tr>
            <td>书籍介绍：</td><td>${n.content}</td>
        </tr>
</table>

</body>
</html>
