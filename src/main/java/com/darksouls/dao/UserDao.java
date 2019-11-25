package com.darksouls.dao;

import com.darksouls.vo.Message;
import com.darksouls.vo.User;

import java.util.ArrayList;

public interface UserDao {

    String SelectUserPassword(String name);

    void InsertUser(User user);

    int SelectUser(String name,String password);

     int SelectUserId(String name);

    void InsertMessage(String message,int id);

    /**
     * 查询所有留言
     */
    ArrayList<Message> SelectAllMessage();
}
