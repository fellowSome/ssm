<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/12
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户主页</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
    <script src="${ctx}/static/js/jquery-3.3.1.js"></script>
    <style type="text/css">
        td a {
            display: inline-block;
        }
        td a:first-child {
            float: left;
        }
        td a:last-child {
            float: right;
        }
        .hide{
            display: none;
        }
    </style>
</head>
<body class="layui-layout-body">
<c:if test="${st == 123}">
  <script>
      alert("修改用户成功了.")
  </script>
</c:if>
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/common/header.jsp"/>
    <div class="layui-body hide"  >
        <!-- 内容主体区域 -->
            <table class="layui-table" id="user-table">
                <thead>
                <tr>
                    <th>id</th>
                    <th>devCode</th>
                    <th>devName</th>
                    <th>devEmail</th>
                    <th>modifyBy</th>
                    <th>modifyDate</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
    </div>
    <%@ include file="/jsp/common/footer.jsp" %>
</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element', 'table', 'table', 'form'], function () {
        var element = layui.element;
        var table = layui.table;
        var form = layui.form;
        $(".qy").click(function () {
            $(".hide").toggleClass("hide");
            $.ajax({
                url: "${ctx}/dev/qy",
                method: 'post',
                success: function (data) {
                    console.log(data)
                    var $Tbody = $("#user-table tbody");
                    $Tbody.html("");
                    $.each(data, function (index, value) {
                        var $tr = $("<tr></tr>");
                        $.each(value, function (k, v) {
                            var $td = $("<td></td>");
                            if (k == "id") {
                                $td.text(v);
                                $tr.append($td);
                            } else if(k != 'xid') {
                                var $input = $("<input type='text' style='border: none;'></input>");
                                $input.prop({
                                    name: k,
                                    value: v
                                });
                                $td.append($input);
                                $tr.append($td);
                            }else{
                                //xid
                            }

                        })
                        var $td = $("<td></td>");
                        var $ai1 = $("<a class='ed'><i class='layui-icon'>&#xe642;</i></a>");
                        var $ai2 = $("<a class='del'><i class='layui-icon'>&#xe640;</i></a>");
                        $td.append($ai1);
                        $td.append($ai2);
                        $tr.append($td);
                        $Tbody.append($tr);
                    })
                    table.render();
                }
            })
        });
        var $form = $("form");
        // 修改用户信息
        $("body").delegate(".ed", "click", function () {
            var $tr = $(this).parents('tr');
            var id= $tr.find("td:first-child").text();
            var devCode=$tr.find("td:nth-child(2) input").val();
            var devName=$tr.find("td:nth-child(3) input").val();
            var devEmail=$tr.find("td:nth-child(4) input").val();
            var modifyBy=$tr.find("td:nth-child(5) input").val();
            var obj={
                id:id,
                devCode:devCode,
                devName:devName,
                devEmail:devEmail,
                modeifyBy:modifyBy,
            }
            var data=JSON.stringify(obj);
            console.log(data);
            $.ajax({
                url: '${ctx}/dev/edit',
                method: 'get',
                data: obj,
                success: function (data) {
                    alert(data);
                }
            })
            return true;
        })
    });
    $("body").delegate(".del","click",function () {
        var $tr = $(this).parents('tr');
        var id= $tr.find("td:first-child").text();
        $.ajax({
            url:'${ctx}/dev/del',
            data:'id='+id,
            method:'post',
            success:function (data) {
                if(data.status==200){
                    alert("删除成功了");
                }else{
                    alert("删除失败")
                }
            }
        })
    })
</script>
</body>
</html>