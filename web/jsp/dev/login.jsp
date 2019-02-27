<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/12
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>开发者登录</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
    <style type="text/css">
        html {
            background: url("${ctx}/static/img/index-background.jpg");
            background-size: 100% 100%;
            overflow-x: unset;
        }

        .content {
            width: 500px;
            margin: 200px auto;
            padding: 20px;
        }

        i {
            background: white;
            font-size: 35px !important;
        }

        i:nth-child(2) {
            margin-left: 223px;
        }

        i:nth-child(1) {
        }

        .hd {
            display: none;
        }
        img{
            margin-left: -110px;
        }
    </style>
</head>

<body>
<c:if test="${errMsg != null}">
    <script>
        alert('${errMsg}');
    </script>
</c:if>
<%
    request.removeAttribute("errMsg");
%>
<div class="layui-container content">
    <form action="${ctx}/dev/login" method="post" class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="devCode" required="required" lay-verify="username" placeholder="请输入用户名"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required="required" lay-verify="password" placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-inline">
                <input type="text" name="vcode" required="required" placeholder="请输入验证码"
                       autocomplete="off" class="layui-input">
                <br/>
                <pre><img src="${ctx}/tool/verifycode?time=" alt="验证码">              <input class="layui-btn" type="button" value="看不清?换一张" id="btn"></pre>
            </div>
            <i style="color: red;font-size: 12px!important;">${imageMess}</i>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-line">
                <i class="layui-icon">&#x1005;</i>
                <i class="layui-icon">&#xe639;</i>
                <button class="hd layui-btn" lay-submit lay-filter="formDemo">登录</button>
                <button type="reset" class="hd layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script src="${ctx}/static/js/jquery-3.3.1.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var layer = layui.layer;
        var form = layui.form;
        var layedit = layui.layedit;
        var laydate = layui.laydate;
        //
        form.verify({
            username: function (value) {
                if (value.length == 0) {
                    return "用户名不能为空";
                } else if (value.length < 6) {
                    return "用户名不能小于6个字符"
                }
            },
            password: function (value) {
                var regex = /\w{6,12}/;
                if (!regex.test(value)) {
                    return "密码必须6-12个字符";
                }
            }
        })
    })
    $(function () {
        var $i1 = $("i").eq(1);
        var $i2 = $("i").eq(2);
        var $vc=$("input[type='button']");
        $i1.click(function () {
            $("button").eq(0).click();
        })
        $i2.click(function () {
            $("button").eq(1).click();
        })
        //点击更换验证码
        $vc.click(function () {
             $("pre img").get(0).src="${ctx}/tool/verifycode?time="+new Date().getMilliseconds();
        })
    })
</script>
</body>
</html>
