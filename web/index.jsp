<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/12
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>App管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style type="text/css">
        a {
            width: 200px !important;
            margin: 10px;
        }

        .login {
            width: 400px;
            /*大盒子居中*/
            margin: 200px auto;
            /*盒子中内容居中*/
            text-align: center;
        }

        html {
            background: url("${ctx}/static/img/index-background.jpg");
            background-size: cover;
        }
    </style>
</head>
<body>
<div class="login">
    <a href="${ctx}/backend/index" class="layui-btn">后台管理系统入口</a><br/>
    <a href="${ctx}/dev/toLogin" class="layui-btn">开发者平台入口</a>
</div>
</body>
</html>
