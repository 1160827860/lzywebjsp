package com.darksouls.controller;


import com.alibaba.druid.util.StringUtils;
import com.darksouls.dao.UserDao;
import com.darksouls.dao.UserDaoImpl;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;


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
        UserDao userDao = new UserDaoImpl();
        try {
//            String sqlpassword =   userDao.SelectUserPassword(userName);
            int n = userDao.SelectUser(userName,userPassword);
            /**
             * 验证登陆
             */
            if(!StringUtils.isEmpty(userName)){
//                if(StringUtils.equals(sqlpassword,userPassword)){
                if(n == 1){
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
        }
        req.getRequestDispatcher("WEB-INF/view/error.jsp").forward(req,resp);
    }
}
