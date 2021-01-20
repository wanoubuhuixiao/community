<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑文章</title>
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
            <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/article">文章列表</a>
              <a><cite>编辑文章</cite></a>
        </span>
            </blockquote>


            <form class="layui-form" method="post" id="myForm" action="/admin/article/editSubmit">
                <input type="hidden" name="articleId" value="${article.articleId}">
                <div class="layui-form-item">
                    <label class="layui-form-label">标题 <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-block">
                        <input type="text" name="articleTitle" lay-verify="title" id="title" value="${article.articleTitle}"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">内容 <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide" name="articleContent"
                          id="content">${article.articleContent}</textarea>
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">分类 <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-inline">
                        <select name="articleCategoryId" id="articleParentCategoryId"
                                lay-filter="articleParentCategoryId">
                            <option value="">分类</option>
                            <#list categoryList as c>
                                <option value="${c.categoryId}"
                                        <#if (article.categoryList[0].categoryId == c.categoryId)>
                                             selected
                                        </#if>
                                >${c.categoryName}
                                </option>
                            </#list>
                        </select>
                    </div>
<#--                    <div class="layui-input-inline">-->
<#--                        <select name="articleChildCategoryId" id="articleChildCategoryId" lay-filter="articleChildCategoryId">-->
<#--                            <c:forEach items="${categoryList}" var="c">-->
<#--                                <c:if test="${c.categoryPid == article.categoryList[0].categoryId}">-->
<#--                                    <option value="${c.categoryId}"-->
<#--                                    <c:if test="${article.categoryList[1].categoryId == c.categoryId}">selected</c:if>>${c.categoryName}</option>-->
<#--                                </c:if>-->
<#--                            </c:forEach>-->
<#--                        </select>-->
<#--                    </div>-->
                </div>
<#--                <div class="layui-form-item" pane="">-->
<#--                    <label class="layui-form-label">标签</label>-->
<#--                    <div class="layui-input-block">-->
<#--                        <c:forEach items="${tagList}" var="t">-->
<#--                            <input type="checkbox" name="articleTagIds" lay-skin="primary" title="${t.tagName}"-->
<#--                                   value="${t.tagId}"-->
<#--                            <c:forEach items="${article.tagList}" var="t2">-->
<#--                                <c:if test="${t.tagId == t2.tagId}">checked</c:if>-->
<#--                            </c:forEach>>-->
<#--                        </c:forEach>-->
<#--                    </div>-->
<#--                </div>-->
<#--                <div class="layui-form-item">-->
<#--                    <label class="layui-form-label">order</label>-->
<#--                    <div class="layui-input-inline">-->
<#--                        <input type="number" name="articleOrder" value="${article.articleOrder}" autocomplete="off"-->
<#--                               class="layui-input">-->
<#--                    </div>-->
<#--                    <div class="layui-form-mid layui-word-aux">输入1-10的数字,order越大排序越前</div>-->
<#--                </div>-->
                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                        <input type="radio" name="articleStatus" value="0" title="待审核"
                               <#if article.articleStatus==0>checked</#if>>
                        <input type="radio" name="articleStatus" value="1" title="已通过"
                               <#if article.articleStatus==1>checked</#if>>
                        <input type="radio" name="articleStatus" value="2" title="未通过"
                               <#if article.articleStatus==2>checked</#if>>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>

            <blockquote class="layui-elem-quote layui-quote-nm">

            </blockquote>
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

<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;


        //上传图片,必须放在 创建一个编辑器前面
        layedit.set({
            uploadImage: {
                url: '/admin/upload/img' //接口url
                , type: 'post' //默认post
            }
        });


        //创建一个编辑器
        var editIndex = layedit.build('content', {
                height: 350,
            }
        );

//            layui.code({
//                elem: 'pre', //默认值为.layui-code
//            });

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });
        layedit.build('content', {
            tool: [
                'strong' //加粗
                , 'italic' //斜体
                , 'underline' //下划线
                , 'del' //删除线

                , '|' //分割线

                , 'left' //左对齐
                , 'center' //居中对齐
                , 'right' //右对齐
                , 'link' //超链接
                , 'unlink' //清除链接
                , 'face' //表情
                , 'image' //插入图片
                , 'code'
            ]
        });


        //二级联动
        <#--form.on("select(articleParentCategoryId)", function () {-->
        <#--    var str = "";-->
        <#--    var articleParentCategoryId = $("#articleParentCategoryId").val();-->
        <#--<c:forEach items="${categoryList}" var="c">-->
        <#--    if (articleParentCategoryId ==${c.categoryPid}) {-->
        <#--        str += "<option name='childCategory' value='${c.categoryId}'<c:if test='${article.categoryList[1].categoryId == c.categoryId}'>selected</c:if>>${c.categoryName}</option>";-->
        <#--    }-->
        <#--</c:forEach>-->
        <#--    $("#articleChildCategoryId").html("  <option value=''selected>二级分类</option>" + str);-->
        <#--    form.render('select'); //这个很重要-->
        <#--})-->

    });
    //end
</script>

</body>
</html>