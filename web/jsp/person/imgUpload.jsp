<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/23
  Time: 0:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
    <style type="text/css">
        .content {
            width: 500px;
            margin: 0 auto;
            text-align: center;
            border: 1px solid blueviolet;
        }
    </style>
</head>
<body>
<div class="content">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>拖拽上传</legend>
    </fieldset>

    <div class="layui-upload-drag" id="drag">
        <i class="layui-icon"></i>
        <p>点击上传，或将文件拖拽到此处</p>
    </div>
    <br/>
    <img class="layui-upload-img" id="image" style="width: 200px;height: 200px;margin: 0 10px 10px 0;"/>
</div>
<script>
    layui.use('upload', function () {
        var $ = layui.jquery;
        var upload = layui.upload;
        upload.render({
            elem: '#drag',
            url: '${ctx}/person/upload',
            accept:'images',
            before: function (obj) {
                obj.preview(function (index,file,result) {
                    $("#image").prop("src",result);
                })
            },
            done: function (json) {
                //接受response返回的数据
                console.log(json);
                if(json.code==200){
                    alert("添加成功");
                    window.location="${ctx}/jsp/dev/index.jsp";
                }else{
                    alert("添加失败");
                }
            }
        })
    })
</script>
</body>
</html>
