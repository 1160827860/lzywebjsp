package com.darksouls.dao;

import com.darksouls.vo.User;

public interface UserDao {

    String SelectUserPassword(String name);

    void InsertUser(User user);

    int SelectUser(String name,String password);
}
