package com.xiaoxin.service.impl;

import com.xiaoxin.dao.UserDao;
import com.xiaoxin.dao.impl.UserDaoImpl;
import com.xiaoxin.pojo.User;
import com.xiaoxin.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {

    // 创建dao层对象
    UserDao ud = new UserDaoImpl();

    /**
     * 查询用户
     * @param uname
     * @param pwd
     * @return
     */
    @Override
    public User getUserInfoService(String uname, String pwd) {
        // 处理登陆业务
        return ud.getUserInfoDao(uname, pwd);
    }

    /**
     *
     * @param u
     * @return
     */
    @Override
    public boolean insertUser(User u) {
        return ud.insUser(u);
    }

    @Override
    public List<User> selUserInfoService() {
        return ud.selUserInfoDao();
    }


}
