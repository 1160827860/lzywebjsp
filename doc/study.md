# jsp 的七个内置对象：
out 对象：负责管理对客户端的输出
request 对象：负责得到客户端的请求信息
response 对象：负责向客户端发送响应
session 对象：负责保存同一客户端一次会话过程中的一些信息
application对象 ： 表示整个应用的环境信息
exception 对象：表示页面上发生的异常，可以通过它获得页面异常信息
page 对象：表示的是当前jsp页面本身，就像java类中定义的this一样
pageContext 对象：表示的是此jsp的上下文
config对象：表示此jsp的ServletConfig

# 常用对象的基本用法
（1）out对象可以向客户端发送文本数据，所以有常用的以下两个方法：
       void print();
       void println();
     （2）request对象主要获取客户端发送的数据：
       主要是获取表单提交上来的数据：
       Object getParameter();
     （3）response对象主要是用来跳转： 
       sendRedirect();方法用来重定向
       原理是让客户端去请求资源，所以无法带着数据跳转
       forward()方法表示服务器去请求资源，可以带着数据跳转
     （4）session负责保存同一客户端一次会话过程中的一些信息
       主要用法就是将某些数据存储在Session中，例如购物车或者验证
（5）application可以被多个客户端访问同一个对象
	Object application.getAttribute(String name);
WEB-INF 只能跳转不能直接访问

# execute和executeQuery的区别
executeQuery只能用于查询execute可以执行insert、update、delete

# 使用数据源

```java
Properties properties = new Properties();
properties.load(new FileInputStream("druid.properties"));
DataSource ds = DruidDataSourceFactory.createDataSource(properties);
conn = ds.getConnection();
```
 # 检查权限：
 在WEB-INF 中的内容是无法直接访问的只有跳转才能进入。
