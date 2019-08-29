package com.auth.authserver.api.pojo;

import lombok.Data;

import java.sql.Date;

@Data
public class UserEto {
    private String uId;
    private String name;
    private String mdpd;
    private String account;
    private Date bornday;
    private Date Rdate;
    private String sex;
    private String job;
    private String type;
    private String Code;
}
