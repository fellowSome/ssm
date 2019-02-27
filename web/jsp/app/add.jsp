<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>App信息管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <script src="${ctx}/static/js/jquery-3.3.1.js"></script>
    <style>
        .layui-side {
            overflow-x: unset !important;
        }
    </style>
</head>
<body class="layui-layout-body">
<%@include file="header.jsp" %>
<div class="layui-body" style="top:0px;">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <!--表单-->
        <fieldset class="layui-elem-field layui-field-title">
            <legend>APP 信息管理维护 添加app应用信息</legend>
        </fieldset>
        <form class="layui-form" action="${ctx}/app/add">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">
                        软件名称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareName" class="layui-input" placeholder="请输入软件名称">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">
                        APK名称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="APKName" class="layui-input" placeholder="请输入APK名称">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">
                        支持ROM
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="supportROM" class="layui-input" placeholder="请输入rom名称">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">
                        界面语言
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="interfaceLanguage" class="layui-input" placeholder="请输入界面语言">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">
                        软件大小
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareSize" class="layui-input" placeholder="请输入软件大小">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">
                        应用简介
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="appinfo" class="layui-input" placeholder="请输入应用简介">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-inline">
                        <select name="levelOne" lay-filter="ac1" id="one">
                            <option value="">请选择分类</option>
                            <c:forEach items="${ac1}" var="obj">
                                <option value="${obj.id}">${obj.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-inline">
                        <select name="levelTwo" lay-filter="ac2" id="two">
                            <option value="">请选择分类</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">三级分类</label>
                    <div class="layui-input-inline">
                        <select name="levelThree" lay-filter="ac3" id="three">
                            <option value="">请选择分类</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">App状态</label>
                    <div class="layui-input-inline">
                        <select name="appStatus">
                            <option value="">请选择状态</option>
                            <c:forEach items="${status}" var="obj">
                                <option value="${obj.valueId}">${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">所属平台</label>
                    <div class="layui-input-inline">
                        <select name="appFlatform">
                            <option value="">请选择平台</option>
                            <c:forEach items="${flatform}" var="obj">
                                <option value="${obj.valueId}">${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="sb">插入</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%@include file="/jsp/common/footer.jsp" %>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
</script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //监听下拉表单
        form.on('select(ac1)', function (data) {
            var $ac2 = $("select").eq(1);
            $ac2.html('<option value="">请选择分类</option>');
            if (data.value == "") {
                var $ac3 = $("select").eq(2);
                $ac3.html('<option value="">请选择分类</option>');
                form.render();
                return true;
            }
            $.ajax({
                url: "${ctx}/category/qb1/" + data.value,
                method: "get",
                success: function (data) {
                    $.each(data, function (index, obj) {
                        var $op = $('<option value=""></option>')
                        $op.val(obj.id);
                        $op.text(obj.categoryName);
                        $ac2.append($op);
                        //重新渲染
                        form.render();
                    })
                }
            })

        })
        form.on('select(ac2)', function (data) {
            var $ac3 = $("select").eq(2);
            $ac3.html('<option value="">请选择分类</option>')
            if (data.value == "") {
                form.render();
                return ture;
            }
            $.ajax({
                url: "${ctx}/category/qb2/" + data.value,
                method: "get",
                success: function (data) {
                    $.each(data, function (index, obj) {
                        var $op = $('<option value=""></option>')
                        $op.val(obj.id);
                        $op.text(obj.categoryName);
                        $ac3.append($op);
                    })
                    //重新渲染
                    form.render();
                }
            })

        })
    });
</script>
< /body>
< /html>
