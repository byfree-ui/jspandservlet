package com.xiaoxin.servlet;

import com.xiaoxin.dao.impl.UserDaoImpl;
import com.xiaoxin.pojo.User;
import com.xiaoxin.service.UserService;
import com.xiaoxin.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * 一个servlet统治全部的业务
 * @author 闫
 */
public class DataServlet extends BaseServlet {
    // 登陆处理
    public  void userLogin (HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 获取请求信息
        String uname = req.getParameter("uname");
        String pwd = req.getParameter("pwd");
        // 处理请求信息
        // 创建业务层对象
        UserService us = new UserServiceImpl();
        User u = us.getUserInfoService(uname, pwd);
        // 响应请求信息
        // 创建或者获取session对象
        HttpSession hs = req.getSession();
        if (u != null) { // 登陆成功
            // 将用户信息写入session
            hs.setAttribute("user", u);
            // 重定向到main.jsp
            resp.sendRedirect("main.jsp");
        } else {
            // 将登陆失败的标记添加到session当中
            hs.setAttribute("flag", "loginFalse");
            // 重定向到login.jsp
            resp.sendRedirect("login.jsp");
        }
    }
    // 退出处理
    public  void userOut (HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession hs = req.getSession();
        hs.invalidate();
        // 响应处理结果
        // 重定向
        resp.sendRedirect("login.jsp");
    }
    // 注册处理
    public  void userReg (HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 获取请求信息
        // 创建用户类
        User u = new User();
        u.setUname((String)req.getParameter("uname"));
        u.setAge(Integer.valueOf((String)req.getParameter("age")));
        u.setSex(((String)req.getParameter("sax")));
        u.setBirthday((String)req.getParameter("birthday"));
        u.setPwd((String)req.getParameter("pwd"));
        // 处理请求数据
        UserDaoImpl userDao = new UserDaoImpl();
        boolean b = userDao.insUser(u);
        // 响应请求信息
        HttpSession session = req.getSession();
        if (b) {
            // 创建用户成功
            session.setAttribute("flag", "regsc");
            resp.sendRedirect("login.jsp");
        } else {
            // 创建失败
            session.setAttribute("u", "false");
            resp.sendRedirect("reg.jsp");
        }
    }
}
