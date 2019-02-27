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
        <form class="layui-form" action="${ctx}/app/index/1">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">
                        软件名称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareName" class="layui-input" placeholder="请输入软件名称" value="${appInfo.softwareName}">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">
                        APK名称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="APKName" value="${appInfo.APKName}" class="layui-input"
                               placeholder="请输入APK名称">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">
                        支持ROM
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="supportROM" value="${appInfo.supportROM}" class="layui-input" placeholder="请输入rom名称">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">
                        界面语言
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="interfaceLanguage" value="${appInfo.interfaceLanguage}"
                               class="layui-input" placeholder="请输入界面语言">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">
                        软件大小
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareSize" value="${appInfo.softwareSize}" class="layui-input"
                               placeholder="请输入软件大小">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">
                        应用简介
                    </label>
                    <div class="layui-input-inline">
                        <textarea type="text" name="appinfo" class="layui-textarea">"${appInfo.appInfo}</textarea>
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
                                <c:if test="${obj.id == appInfo.categoryLevel1.id}">
                                    <option selected="selected" value="${obj.id}">${obj.categoryName}</option>
                                </c:if>
                                <c:if test="${obj.id != appInfo.categoryLevel1.id}">
                                    <option value="${obj.id}">${obj.categoryName}</option>
                                </c:if>
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
                                <option value="${obj.valueId}" <c:if test="${appInfo.status eq obj.valueId}">selected</c:if>>${obj.valueName}</option>
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
                                <option value="${obj.valueId}" <c:if test="${appInfo.flatformId eq obj.valueId}">selected</c:if>>${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="sb">返回</button>
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
            //ac2没有,将ac3置空
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
        $(function () {
            var $ac2 = $("select").eq(1);
            $ac2.html('<option value="">请选择分类</option>');
            var ID =${appInfo.categoryLevel1.id};
            var Id2 =${appInfo.categoryLevel2.id};
            $.ajax({
                url: "${ctx}/category/qb1/" + ID,
                method: "get",
                success: function (data) {
                    $.each(data, function (index, obj) {
                        var $op = $('<option value=""></option>')
                        $op.val(obj.id);
                        if (obj.id == Id2) {
                            $op.prop("selected", "selected");
                        }
                        $op.text(obj.categoryName);

                        //重新渲染
                        form.render();

                        $ac2.append($op);
                    })
                }
            })
            var $ac3 = $("select").eq(2);
            $ac3.html('<option value="">请选择分类</option>')
            $.ajax({
                url: "${ctx}/category/qb2/" + Id2,
                method: "get",
                success: function (data) {
                    var id3=${appInfo.categoryLevel3.id};
                    $.each(data, function (index, obj) {
                        var $op = $('<option value=""></option>')
                        $op.val(obj.id);
                        $op.text(obj.categoryName);
                        if(id3==obj.id){
                            $op.prop("selected","selected");
                        }
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
