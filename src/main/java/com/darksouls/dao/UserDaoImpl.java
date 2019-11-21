package com.darksouls.dao;

import com.darksouls.util.DuridJdbc;
import com.darksouls.vo.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDaoImpl implements UserDao {
    private final Connection conn = DuridJdbc.getConnection();
    /**
     * 查询userName用户密码
     * @param userName 被查询用户的用户名
     * @return 该用户的密码
     */
    public String SelectUserPassword(String userName) {
        String sql = "SELECT password FROM user WHERE name = ?";
        PreparedStatement prst = null;
        ResultSet rs = null;
        try {
            prst = conn.prepareStatement(sql);
            prst.setString(1,userName);
            rs = prst.executeQuery();
            String sqlpassword = null;
            if(rs.next()){
                sqlpassword = rs.getString("password");
            }
            return sqlpassword;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * '注册时插入用户信息
     * @param user 用户的实体类
     */
    public void InsertUser(User user) {
        PreparedStatement prst = null;
        ResultSet rs = null;
        try {
            String sql = "INSERT INTO user(name,password,mail) VALUES ( ?,?,?)";
            prst = conn.prepareStatement(sql);
            prst.setString(1,user.getName());
            prst.setString(2,user.getPassword());
            prst.setString(3,user.getMail());
            prst.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public int SelectUser(String name, String password) {
        PreparedStatement prst ;
        ResultSet rs ;
        try {
            String sql = "SELECT COUNT(*) AS TOTALUSER  FROM user WHERE name = ? AND password = ?";
            prst = conn.prepareStatement(sql);
            prst.setString(1,name);
            prst.setString(2,password);
            rs = prst.executeQuery();
            int n = -1;
            if(rs.next()) {
                n = rs.getInt("TOTALUSER");
            }
            return n;
        }catch (Exception e){
            e.printStackTrace();
        }
      return -1;
    }
}
