package com.ares.design.dto;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
public class UserDto {
    @NotNull
    @NotEmpty
    private String userName;
    @NotEmpty
    @NotNull
    @Size(min = 6,max = 20)
    private String userPassword;
    @NotEmpty
    @NotNull
    private String userRePassword;
    private String userEmail;
    private Integer userStatus;
}
