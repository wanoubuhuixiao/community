<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文章列表</title>
    <link rel="stylesheet" href="/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="/css/back.css">
    <link rel="stylesheet" href="/plugin/font-awesome/css/font-awesome.min.css">

    <style>
        /*覆盖 layui*/
        .layui-input {
            display: inline-block;
            width: 33.333% !important;
        }

        .layui-input-block {
            margin: 0px 10px;
        }
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
<#--                        <dd><a href="/admin/comment">删除</a></dd>-->
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
          <a href="/admin">首页</a>
          <a><cite>待审核文章列表</cite></a>
        </span>
            </blockquote>

            <div class="layui-tab layui-tab-card">
                <form id="articleForm" method="post">
                    <input type="hidden" name="currentUrl" id="currentUrl" value="">
                    <table class="layui-table">
                        <colgroup>
                            <col width="300">
                            <col width="150">
                            <col width="100">
                            <col width="150">
                            <col width="100">
                            <col width="50">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>标题</th>
                            <th>所属分类</th>
                            <th>状态</th>
                            <th>发布时间</th>
                            <th>操作</th>
                            <th>id</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list pageInfo.list as a>
                            <tr>
                                <td>
                                    <a href="/article/${a.articleId}"
                                       target="_blank">
                                        ${a.articleTitle}

                                    </a></td>
                                <td>
                                    <#list a.categoryList as c>
                                        <a href="/category/${c.categoryId}"
                                           target="_blank">${c.categoryName}</a>
                                    </#list>
                                    <#--                                    <c:forEach items="${a.categoryList}" var="c">-->
                                    <#--                                        <a href="/category/${c.categoryId}"-->
                                    <#--                                           target="_blank">${c.categoryName}</a>-->
                                    <#--                                        &nbsp;-->
                                    <#--                                    </c:forEach>-->
                                </td>
                                <td>
                                    <#if a.articleStatus == 1>
                                        <a href="/admin/article?status=1">
                                            <span style="color:#5FB878;">已通过</span>
                                        </a>
                                    <#elseif a.articleStatus == 0>
                                        <a href="#">
                                            <span style="color:blue;">待审核</span>
                                        </a>
                                    <#elseif a.articleStatus == 2>
                                        <a href="/admin/article?status=2">
                                            <span style="color:#FF5722;">未通过</span>
                                        </a>
                                    </#if>
                                </td>
                                <td>
                                    ${a.articleCreateTime?string("yyyy-MM-dd")}
                                </td>
                                <td>
                                    <a href="javascript:void(0)"
                                       onclick="examineArticle(${a.articleId},1)"
                                       class="layui-btn layui-btn-mini">通过</a>
                                    <a href="javascript:void(0)"
                                       onclick="examineArticle(${a.articleId},2)"
                                       class="layui-btn layui-btn-danger layui-btn-mini">不通过</a>
                                </td>
                                <td>${a.articleId}</td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </form>
                <#if (pageInfo.pages > 1)>
                <#-- 分页 start-->
                    <nav class="navigation pagination" role="navigation">
                        <div class="nav-links">
                            <#if (pageInfo.pages <= 3)>
                                <#assign begin=1 end=pageInfo.pages>
                            <#else>
                                <#assign begin=pageInfo.pageNum-1 end=pageInfo.pageNum + 2>
                                <#if (begin < 2)>
                                    <#assign begin=1 end=3>

                                </#if>
                                <#if (end > pageInfo.pages)>
                                    <#assign begin=pageInfo.pages-2 end=pageInfo.pages>

                                </#if>

                            </#if>
                            <#--上一页 -->
                            <#if pageInfo.pageNum == 1>
                            <#--                          当前页为第一页，隐藏上一页按钮-->
                            <#else>
                                <a class="page-numbers"
                                   href="${pageUrlPrefix}=${pageInfo.pageNum-1}">
                                    <i class="layui-icon">&#xe603;</i>
                                </a>
                            </#if>
                            <#--                        显示第一页的页码-->
                            <#if (begin >= 2)>
                                <a class="page-numbers" href="${pageUrlPrefix}=1">1</a>
                            </#if>
                            <#--                        显示点点点 -->
                            <#if (begin >= 2)>
                                <span class="page-numbers dots">…</span>
                            </#if>
                            <#--                            打印 页码-->
                            <#list begin..end as i>
                                <#if i == pageInfo.pageNum>
                                    <a class="page-numbers current">${i}</a>
                                <#else>
                                    <a class="page-numbers" href="${pageUrlPrefix}=${i}">${i}</a>
                                </#if>
                            </#list>
                            <#--                            显示点点点-->
                            <#if (end < pageInfo.pages-1)>
                                <span class="page-numbers dots">…</span>
                            </#if>
                            <#--                            显示最后一页的数字-->
                            <#if (end < pageInfo.pages)>
                                <a href="${pageUrlPrefix}=${pageInfo.pages}">
                                    ${pageInfo.pages}
                                </a>
                            </#if>
                            <#--                            下一页-->
                            <#if pageInfo.pageNum == pageInfo.pages>
                            <#--到了尾页隐藏下一页按钮-->
                            <#else>
                                <a class="page-numbers"
                                   href="${pageUrlPrefix}=${pageInfo.pageNum+1}">
                                    <i class="layui-icon">&#xe602;</i>
                                </a>
                            </#if>
                        </div>
                    </nav>
                </#if>
            </div>

        </div>


    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        小黑盒管理员页面
    </div>
</div>
<script src="/js/jquery.min.js"></script>
<script src="/plugin/layui/layui.all.js"></script>
<script src="/js/back.js"></script>\

</body>
</html>