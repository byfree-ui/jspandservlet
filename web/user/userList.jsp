<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.xiaoxin.pojo.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 闫
  Date: 2020/3/22
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 用户信息列表</strong></div>
    <table class="table table-hover text-center">
        <tr>
            <th width="5%">UID</th>
            <th width="15%">用户名</th>
            <th width="10%">密码</th>
            <th width="10%">性别</th>
            <th width="10%">年龄</th>
            <th width="10%">出生日期</th>
            <th width="10%">操作</th>
        </tr>
        <%
            // 获取作用域中的用户数据
            List<User> lu = (ArrayList)request.getAttribute("lu");
            // 遍历
            for (int i = 0; i< lu.size(); i++) {
                String s = "女";
                if (lu.get(i).getSex().equals("0")) {
                    s = "男";
                }

        %>
                <tr>
                    <td width="5%"><%=lu.get(i).getUid()%></td>
                    <td width="5%"><%=lu.get(i).getUname()%></td>
                    <td width="15%"><%=lu.get(i).getPwd()%></td>
                    <td width="10%"><%=s%></td>
                    <td width="10%"><%=lu.get(i).getAge()%></td>
                    <td width="10%"><%=lu.get(i).getBirthday()%></td>
                    <td>
                        <div class="button-group">
                            <a class="button border-main" href="cateedit.html">
                                <span class="icon-edit"></span>
                                    修改
                            </a>
                            <a class="button border-red" href="javascript:void(0)" onclick="return del(1,2)">
                                <span class="icon-trash-o"></span>
                                删除
                            </a>
                        </div>
                    </td>
                </tr>
        <%
            }
        %>
    </table>
</div>
<script type="text/javascript">
    function del(id,mid){
        if(confirm("您确定要删除吗?")){

        }
    }
</script>
</body>
</html>
