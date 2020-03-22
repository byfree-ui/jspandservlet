<%--
  Created by IntelliJ IDEA.
  User: 闫
  Date: 2020/3/20
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>注册</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script type="text/javascript">
        $(function () {
            // 给男span添加单机事件
            $("#man").click(function () {
                $("#manSpan").addClass("icon-check");
                $("#womanSpan").removeClass("icon-check");
            });
            // 给女span添加单机事件
            $("#woman").click(function () {
                $("#womanSpan").addClass("icon-check");
                $("#manSpan").removeClass("icon-check");
            })
        })
        <%
            String u = null;
            if (session.getAttribute("u") != null) {
                u = (String) session.getAttribute("u");
            }
            if ("false".equals(u)) {
        %>
                alert("注册失败!")
        <%
                session.invalidate();
            }
        %>
    </script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 用户注册</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="data">
            <input type="hidden" name="method" value="userReg">
            <div class="form-group">
                <div class="label">
                    <label for="uname">用户名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" id="uname" name="uname" size="50" placeholder="请输入用户名"
                           data-validate="required:请输入用户名"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="pwd">新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="pwd" name="pwd" size="50" placeholder="请输入密码"
                           data-validate="required:请输入新密码,length#>=5:密码不能小于5位"/>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="rpwd">确认新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="rpwd" name="rpwd" size="50" placeholder="请再次输入新密码"
                           data-validate="required:请再次输入新密码,repeat#pwd:两次输入的密码不一致"/>
                </div>
            </div>
            <%--性别--%>
            <div  class="form-group">
                <div class="label">
                     <label>性别：</label>
                </div>
                <div class="field">
                    <div class="button-group radio">
                        <label class="button active">
                            <span class="icon-check" id="manSpan"></span>
                            <input name="sax" id="man" value="0" type="radio" checked="checked">男
                         </label>
                        <label class="button active">
                             <span class="" id="womanSpan"></span>
                             <input id="woman" name="sax" value="1"  type="radio">女
                        </label>
                    </div>
                 </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="age">年龄：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" id="age" name="age" size="50" placeholder="请输入年龄"
                           data-validate="required:请输入年龄,length#<=3:输入正确的年龄"/>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label for="birthday">出生日期：</label>
                </div>
                <div class="field">
                    <input type="date" class="input w50" id="birthday" name="birthday" size="50"/>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
