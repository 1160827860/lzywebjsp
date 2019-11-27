package com.darksouls.vo;

public class Message {
    private int user_id;
    private String message;
    private String title;
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
