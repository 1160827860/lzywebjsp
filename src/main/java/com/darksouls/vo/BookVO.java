package com.darksouls.vo;

public class BookVO {

    int id;
    String name;
    String article;
    int price;
    String publishHouse;
    String content;
    String picPath;

    public String getPublishHouse() {
        return publishHouse;
    }

    public void setPublishHouse(String publishHouse) {
        this.publishHouse = publishHouse;
    }

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public BookVO() {
    }

    public BookVO(int id, String name, String article, int price, String publishHouse, String content, String picPath) {
        this.id = id;
        this.name = name;
        this.article = article;
        this.price = price;
        this.publishHouse = publishHouse;
        this.content = content;
        this.picPath = picPath;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

}
