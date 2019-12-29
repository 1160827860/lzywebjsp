<%@ page import="com.darksouls.vo.BookVO" %>
<%@ page import="java.util.HashMap" %>
  Created by IntelliJ IDEA.
  User: 李正阳
  Date: 2019/12/23
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>书城页面</title>
    <style>
        #frameContentLeft
        {
            top: 0;
            left: 0;
            height: 100%;
            width: 50%;
            vertical-align: center;
        }
        #frameContentRight
        {
            left: 300px;
            top: 0;
            height: 100%;
            width: 100%;
            right: 0;
            bottom: 0;
            background: #fff;
        }
        #main{
            left: 300px;
            top: 0;
            height: 100%;
            width: 75%;
            margin-left: 25%;
        }
    </style>
</head>
<body>
    <%--模拟将书籍信息已经获取，放在了session中--%>
    <%
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HashMap<String,BookVO> books = new HashMap<>();
        books.put("java",new BookVO(0,"核心技术","凯S.霍斯特曼",100,"机械工业出版社","Java领域*有影响力和价值的著作之一，由拥有20多年教学与研究经验的资深Java技术专家撰写(获Jolt大奖)，与《Java编程思想》齐名，10余年全球畅销不衰，广受好评。第10版根据Java SE 8全面更新，同时修正了第9版中的不足，系统全面讲解了Java语言的核心概念、语法、重要特性和开发方法，包含大量案例，实践性强。 　　本书共14章。第1章概述Java语言与其他程序设计语言不同的性能；第2章讲解如何下载和安装JDK及本书的程序示例；第3章介绍变量、循环和简单的函数；第4章讲解类和封装；第5章介绍继承；第6章解释接口和内部类；第7章讨论异常处理，并给出大量实用的调试技巧；第8章概要介绍泛型程序设计；第9章讨论Java平台的集合框架；第10章介绍GUI程序设计，讨论如何建立窗口、如何在窗口中绘图、如何利用几何图形绘图、如何采用多种字体格式化文本，以及如何显示图像；第11章详细讨论抽象窗口工具包的事件模型；第12章详细讨论Swing GUI工具包；第13章介绍如何将程序部署为应用或applet；第14章讨论并发。本书最后还有一个附录，其中列出了Java语言的保留字。", "pic/javacore.jpg"));
        books.put("thread",new BookVO(1,"实战Java高并发程序设计（第2版）","葛一鸣 ",60,"电子工业出版社","在单核CPU时代，单任务在一个时间点只能执行单一程序，随着多核CPU的发展，并行程序开发变得尤为重要。本书主要介绍基于Java的并行程序设计基础、思路、方法和实战。一，立足于并发程序基础，详细介绍Java进行并行程序设计的基本方法。第二，进一步详细介绍了JDK对并行程序的强大支持，帮助读者快速、稳健地进行并行程序开发。第三，详细讨论了“锁”的优化和提高并行程序性能级别的方法和思路。第四，介绍了并行的基本设计模式，以及Java 8/9/10对并行程序的支持和改进。第五，介绍了高并发框架Akka的使用方法。第六，详细介绍了并行程序的调试方法。第七，分析Jetty代码并给出一些其在高并发优化方面的例子。本书内容丰富，实例典型，实用性强，适合有一定Java基础的技术开发人员阅读。", "pic/thread.jpg"));
        books.put("think",new BookVO(2,"java编程思想"," Bruce Eckel ",120,"机械工业出版社","《计算机科学丛书：Java编程思想（第4版）》赢得了全球程序员的广泛赞誉，即使是晦涩的概念，在BruceEckel的文字亲和力和小而直接的编程示例面前也会化解于无形。从Java的基础语法到高级特性（深入的面向对象概念、多线程、自动项目构建、单元测试和调试等），本书都能逐步指导你轻松掌握。", "pic/think.jpg"));
        books.put("thread2",new BookVO(3,"Java多线程编程核心技术","高洪岩",46,"机械工业出版社","为什么要写这本书早在几年前笔者就曾想过整理一份与Java多线程有关的稿件，因为市面上所有的Java书籍都是以一章或两章的篇幅介绍多线程技术，并没有完整地覆盖该技术的知识点，但可惜，苦于当时的时间及精力有限，一直没有达成所愿。 也许是注定的安排，我目前所在的单位是集技术与教育为一体的软件类企业。我在工作中发现很多学员在学习完JavaSE/JavaEE之后想对更深入的技术进行探索，比如在对大数据、分布式、高并发类的专题进行攻克时，立即遇到针对java.lang包中Thread类的学习，但Thread类的学习并不像JDBC那样简单，学习多线程会遇到太多的问题、弯路以及我们所谓的“坑”，为了带领学员在技术层面上进行更高的追求，我将多线程的技术点以教案的方式进行整理，在课堂上与同学们一起学习、交流，同学们反响也非常热烈。", "pic/threadtow.jpg"));
        request.getSession().setAttribute("books",books);
    %>
    <div id="frameContentLeft">
    <table width="50%"   border="0" cellspacing="1" cellpadding="0" bgcolor="#f5f5f5">
        <c:forEach items="${books}" var="book">
                <tr>
                    <td><img width="200px" height="300px" src="${book.value.picPath}"></td>
                </tr>
                <tr>
                    <td>书名：</td><td><button  onclick="clickit(${book.value.id})">${book.value.name}</button></td>
                </tr>
                <tr>
                    <td>书籍编号：</td><td>${book.value.id}</td>
                </tr>
                <tr>
                    <td>作者：</td><td>${book.value.article}</td>
                </tr>
                <tr>
                    <td>价格：</td><td>${book.value.price}￥</td>
                </tr>
                <tr>
                    <td>出版社：</td><td>${book.value.publishHouse}</td>
                </tr>
            <br>
        </c:forEach>
    </table>
    </div>
    <div id="main">
    </div>
    <script type="text/javascript">
        function clickit(id) {
            if (id == 0) {
                // setCookie(name,java);
                document.cookie = 'name=java;path=/';
            }else if(id == 1){
                // setCookie(name,thread);
                document.cookie = 'name=thread;path=/';
            }else if(id == 2){
                // setCookie(name,think);
                document.cookie = 'name=think;path=/';
            }else {
                // setCookie(name,thread2);
                document.cookie = 'name=thread2;path=/';
            }
            document.getElementById("main").innerHTML = '<iframe  id="frameContentRight"   src="bookdetails.jsp"></iframe>';
        }
    </script>
</body>
</html>
