package com.xiaoxin.dao.impl;

import com.xiaoxin.dao.UserDao;
import com.xiaoxin.pojo.User;
import com.xiaoxin.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {

    @Override
    public User getUserInfoDao(String uname, String pwd) {
        // 声明jdbc变量
        Connection conn = null;
        PreparedStatement pstmt =null;
        ResultSet rs = null;
        // 声明变量
        User u = null;
        try {
            // 创建连接
            conn = DBUtil.getConnection();
            // 创建SQL命令
            String sql = "select * from t_user where uname=? and pwd=?";
            // 创建SQL命令对象
            pstmt = conn.prepareStatement(sql);
            // 给占位符赋值
            pstmt.setString(1, uname);
            pstmt.setString(2, pwd);
            // 执行SQL命令
            rs = pstmt.executeQuery();
            // 遍历
            while (rs.next()) {
                // 给变量赋值
                u = new User();
                u.setUid(rs.getInt("uid"));
                u.setUname(rs.getString("uname"));
                u.setPwd(rs.getString("pwd"));
                u.setSex(rs.getString("sex"));
                u.setAge(rs.getInt("age"));
                u.setBirthday(rs.getString("birthday"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关资源
            DBUtil.closeAll(rs, pstmt, conn);
        }

        return u;
    }

    @Override
    public boolean insUser(User u) {
        // 声明jdbc变量
        Connection conn = null;
        PreparedStatement pstmt =null;
        ResultSet rs = null;
        // 声明变量
        // 创建连接
        conn = DBUtil.getConnection();
        // 创建SQL命令
        String sql = "insert into t_user values(default, ?, ?, ?, ?, ?)";
        // 创建SQL命令对象
        try {
            pstmt = conn.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // 给占位符赋值
        return DBUtil.executeDML(sql, u.getUname(), u.getPwd(), u.getSex(), u.getAge(), u.getBirthday()) > 0;
    }

    @Override
    public List<User> selUserInfoDao() {
        ArrayList<User> lu = new ArrayList<>();
        // 声明jdbc变量
        Connection conn = null;
        PreparedStatement pstmt =null;
        ResultSet rs = null;
        try {
            // 创建连接
            conn = DBUtil.getConnection();
            // 创建SQL命令
            String sql = "select * from t_user";
            // 创建SQL命令对象
            pstmt = conn.prepareStatement(sql);
            // 执行SQL命令
            rs = pstmt.executeQuery();
            // 遍历
            while (rs.next()) {
                // 给变量赋值
                User u = new User();
                u.setUid(rs.getInt("uid"));
                u.setUname(rs.getString("uname"));
                u.setPwd(rs.getString("pwd"));
                u.setSex(rs.getString("sex"));
                u.setAge(rs.getInt("age"));
                u.setBirthday(rs.getString("birthday"));
                lu.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关资源
            DBUtil.closeAll(rs, pstmt, conn);
        }
        return lu;
    }
}
