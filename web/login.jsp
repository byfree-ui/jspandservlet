<%--
  Created by IntelliJ IDEA.
  User: 闫
  Date: 2020/3/16
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;

    Object user = session.getAttribute("user");
    if (user != null) {
        response.sendRedirect("/main.jsp");
    }
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
            <form action="data" method="post">
                <%--声明请求处理方法--%>
                <input type="hidden" name="method" value="userLogin">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top"><h1>小新后台管理中心</h1></div>
                    <%--声明java代码块--%>
                    <%
                        // 获取session中的标记
                        Object obj = session.getAttribute("flag");
                        if ("loginFalse".equals(obj)) {
                    %>
                            <div style="text-align: center;color: red">用户名或者密码错误</div>
                    <%
                            session.invalidate();
                        } else if ("regsc".equals(obj)) {
                    %>
                            <script type="text/javascript"> alert("注册成功");</script>
                    <%
                        }
                    %>
                    <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="uname" placeholder="登录账号" data-validate="required:请填写账号" />
                                <span class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="input input-big" name="pwd" placeholder="登录密码" data-validate="required:请填写密码" />
                                <span class="icon icon-key margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field">
                                <input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                                <img src="images/passcode.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">

                            </div>
                        </div>
                    </div>
                    <div style="padding:30px 30px 5px 30px">
                        <input type="submit" class="button button-block bg-main text-big input-big" value="登录">
                    </div>
                    <div style="font-size: 16px;text-align: right;padding: 25px 35px 25px 25px;">
                        <a href="reg.jsp">注册</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
