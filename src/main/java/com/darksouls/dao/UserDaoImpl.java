package com.darksouls.dao;

import com.darksouls.util.DuridJdbc;
import com.darksouls.vo.Message;
import com.darksouls.vo.User;

import java.security.interfaces.RSAKey;
import java.sql.*;
import java.util.ArrayList;


public  class UserDaoImpl implements UserDao {

    /**
     * 查询userName用户密码
     * @param userName 被查询用户的用户名
     * @return 该用户的密码
     */
    public String selectUserPassword(String userName) {
        Connection conn = DuridJdbc.getConnection();
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
    public void insertUser(User user) {
        Connection conn = DuridJdbc.getConnection();
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

    /**
     * 查询满足此账号记录条数
     * @param name 账号
     * @param password 密码
     * @return 记录数量
     */
    public int selectUser(String name, String password) {
        Connection conn = DuridJdbc.getConnection();
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
    /**
     * 查询用户的id
     */
    public int selectUserId(String name){
        Connection conn = DuridJdbc.getConnection();
        PreparedStatement prst ;
        ResultSet rs;
        String sql = "SELECT id AS user_id FROM user WHERE name = ?";
        try {
            prst = conn.prepareStatement(sql);
            prst.setString(1,name);
            rs = prst.executeQuery();
            if(rs.next()){
                return rs.getInt("user_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    /**
     * 向message表中插入消息
     * 由messageconmmit.jsp中调用
     * @param message 留言内容
     * @param id 用户表中的id
     */
    public void insertMessage(String message, int id, String title, Date time){
        Connection conn = DuridJdbc.getConnection();
        PreparedStatement prst ;
        String sql = "INSERT INTO message(user_id,text,title,create_time) VALUES(?,?,?,?)";
        try {
            prst = conn.prepareStatement(sql);
            prst.setInt(1,id);
            prst.setString(2,message);
            prst.setString(3,title);
            prst.setDate(4,time);
            prst.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询Message表所有的消息
     * @return @param ArrayList res 返回消息集合
     */
    public ArrayList<Message> selectAllMessage() {
        Connection conn  = DuridJdbc.getConnection();
        PreparedStatement prst;
        ResultSet rs;
        String sql = "SELECT user_id ,text,title,create_time FROM message";
        ArrayList<Message> res = new ArrayList<Message>();
        try {
            prst = conn.prepareStatement(sql);
            rs = prst.executeQuery();
            while (rs.next()){
                Message temp = new Message();
                temp.setUser_id(rs.getInt("user_id"));
                temp.setMessage(rs.getString("text"));
                temp.setTitle(rs.getString("title"));
                temp.setCteate_date(rs.getDate("create_time"));
                res.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }



    /**
     * 查询是谁发送的
     */
    public User selectAllUser(int id) {
        Connection con = DuridJdbc.getConnection();
        String sql = "SELECT * FROM user WHERE id = ?";
        ResultSet rs ;
        User user = new User();
        try {
            PreparedStatement prst = con.prepareStatement(sql);
            prst.setInt(1, id);
            rs = prst.executeQuery();
            if(rs.next()){
                user.setMail(rs.getString("mail"));
                user.setName(rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }





}
