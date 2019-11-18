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

out对象可以将数据输出到客户端、还可以将网页用out输出
request 对象获取用户发送的数据
resonse对象可以用来重定向

# execute和executeQuery的区别
executeQuery只能用于查询execute可以执行insert、update、delete

# 使用数据源

```java
Properties properties = new Properties();
properties.load(new FileInputStream("druid.properties"));
DataSource ds = DruidDataSourceFactory.createDataSource(properties);
conn = ds.getConnection();
```
