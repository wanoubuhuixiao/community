package com.ares.design.domain;

import lombok.Data;

import java.util.Date;

@Data
public class User {
    private Integer userId;
    private String userName;
    private String userPassword;
    private String userEmail;
    private Integer userLevel;
    private String userAvatar;
    private Date userRegisterTime;
    private Date userLastLoginTime;
    private Integer userStatus;

    @Override
    public String toString() {
        return "User{" +
                "id=" + userId +
                ", name='" + userName +
                ", password=" + userPassword +
                ", Email='" + userEmail +
                '}';
    }
}
