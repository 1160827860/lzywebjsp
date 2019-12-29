package com.darksouls.controller;

import com.alibaba.druid.util.StringUtils;
import com.darksouls.dao.UserDao;
import com.darksouls.dao.UserDaoImpl;
import com.darksouls.vo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
@Controller
public class UserController {
    static HashMap<String, Integer> LoginPool = new HashMap<String, Integer>();


    @RequestMapping("/login")
    public void login(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String userName = req.getParameter("name");
        String userPassword = req.getParameter("password");
        UserDao userDao = new UserDaoImpl();
        try {
            int n = userDao.selectUser(userName, userPassword);
            /**
             * 验证登陆
             */
            if (!StringUtils.isEmpty(userName)) {
//                if(StringUtils.equals(sqlpassword,userPassword)){
                if (n == 1) {
                    /**
                     * 添加session，以及访问次数
                     */
                    if (LoginPool.containsKey(userName)) {
                        LoginPool.put(userName, LoginPool.get(userName) + 1);
                    } else {
                        LoginPool.put(userName, 1);
                    }
                    req.getSession().setAttribute("USER_NAME", userName);
                    req.getSession().setAttribute("NUM", LoginPool.get(userName));

                    req.getRequestDispatcher("WEB-INF/view/success.jsp").forward(req, resp);
                } else {
                    req.setAttribute("ERROR_INFO", "<span style='color:red;'>用户名密码错误！</span>");
                    req.getRequestDispatcher("index.jsp").forward(req, resp);
                }
            } else {
                req.setAttribute("ERROR_INFO", "<span style='color:red;'>用户名密码错误！</span>");
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
//        req.getRequestDispatcher("WEB-INF/view/error.jsp").forward(req,resp);
    }
    @RequestMapping("/register")
    public void register(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username = req.getParameter("name");
        String userpassword = req.getParameter("password");
        String email = req.getParameter("mail");
        UserDao userDao = new UserDaoImpl();
        if(userDao.selectUser(username,userpassword) == 0){
            User user = new User(username,userpassword,email);
            userDao.addUser(user);
            req.getRequestDispatcher("WEB-INF/view/success.jsp").forward(req,resp);
        }else {
            req.getRequestDispatcher("WEB-INF/view/error.jsp").forward(req,resp);
        }
    }
}

