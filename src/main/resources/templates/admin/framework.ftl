<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>小黑盒后台</title>
    <link rel="stylesheet" href="/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="/css/back.css">
    <link rel="stylesheet" href="/plugin/font-awesome/css/font-awesome.min.css">

    <style>

    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><a href="/admin" style="color:#009688;">
                小黑盒后台
            </a>
        </div>
        <!-- 头部区域（配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/index" target="_blank">前台</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <#--                    <img src="${sessionScope.user.userAvatar}" class="layui-nav-img">-->
                    ${user.userName}
                </a>
                <#--                <dl class="layui-nav-child">-->
                <#--                    <dd><a href="/admin/user/profile">基本资料</a></dd>-->
                <#--                </dl>-->
            </li>
            <li class="layui-nav-item">
                <a href="/logout">退出</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域 -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a href="/admin">
                        首页
                    </a>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">文章</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/article">全部文章</a></dd>
                        <dd><a href="/admin/article/insert">写文章</a></dd>
                        <dd><a href="/admin/article/examine">文章审核</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">评论</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/comment/examine">审核</a></dd>
                        <#--<dd><a href="/admin/comment">删除</a></dd>-->
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <rapid:block name="content">

            </rapid:block>
        </div>


    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        小黑盒管理员页面
    </div>
</div>
<script src="/js/jquery.min.js"></script>
<script src="/plugin/layui/layui.all.js"></script>
<script src="/js/back.js"></script>

</body>
</html>