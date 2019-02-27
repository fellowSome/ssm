<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="layui-header">
    <div class="layui-logo">layui 后台布局</div>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">

            <a href="javascript:;">
                <c:if test="${devUser.picData != null}">
                    <img src="${ctx}//person/load" class="layui-nav-img">
                </c:if>
                <c:if test="${devUser.picData == null}">
                    <img src="${ctx}/static/img/deault_header.jpg" class="layui-nav-img">
                </c:if>
                ${devUser.devName}
            </a>
            <dl class="layui-nav-child">
                <dd>
                    <a href="${ctx}/jsp/person/imgUpload.jsp">
                        上传头像
                    </a>
                </dd>
            </dl>
        </li>
        <li class="layui-nav-item">
            <a href="${ctx}/dev/logout/${devUser.id}">退了</a>
        </li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="scroll-ul">
            <li class="layui-nav-item layui-nav-itemed">
                <a  href="${ctx}/jsp/dev/index.jsp">App账户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/jsp/dev/index.jsp" class="qy">查看账户</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">App应用管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/app/index/${devUser.id}">App维护</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>