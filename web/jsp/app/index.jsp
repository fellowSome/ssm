<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>App信息管理系统</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <script src="${ctx}/static/js/jquery-3.3.1.js"></script>
    <style type="text/css">
        body {
            font-size: 10px;
        !important;
        }

        .bt {
            display: inline-block;
            width: 20px;
            margin: 0;
            padding: 0;
            float: left;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@ include file="/jsp/app/header.jsp" %>
    <div class="layui-body" style="top:0px;">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <!--表单-->
            <fieldset class="layui-elem-field layui-field-title">
                <legend>APP 信息管理维护 测试账户001-您可以通过搜索或其他的筛选项对App的信息进行修改或删除等操作</legend>
            </fieldset>
            <form class="layui-form" action="${ctx}/app/query">

                <div style="border:1px lightblue solid ">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">软件名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="softwareName" autocomplete="off" class="layui-input"
                                       value="${dto.softwareName}">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">App状态</label>
                            <div class="layui-inline">
                                <select name="appStatus">
                                    <option value="">请选择状态</option>
                                    <c:forEach items="${status}" var="obj">
                                        <option value="${obj.valueId}"
                                                <c:if test="${dto.appStatus eq obj.valueId}">
                                                    selected
                                                </c:if>
                                        >${obj.valueName}</option>
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
                                        <option value="${obj.valueId}"
                                                <c:if test="${dto.appFlatform eq obj.valueId}">selected</c:if>
                                        >${obj.valueName}</option>
                                    </c:forEach>
                                </select>
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
                                        <option value="${obj.id}"
                                                <c:if test="${dto.levelOne eq obj.id}">
                                                    selected
                                                </c:if>
                                        >${obj.categoryName}</option>
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
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="sb">立即提交</button>
                            <button type="reset" class="layui-btn" lay-submit="" lay-filter="ad">添加</button>
                        </div>
                    </div>
                </div>
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>软件名称</th>
                        <th>APK名称</th>
                        <th>软件大小(单位:M)</th>
                        <th>所属平台</th>
                        <th>所属分类(一级分类,二级分类,三级分类)</th>
                        <th>状态</th>
                        <th>下载次数</th>
                        <th>最新版本号</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.list}" var="obj">
                        <tr>
                            <td>${obj.softwareName}</td>
                            <td>${obj.APKName}</td>
                            <td>${obj.softwareSize}</td>
                            <td>
                                <c:if test="${obj.flatformId eq 1}">
                                    手机
                                </c:if>
                                <c:if test="${obj.flatformId eq 2}">
                                    平板
                                </c:if>
                                <c:if test="${obj.flatformId eq 3}">
                                    通用
                                </c:if>
                            </td>
                            <td>
                                    ${obj.categoryLevel1.categoryName}->${obj.categoryLevel2.categoryName}->${obj.categoryLevel3.categoryName}
                            </td>
                            <td>${obj.status}</td>
                            <td>${obj.downloads}</td>
                            <td>${obj.newAppVersion.versionNo}</td>
                            <td style="width: 90px !important;">
                                <a href="${ctx}/app/modify/${obj.id}" class="layui-btn-normal bt layui-btn">
                                    <i class="layui-icon">&#xe642</i>
                                </a>
                                <a href="${ctx}/app/delete/${obj.id}" class="layui-btn-warn bt layui-btn">
                                    <i class="layui-icon">&#xe640;</i>
                                </a>
                                <a href="${ctx}/app/status/${obj.id}" class="layui-btn-normal bt layui-btn">
                                    <i class="layui-icon">&#xe615;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>
                            共${page.total}条记录 第${page.pageNum}/${page.pages}页
                        </td>
                        <td colspan="8">
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="head">首页</button>
                                    <button class="layui-btn" lay-submit="" lay-filter="pre">上一页</button>
                                    <button class="layui-btn" lay-submit="" lay-filter="nxt">下一页</button>
                                    <button class="layui-btn" lay-submit="" lay-filter="tail">尾页</button>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <input id="pag" type="hidden" name="pageNum" value="${page.pageNum}">
            </form>

        </div>
    </div>
    <%@ include file="/jsp/common/footer.jsp" %>
</div>
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


        //表单提交
        form.on('submit(sb)', function (data) {
            $("#pag").val(1);
            return true;
        });

        //上一页 下一页 首页 尾页
        form.on('submit(head)', function (data) {
            //首页
            $("#pag").val(1);
            return true;
        });
        form.on('submit(pre)', function (data) {
            //上一页
            var $pageNum =${page.pageNum - 1};
            if ($pageNum <= 0) {
                $pageNum = 1;
            }
            $("#pag").val($pageNum);
            return true;
        });
        form.on('submit(nxt)', function (data) {

            //下一页
            var $pageNum =${page.pageNum+1};
            if ($pageNum >${page.total}) {
                $pageNum =${page.total};
            }
            $("#pag").val($pageNum);
            return true;

        });
        form.on('submit(tail)', function (data) {
            //尾页
            var $pageNum =${page.total};
            $("#pag").val($pageNum);
            return true;
        });
        //监听添加
        form.on('submit(ad)', function (data) {
            var oButton = data;
            var url = "${ctx}/jsp/app/add.jsp";
            $(data.form).prop("action", url);
            $(data.form).submit();
            return true;
        })


        //监听下拉表单
        form.on('select(ac1)', function (data) {
            var $ac2 = $("select").eq(3);
            $ac2.html('<option value="">请选择分类</option>');
            if (data.value == "") {
                var $ac3 = $("select").eq(4);
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
            var $ac3 = $("select").eq(4);
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
        //上一页,下一页,首页,尾页保留当前选项信息
        $(function () {
            //ac2  一级分类
            var $ac2 = $("select").eq(3);
            var dt = ${dto.levelOne}+"";
            var dt1 = ${dto.levelTwo}+"";
            //一级存在 ajax加载二级,点亮二级
            if (dt) {
                $.ajax({
                    url: "${ctx}/category/qb1/" + dt,
                    method: "get",
                    success: function (data) {
                        $.each(data, function (index, obj) {
                            var $op = $('<option value=""></option>')
                            $op.val(obj.id);
                            $op.text(obj.categoryName);
                            $ac2.append($op);
                            if (obj.id == dt1) {
                                $op.prop("selected", "selected");
                            }
                            //重新渲染
                            form.render();
                        })
                    }
                })

            }
            //二级存在 ajax加载三级,判断点亮三级
            if (dt1) {
                var $ac3 = $("select").eq(4);
                $ac3.html('<option value="">请选择分类</option>');
                var dt = ${dto.levelThree}+"";
                $.ajax({
                    url: "${ctx}/category/qb2/" + dt1,
                    method: "get",
                    success: function (data) {
                        $.each(data, function (index, obj) {
                            var $op = $('<option value=""></option>')
                            $op.val(obj.id);
                            $op.text(obj.categoryName);
                            if (dt == obj.id) {
                                $op.attr("selected", "selected");
                            }
                            $ac3.append($op);
                        })
                        //重新渲染
                        form.render();
                    }
                })
            }
        })
    });
</script>
</body>
</html>
