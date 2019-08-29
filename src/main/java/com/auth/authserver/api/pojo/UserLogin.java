package com.auth.authserver.api.pojo;

import lombok.Data;

import java.util.HashSet;

/**
 * @ClassName Account
 * @Date 2019/4/11 16:56
 * @Auther bianjie
 **/
@Data
public class UserLogin {
    private String id;
    private String username;
    private String password;
    private int status;
    private HashSet<roleEnity> roles;
}
