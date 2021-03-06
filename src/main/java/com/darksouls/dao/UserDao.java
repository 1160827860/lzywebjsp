package com.darksouls.dao;

import com.darksouls.vo.Message;
import com.darksouls.vo.User;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.util.ArrayList;
@Component
public interface UserDao {

    String selectUserPassword(String name);

    void addUser(User user);

    int selectUser(String name,String password);

     int selectUserId(String name);

    public void insertMessage(String message, int id, String title, Date time);

    /**
     * 查询所有留言
     */
    ArrayList<Message> selectAllMessage();

    /**
     * 查询是谁发送的
     */
    User selectAllUser(int id);
}
