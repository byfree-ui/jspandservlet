package com.xiaoxin.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

public abstract class BaseServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 编码
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        // 获取方法名称
        String method = req.getParameter("method");
        // 灵魂反射动态执行方法
        try {
            // 1. 获取类的class对象
            Class<? extends BaseServlet> clazz = this.getClass();
            // 2. 获取要调用的方法的对象
            Method m = clazz.getMethod(method, HttpServletRequest.class, HttpServletResponse.class);
            // 3. 执行方法
            m.invoke(this, req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
