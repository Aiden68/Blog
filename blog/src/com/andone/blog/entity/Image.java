package com.andone.blog.entity;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Image implements Serializable{

	private int id;    //ͼƬID
    private String name;    //ͼƬ��
    private String url;    //ͼƬURL
    private Date date;    //�ϴ�ʱ��

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
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }

}
