<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>小黑盒-后台</title>
    <link rel="stylesheet" href="/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="/css/back.css">
    <link rel="stylesheet" href="/plugin/font-awesome/css/font-awesome.min.css">

    <style>
        .layui-input-block {
            margin-left: 0!important;;
        }

        .layui-col-md6 {
            padding: 10px;
        }

        .postbox {
            min-width: 255px;
            border: 1px solid #e5e5e5;
            /* -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.04); */
            box-shadow: 0 1px 1px rgba(0,0,0,.04);
            background: #fff;
        }


        .postbox, .stuffbox {
            margin-bottom: 20px;
            padding: 0;
            line-height: 1;
        }

        .js .postbox .handlediv {
            display: block;
        }
        .wp-core-ui .button-link {
            margin: 0;
            padding: 0;
            /* -webkit-box-shadow: none; */
            box-shadow: none;
            border: 0;
            /* -webkit-border-radius: 0; */
            border-radius: 0;
            background: 0 0;
            outline: 0;
            cursor: pointer;
        }

        .postbox .handlediv {
            display: none;
            float: right;
            width: 36px;
            height: 36px;
            padding: 0;
        }

        .screen-reader-text span {
            position: absolute;
            margin: -1px;
            padding: 0;
            height: 1px;
            width: 1px;
            overflow: hidden;
            clip: rect(0 0 0 0);
            border: 0;
            word-wrap: normal!important;
        }
        .screen-reader-text span {
            position: absolute;
            margin: -1px;
            padding: 0;
            height: 1px;
            width: 1px;
            overflow: hidden;
            clip: rect(0 0 0 0);
            border: 0;
            word-wrap: normal!important;
        }

        .metabox-holder .postbox>h3, .metabox-holder .stuffbox>h3, .metabox-holder h2.hndle, .metabox-holder h3.hndle {
            font-size: 14px;
            padding: 8px 12px;
            margin: 0;
            line-height: 1.4;
        }
        #dashboard_quick_press form {
            margin: 12px;
        }
        form {
            display: block;
            margin-top: 0em;
        }
        .postbox .inside, .stuffbox .inside {
            padding: 0 12px 12px;
            line-height: 1.4em;
            font-size: 13px;
        }
        .postbox, .stuffbox {
            margin-bottom: 20px;
            padding: 0;
            line-height: 1;
        }
        Inherited from div#wpwrap

        a, div {
            outline: 0;
        }
        user agent stylesheet
        div {
            display: block;
        }
        Inherited from div.inside
        .postbox .inside, .stuffbox .inside {
            padding: 0 12px 12px;
            line-height: 1.4em;
            font-size: 13px;
        }

        #dashboard_quick_press .drafts li time {
            color: #72777c;
        }
        #description-wrap label, #title-wrap label {
            cursor: text;
        }


        #dashboard-widgets form .input-text-wrap input, #dashboard-widgets form .textarea-wrap textarea {
            width: 100%;
        }

        #dashboard_quick_press input, #dashboard_quick_press textarea {
            /* -webkit-box-sizing: border-box; */
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            margin: 0;
        }

        a, div {
            outline: 0;
        }

        #description-wrap label, #title-wrap label {
            cursor: text;
        }

        #dashboard-widgets form .input-text-wrap input, #dashboard-widgets form .textarea-wrap textarea {
            width: 100%;
        }


        .meta-box-sortables select {
            max-width: 100%;
        }
        .js #dashboard_quick_press .drafts {
            border-top: 1px solid #eee;
        }
        #dashboard_quick_press .drafts {
            padding: 10px 0 0;
        }
        #dashboard_quick_press .drafts .view-all {
            float: right;
            margin: 0 12px 0 0;
        }
        #dashboard_quick_press .drafts p {
            margin: 0;
            word-wrap: break-word;
        }
        #dashboard_quick_press .drafts h2 {
            line-height: inherit;
        }

        #dashboard-widgets h3, #dashboard-widgets h4, #dashboard_quick_press .drafts h2 {
            margin: 0 12px 8px;
            padding: 0;
            font-size: 14px;
            font-weight: 400;
            color: #23282d;
        }
        #dashboard_quick_press .drafts ul {
            margin: 0 12px;
        }
        ul {
            list-style: none;
        }
        ol, ul {
            padding: 0;
        }
        #dashboard_quick_press .drafts li {
            margin-bottom: 1em;
        }
        dd, li {
            /* margin-bottom: 6px; */
        }

        user agent stylesheet
        li {
            display: list-item;
            text-align: -webkit-match-parent;
        }
        #dashboard_quick_press .draft-title,.dashboard-comment-wrap {
            word-wrap: break-word;
        }
        a, div {
            outline: 0;
        }
        user agent stylesheet
        div {
            display: block;
        }
        #dashboard_quick_press .drafts p {
            /* margin: 0; */
            word-wrap: break-word;
        }
        p {
            font-size: 13px;
            line-height: 1.5;
        }
        h2, h3, p {
            margin: 1em 0;
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
<#--            <li class="layui-nav-item">-->
<#--                <a href="javascript:;">新建</a>-->
<#--                <dl class="layui-nav-child">-->
<#--                    <dd><a href="/admin/article/insert">文章</a></dd>-->
<#--                    <dd><a href="/admin/page/insert">页面</a></dd>-->
<#--                    <dd><a href="/admin/category/insert">分类</a></dd>-->
<#--                    <dd><a href="/admin/notice/insert">公告</a></dd>-->
<#--                    <dd><a href="/admin/link/insert">链接</a></dd>-->
<#--                </dl>-->
<#--            </li>-->
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
                        <dd><a href="/admin/comment">删除</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-container">

                <div class="layui-row">
                    <div class="layui-col-md6">
                        <div id="dashboard_activity" class="postbox ">
                            <div class="inside">
                                <div id="activity-widget">
                                    <div id="published-posts" class="activity-block"><h3>最近发布</h3> <br>
                                        <ul>
                                            <#list articleList as a>
                                                <li><span>${a.articleCreateTime?string("yyyy-MM-dd")}</span>
                                                    <a href="/article/${a.articleId}"
                                                       target="_blank">${a.articleTitle}</a>
                                                </li>
                                            </#list>
                                        </ul>
                                    </div>
                                    <br>
                                    <div id="latest-comments" class="activity-block"><h3>近期评论</h3>
                                        <ul id="the-comment-list" data-wp-lists="list:comment">
                                            <#--                                        <#list commentList as c>-->
                                            <#--                                            <li class="comment   thread-even comment-item approved">-->

                                            <#--                                                <img alt="" src="/images/icon_83.5@3x.png"-->
                                            <#--                                                     class="avatar avatar-50 photo" height="50" width="50">-->
                                            <#--                                                <div class="dashboard-comment-wrap has-row-actions">-->
                                            <#--                                                    <p class="comment-meta">-->
                                            <#--                                                        由<cite class="comment-author">-->
                                            <#--                                                            <a target="_blank" href="${c.commentAuthorUrl}"-->
                                            <#--                                                               rel="external nofollow"-->
                                            <#--                                                               class="url">${c.commentAuthorName}</a>-->
                                            <#--                                                        </cite>发表在-->
                                            <#--                                                        《<a href="/article/${c.commentArticleId}">${c.article.articleTitle}</a>》-->
                                            <#--                                                    </p>-->

                                            <#--                                                    <blockquote><p>${c.commentContent}</p></blockquote>-->
                                            <#--                                                    <p class="row-actions">|-->
                                            <#--                                                        <span class="">-->
                                            <#--                                            <a data-comment-id="1268"-->
                                            <#--                                               href="/admin/comment/reply/${c.commentId}">-->
                                            <#--                                                回复-->
                                            <#--                                            </a>-->
                                            <#--                                            </span>-->
                                            <#--                                                        <span class=""> |-->
                                            <#--                                                <a href="/admin/comment/edit/${c.commentId}">编辑</a>-->
                                            <#--                                            </span>-->
                                            <#--                                                        <span class=""> |-->
                                            <#--                                                <a href="javascript:void(0)"-->
                                            <#--                                                   onclick="deleteComment(${c.commentId})">删除</a>-->
                                            <#--                                            </span>-->
                                            <#--                                                    </p>-->
                                            <#--                                                </div>-->
                                            <#--                                            </li>-->

                                            <#--                                        </#list>-->
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <div id="dashboard_quick_press" class="postbox ">
                            <div class="inside">
                                <#--                            <form name="post" method="post" id="insertDraftForm"-->
                                <#--                                  class="initial-form hide-if-no-js" action="/admin/article/insertDraftSubmit">-->

                                <#--                                <div class="layui-form-item">-->
                                <#--                                    <div class="layui-input-block">-->
                                <#--                                        <input type="text" name="articleTitle" id="articleTitle" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">-->
                                <#--                                    </div>-->
                                <#--                                </div>-->
                                <#--                                <div class="layui-form-item layui-form-text">-->
                                <#--                                    <div class="layui-input-block">-->
                                <#--                                        <textarea name="articleContent" placeholder="请输入内容" id="articleContent" class="layui-textarea" required></textarea>-->
                                <#--                                    </div>-->
                                <#--                                </div>-->
                                <#--                                <input type="hidden" name="articleStatus" value="0">-->
                                <#--                                <div class="layui-form-item">-->
                                <#--                                    <div class="layui-input-block">-->
                                <#--                                        <button class="layui-btn layui-btn-small" lay-submit lay-filter="formDemo" onclick="insertDraft()">保存草稿</button>-->
                                <#--                                        <button type="reset" class="layui-btn layui-btn-small layui-btn-primary">重置</button>-->
                                <#--                                    </div>-->
                                <#--                                </div>-->

                                <#--                            </form>-->
                                <#--                            <div class="drafts"><p class="view-all"><a-->
                                <#--                                            href="/admin/article"-->
                                <#--                                            aria-label="查看所有草稿">查看所有</a></p>-->
                                <#--                                <h2 class="hide-if-no-js">草稿</h2>-->
                                <#--                                <ul>-->
                                <#--                                    <c:forEach items="${articleList}" var="a">-->
                                <#--                                        <c:if test="${a.articleStatus==0}">-->
                                <#--                                            <li>-->
                                <#--                                                <div class="draft-title"><a-->
                                <#--                                                            href="/admin/article/edit/${a.articleId}">${a.articleTitle}</a>-->
                                <#--                                                    <time ><fmt:formatDate value="${a.articleCreateTime}" pattern="yyyy年MM月dd日"/></time>-->
                                <#--                                                </div>-->
                                <#--                                            </li>-->
                                <#--                                        </c:if>-->
                                <#--                                    </c:forEach>-->
                                <#--                                </ul>-->
                            </div>
                        </div>
                    </div>
                </div>
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
<script src="/js/back.js"></script>

</body>
</html>