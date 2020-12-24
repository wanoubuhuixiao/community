package com.ares.design.domain;

import lombok.Data;

@Data
public class User {
    private int id;
    private String name;
    private String account;
    private String password;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name +
                ", account=" + account +
                ", password='" + password +
                '}';
    }
}
