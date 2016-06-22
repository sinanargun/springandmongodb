package com.javaSpring.model;

import com.mongodb.DBObject;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by nuvia on 20.06.2016.
 */
@Document
public class UserModel {

    @Id
    private ObjectId id;
    private String name;
    private String surName;
    private String phone;

    public UserModel(String name, String surName, String phone) {
        this.name = name;
        this.surName = surName;
        this.phone = phone;
    }

     public UserModel() {
    }

    public ObjectId getId() {
        return id;
    }

    public void setId(ObjectId id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurName() {
        return surName;
    }

    public void setSurName(String surName) {
        this.surName = surName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
