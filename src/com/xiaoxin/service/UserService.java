package com.xiaoxin.service;

import com.xiaoxin.pojo.User;

public interface UserService {
    /**
     * 查询用户
     * @param uname
     * @param pwd
     * @return
     */
    User getUserInfoService(String uname, String pwd);

    /**
     * 插入数据
     * @param u
     * @return
     */
    boolean insertUser(User u);
}
