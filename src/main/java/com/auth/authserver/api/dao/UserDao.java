package com.auth.authserver.api.dao;


import com.auth.authserver.api.pojo.UserLogin;
import com.auth.authserver.api.pojo.roleEnity;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserDao {
    @Select(" select u.id,username,password,status from user u left join user_role ur on u.id=ur.user_id" +
            " where username = #{username}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "username", property = "username"),
            @Result(column = "password", property = "password"),
            @Result(column = "status", property = "status"),
            @Result(column = "id", property = "roles", many = @Many(select = "com.auth.authserver.api.dao.UserDao.loadUserRoles", fetchType = FetchType.LAZY)),


    })
    UserLogin loadUserByUsername(String username);

    @Select(" select role_id,name as role_name from user_role ur left join role r on ur.role_id=r.id" +
            " where ur.user_id = #{id}")
    @ResultType(roleEnity.class)
    List<roleEnity> loadUserRoles(String id);
}
