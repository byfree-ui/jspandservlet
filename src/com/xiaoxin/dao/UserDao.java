package com.xiaoxin.dao;

import com.xiaoxin.pojo.User;

public interface UserDao {
    /**
     * 查询用户
     * @param uname
     * @param pwd
     * @return
     */
    User getUserInfoDao(String uname, String pwd);

    /**
     * 插入用户
     * @param user
     * @return
     */
    boolean insUser(User user);
}
