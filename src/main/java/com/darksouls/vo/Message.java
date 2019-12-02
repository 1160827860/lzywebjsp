package com.darksouls.vo;

import java.util.Date;

public class Message {
    private int user_id;
    private String message;
    private String title;
    private Date cteate_date;

    public Date getCteate_date() {
        return cteate_date;
    }

    public void setCteate_date(Date cteate_date) {
        this.cteate_date = cteate_date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Message() {
    }

    public Message(int user_id, String message, String title) {
        this.user_id = user_id;
        this.message = message;
        this.title = title;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }



}
