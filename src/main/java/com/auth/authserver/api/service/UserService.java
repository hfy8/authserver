package com.auth.authserver.api.service;


import com.auth.authserver.api.dao.UserDao;
import com.auth.authserver.api.pojo.UserLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    public UserLogin loadUserByUsername(String username) {
        return userDao.loadUserByUsername(username);
    }
}
