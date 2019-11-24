package com.darksouls.controller;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.darksouls.dao.UserDao;
import com.darksouls.dao.UserDaoImpl;
import com.darksouls.vo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username = req.getParameter("name");
        String userpassword = req.getParameter("password");
        String email = req.getParameter("mail");
        UserDao userDao = new UserDaoImpl();
        if(userDao.SelectUser(username,userpassword) == 0){
            User user = new User(username,userpassword,email);
            userDao.InsertUser(user);
            req.getRequestDispatcher("WEB-INF/view/success.jsp").forward(req,resp);
        }else {
            req.getRequestDispatcher("WEB-INF/view/error.jsp").forward(req,resp);
        }
    }
}
