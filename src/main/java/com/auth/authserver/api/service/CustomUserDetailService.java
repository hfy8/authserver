package com.auth.authserver.api.service;


import com.auth.authserver.api.pojo.UserLogin;
import com.auth.authserver.api.pojo.roleEnity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 自定义UserDetailsService，为security提供认证需要的password和authorities
 */
@Service
public class CustomUserDetailService implements UserDetailsService {
    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserLogin user = userService.loadUserByUsername(username);
        //这里只是做个简单操作，实际使用数据库的话，根绝username查询用户实例，如果存在
        // 然后把user实例中的username，password，权限的set集合赋值给User（这里的User时security框架中的类）
        Set<GrantedAuthority> authorities = new HashSet<>();
        HashSet<roleEnity> roles = user.getRoles();
        for (roleEnity r : roles) {
            authorities.add(new SimpleGrantedAuthority(r.getRoleName()));

        }
        return new User(user.getUsername(), user.getPassword(), authorities);
    }
}
