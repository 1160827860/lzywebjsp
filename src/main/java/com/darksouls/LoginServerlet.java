package com.darksouls;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.util.StringUtils;
import sun.rmi.runtime.Log;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Properties;

/**
 * @author 李正阳 17060208112
 */
public class LoginServerlet  extends HttpServlet {
    static HashMap<String,Integer> LoginPool = new HashMap<String, Integer>();
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String userName = req.getParameter("name");
        String userPassword = req.getParameter("password");
        /**
         * 记录数据库连接信息
         */
//        String name = "root";
//        String password = "root";
//        String url = "jdbc:mysql://localhost:3306/guestbook?useSSL=false&serverTimezone=UTC";
//        String driverClassName = "com.mysql.cj.jdbc.Driver";
//        Connection conn = null;
        PreparedStatement prst = null;
        ResultSet rs = null;
        Connection conn = null;
        try {
//            Class.forName(driverClassName);
//            conn = DriverManager.getConnection(url,name,password);
            Properties properties = new Properties();
            properties.load(new FileInputStream("druid.properties"));
            DataSource ds = DruidDataSourceFactory.createDataSource(properties);
            conn = ds.getConnection();

            String sql = "SELECT password FROM user WHERE name = ?";
            prst = conn.prepareStatement(sql);
            prst.setString(1,userName);
            rs = prst.executeQuery();
            String sqlpassword = null;
            if(rs.next()){
                sqlpassword = rs.getString("password");
            }

            /**
             * 验证登陆
             */
            if(!StringUtils.isEmpty(userName)){
                if(StringUtils.equals(sqlpassword,userPassword)){
                    /**
                     * 添加session，以及访问次数
                     */
                    if(LoginPool.containsKey(userName)){
                        LoginPool.put(userName,LoginPool.get(userName) + 1);
                    }else {
                        LoginPool.put(userName,1);
                    }
                    req.getSession().setAttribute("USER_NAME",userName);
                    req.getSession().setAttribute("NUM",LoginPool.get(userName));

                    req.getRequestDispatcher("WEB-INF/view/success.jsp").forward(req,resp);
                }else {
                    req.setAttribute("ERROR_INFO","<span style='color:red;'>用户名密码错误！</span>");
                    req.getRequestDispatcher("index.jsp").forward(req,resp);
                }
            }else {
                req.setAttribute("ERROR_INFO","<span style='color:red;'>用户名密码错误！</span>");
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                if(rs != null){
                    rs.close();
                }
                if(prst != null){
                    prst.close();
                }
                if(conn !=null){
                    conn.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        req.getRequestDispatcher("WEB-INF/view/error.jsp").forward(req,resp);
    }
}
