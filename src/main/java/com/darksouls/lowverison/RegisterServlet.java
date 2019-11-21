package com.darksouls.lowverison;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
//        String name = "root";
//        String password = "root";
//        String url = "jdbc:mysql://localhost:3306/guestbook?useSSL=false&serverTimezone=UTC";
//        String driverClassName = "com.mysql.cj.jdbc.Driver";
        Connection conn = null;
        PreparedStatement prst = null;
        String username = req.getParameter("name");
        String userpassword = req.getParameter("password");
        String email = req.getParameter("mail");
        try {
//            Class.forName(driverClassName);
//            conn= DriverManager.getConnection(url,name,password);

            Properties properties = new Properties();
            properties.load(new FileInputStream("druid.properties"));
            DataSource ds = DruidDataSourceFactory.createDataSource(properties);
            conn = ds.getConnection();

            String sql = "INSERT INTO user(name,password,mail) VALUES ( ?,?,?)";
            prst = conn.prepareStatement(sql);
            prst.setString(1,username);
            prst.setString(2,userpassword);
            prst.setString(3,email);
            prst.execute();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                if(prst != null){
                    prst.close();
                }
                if(conn !=null){
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
