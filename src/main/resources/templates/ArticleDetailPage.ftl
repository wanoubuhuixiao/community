<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文章内容</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/font-icon.css">
    <link rel="stylesheet" href="/css/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.max-c.com/version_1_5_58/common.12a94361288ce402f996.css">

    <link rel="shortcut icon" sizes="48x48" href="https://cdn.max-c.com/logo/heybox_bbs_128_128.png">

    <link rel="stylesheet" href="/css/mycss.css">
    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet">
    <base target="_blank">
    <style>
        <#if commentList??>
        <#list commentList as comment>
        #pressToShow${comment.commentId} {
            display: none;
        }

        #show${comment.commentId} {
            display: block;
        }

        #hide${comment.commentId} {
            display: none;
        }

        </#list>
        </#if>

    </style>

    <script type="text/javascript">


        <#if commentList??>
        <#list commentList as comment>

        function showDiv1${comment.commentId}() {
            //$("#test1").attr("style","display:block");
            //$("#test1").show();
            $("#show${comment.commentId}").css("display", "none");
            $("#pressToShow${comment.commentId}").css("display", "block");
            $("#hide${comment.commentId}").css("display", "block");

        }


        function hiddenDiv1${comment.commentId}() {
            $("#pressToShow${comment.commentId}").css("display", "none");
            $("#hide${comment.commentId}").css("display", "none");
            $("#show${comment.commentId}").css("display", "block");
        }

        </#list>
        </#if>


    </script>
</head>
<body>
<!--导航-->
<nav class="navbar navbar-expand-lg navbar-light nav-color-nav  navbar-lk text-dark">
    <div class="container">
        <div class="logo-wrapper" data-v-8f2efb28="">
            <div class="logo" data-v-7d8b0b55="" data-v-8f2efb28="">
                <svg version="1.1" id="图层_1"
                     xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                     viewBox="0 0 84 30" xml:space="preserve" style="enable-background:new 0 0 84 30;"
                     data-v-7d8b0b55="">
                        <g id="Page-1" data-v-7d8b0b55="">
                            <g id="Group-4" transform="translate(-35.000000, -103.000000)" data-v-7d8b0b55="">
                                <g id="小黑盒-白-copy-3" transform="translate(35.000000, 103.000000)" data-v-7d8b0b55="">
                                    <!---->
                                    <path id="logo_heybox_with_en" d="M23.5,7.8C23.8,7.9,24,8.3,24,8.6v12.7c0,0.3-0.2,0.7-0.5,0.8l-3.8,2.2
                c-0.3,0.2-0.5,0-0.5-0.3V11.7c0-0.3-0.2-0.7-0.5-0.8l-3.8-2.2c-0.3-0.2-0.5,0-0.5,0.3V12c0,0.3-0.2,0.5-0.6,0.5h-3.7
                c-0.3,0-0.5-0.2-0.5-0.5V0.3c0-0.3,0.2-0.4,0.5-0.3l1.4,0.8C11.8,1,12,1.2,12,1.2c0,0,0.2,0.1,0.5,0.3L23.5,7.8z M9.6,17.9
                c0-0.3,0.2-0.5,0.5-0.5h3.7c0.3,0,0.5,0.2,0.6,0.5v11.7c0,0.3-0.2,0.4-0.5,0.3l-4.7-2.7C9,27.1,8.8,27,8.8,27
                c0,0-0.2-0.1-0.5-0.3l-7.8-4.5C0.2,22,0,21.7,0,21.4V8.6c0-0.3,0.2-0.7,0.5-0.8l3.8-2.2c0.3-0.2,0.5,0,0.5,0.3v12.5
                c0,0.3,0.2,0.7,0.5,0.8l3.8,2.2c0.3,0.2,0.5,0,0.5-0.3L9.6,17.9z M28.7,15.8v-2c1.7-2.3,2.7-5.3,2.9-9H34
                C33.8,9.6,32,13.3,28.7,15.8z M33.7,18.7v-1.6h1.4c0.8,0,1.1-0.3,1.1-1V1.7h2.6v14.6c0,1.6-0.9,2.4-2.6,2.4H33.7z M46,15.8
                c-3.4-2.5-5.1-6.1-5.3-11h2.3c0.3,3.8,1.2,6.8,2.9,9L46,15.8L46,15.8z M48.6,9.2V2.3h15.1v4.3c0.1,1.8-0.8,2.7-2.6,2.6h-3.8v1.4
                H64V12h-6.6v1.4h7.5v1.5H47.4v-1.5h7.5V12h-6.6v-1.4h6.6V9.2H48.6z M47.9,18.8c0.2-1.1,0.5-2.1,1-3.1h2c-0.5,1.3-0.7,2.3-0.8,3.1
                H47.9z M50.8,7.8h4.1v-4h-4.1V7.8z M52.4,7.1c-0.5-0.9-0.7-1.7-0.8-2.6h1.8c0.1,0.9,0.4,1.7,0.8,2.6H52.4z M53.3,18.8
                c-0.1-0.9-0.3-1.9-0.6-3.1h2c0.4,1,0.6,2,0.8,3.1H53.3z M57.8,18.8c-0.1-0.9-0.3-1.9-0.8-3.1h2c0.5,1,0.8,2,1,3.1H57.8z
                 M61.5,3.8h-4.1v4h3c0.8,0.1,1.2-0.4,1.1-1.2V3.8z M58,7.1c0.4-0.9,0.7-1.8,0.8-2.6h1.9c-0.2,1-0.5,1.9-0.8,2.6H58z M62.3,18.8
                c-0.2-1-0.5-2-0.9-3.1h2c0.5,1,0.9,2,1.1,3.1H62.3z M83.6,6.6c-1.7-0.3-3.2-0.6-4.5-1v0.9h-8.5V5.6c-1.3,0.4-2.7,0.7-4.5,1V5.2
                c3.4-0.8,5.8-2,7.4-3.6h2.6c1.6,1.7,4,2.9,7.4,3.6L83.6,6.6L83.6,6.6z M66.3,18.4v-1.5H68v-4.4h13.9v4.4h1.7v1.5H66.3z
                 M68.8,11.5V7.4H81v2c0,1.5-0.7,2.2-2.3,2.2H68.8z M70.3,14v2.9H72V14H70.3z M71.1,10.2H78c0.6,0.1,0.9-0.3,0.8-0.9V8.7h-7.7
                V10.2z M74.9,3.5c-0.9,0.7-2,1.3-3.4,1.8h6.7C76.9,4.7,75.8,4.1,74.9,3.5z M74,14v2.9h1.8V14H74z M79.7,14h-1.8v2.9h1.8V14z
                 M32.6,28.5h-1v-7.1h1v3h2.9v-3h1v7.1h-1v-3.1h-2.9V28.5z M44.4,28.5h-3.7v-7.1h3.7v0.9h-2.6v2.1h2.6v0.9h-2.6v2.1h2.6V28.5z
                 M51,26v2.5h-1v-2.6l-2.2-4.5H49l1.6,3.4l1.6-3.4h1.1L51,26z M58.1,21.4c0.8,0,1.3,0.2,1.7,0.5c0.4,0.3,0.6,0.8,0.6,1.4
                c0,0.3-0.1,0.5-0.2,0.8c-0.1,0.2-0.3,0.4-0.6,0.6c0.3,0.1,0.6,0.3,0.8,0.6c0.2,0.3,0.3,0.6,0.3,1.1c0,0.3-0.1,0.6-0.2,0.9
                c-0.1,0.3-0.3,0.5-0.5,0.7c-0.2,0.2-0.5,0.3-0.7,0.4c-0.3,0.1-0.7,0.1-1.1,0.1h-1.6v-7.1H58.1z M57.6,27.5h0.8
                c0.5,0,0.8-0.1,1-0.3c0.2-0.2,0.3-0.4,0.3-0.8c0-0.4-0.1-0.7-0.3-0.9c-0.2-0.2-0.6-0.3-1-0.3h-0.8V27.5z M57.6,24.4h0.3
                c0.5,0,0.9-0.1,1.1-0.2c0.2-0.2,0.3-0.4,0.3-0.8c0-0.3-0.1-0.6-0.3-0.7c-0.2-0.2-0.5-0.2-0.9-0.2h-0.5V24.4z M64.3,24.9
                c0-0.5,0.1-1,0.3-1.4c0.2-0.4,0.5-0.8,0.8-1.2c0.3-0.3,0.7-0.6,1.1-0.8c0.4-0.2,0.9-0.3,1.4-0.3c0.5,0,1,0.1,1.4,0.3
                s0.8,0.4,1.2,0.8c0.4,0.4,0.6,0.7,0.8,1.2s0.3,0.9,0.3,1.4c0,0.5-0.1,1-0.2,1.4c-0.2,0.4-0.4,0.8-0.7,1.1
                c-0.4,0.4-0.8,0.7-1.2,0.9c-0.5,0.2-0.9,0.3-1.5,0.3c-0.5,0-1-0.1-1.5-0.3c-0.4-0.2-0.9-0.5-1.2-0.9c-0.3-0.3-0.5-0.7-0.7-1.1
                C64.4,25.9,64.3,25.4,64.3,24.9z M65.4,24.9c0,0.4,0.1,0.7,0.2,1c0.1,0.3,0.3,0.6,0.5,0.9c0.2,0.3,0.5,0.4,0.8,0.6
                c0.3,0.1,0.6,0.2,1,0.2c0.7,0,1.3-0.3,1.8-0.8c0.5-0.5,0.7-1.2,0.7-1.9c0-0.3-0.1-0.6-0.2-0.9c-0.1-0.3-0.3-0.6-0.5-0.8
                c-0.3-0.3-0.6-0.5-0.9-0.6s-0.6-0.2-1-0.2c-0.3,0-0.7,0.1-1,0.2c-0.3,0.1-0.6,0.3-0.8,0.5c-0.2,0.2-0.4,0.5-0.6,0.9
                C65.5,24.2,65.4,24.6,65.4,24.9z M77.6,25.7l-1.8,2.8h-1.2l2.4-3.6l-2.3-3.5h1.2l1.7,2.7l1.7-2.7h1.2l-2.3,3.5l2.3,3.6h-1.2
                L77.6,25.7z" class="st0" style="fill: #14191e" data-v-7d8b0b55=""></path>
                                </g>
                            </g>
                        </g>
                    </svg>
            </div>
        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nabmune"
                aria-controls="nabmune" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="nabmune">
            <ul class="navbar-nav nav-color ">
                <li class="nav-item">
                    <a class="nav-link" href="/index">首页 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="chat.html">PC游戏</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="chat.html">主机游戏</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="picture.html">手机游戏</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="life.html">桌游综合</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="chat.html">数码硬件</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="about.html">社区</a>
                </li>
                <#if login>
                    <li class="nav-item ">
                        <a class="nav-link" href="/space">我的主页</a>
                    </li>
                <#else>
                    <li class="nav-item ">
                        <a class="nav-link" href="/admin">登录</a>
                    </li>
                </#if>
            </ul>
            <!--<form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>-->
        </div>
    </div>
</nav>


<!--内容-->
<div class="container mt-3">
    <div class="row">
        <div class="col-md-12">
            <div class="container">
                <div class="row mt-2">

                </div>

                <div class="row mt-2">
                    <div class="col-md-12 bgc">
                        <div class="article-title">
                            <ul>
                                <li><a title="发表时间"><i
                                                class="el-time"></i>${article.articleCreateTime?string("yyyy-MM-dd")}
                                    </a></li>
                                <li class="d-none d-sm-none d-md-none d-lg-block"><a title="作者"><i
                                                class="el-user"></i>${article.user.userName}</a></li>
                                <li><a id="likea" title="点赞""><i class="el-heart"></i><i
                                                id="likei">${article.articleLikeCount}</i></a></li>
                                <li><a title="浏览数"><i class="el-eye-open"></i><i
                                                id="viewi">${article.articleViewCount}</i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row mt-2 bgc">
                    <header class="entry-header">
                        <h1 class="entry-title">
                            ${article.articleTitle}
                        </h1>
                    </header>

                    <div class="wrapper wrapper-content  animated article">
                        <div class="row">
                            <div class="col-lg-12 col-lg-offset-1">
                                <div class="ibox">
                                    <div class="ibox-content">
                                        <!--                            <p>js前端实现模糊查询</p><p>对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。</p>-->
                                        <!--                            <p><br></p><p>//字符串方法indexOf</p><p>var len = list.length;</p><p>var arr = [];</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p>-->
                                        <!--                            <p>&nbsp; &nbsp; if(list[i].indexOf(keyWord)&gt;=0){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p><p><br></p><p>//正则表达式</p>-->
                                        <!--                            <p>var len = list.length;</p><p>var arr = [];</p><p>var reg = new RegExp(keyWord);</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p>-->
                                        <!--                            <p>&nbsp; &nbsp; if(list[i].match(reg)){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p><p><br></p>-->

                                        ${article.articleContent}

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-2">

                    <div class="col-md-12 bgc">

                        <div class="new">
                            <span><i class="el-certificate"></i>评论专区</span>
                            <small>共有${commentListCount}条评论</small>
                        </div>
                    </div>

                    <div class="container mt-4">
                        <div class="row">
                            <div class="col-md-12 bgc">
                                <div>
                                    <form action="/addcomments" method="post">

                                        <div class="form-group">
                                            <label><input value="${article.articleId}" type="text"
                                                          class="form-control form-control-lg" id="articleId"
                                                          name="articleId" style="display: none" readonly="readonly">
                                            </label>
                                            <label><input value="${user.userId}" type="text"
                                                          class="form-control form-control-lg" id="userId"
                                                          name="userId" style="display: none" readonly="readonly">
                                            </label>
                                            <label><input value="${user.userName}" type="text"
                                                          class="form-control form-control-lg" id="userName"
                                                          name="userName" style="display: none" readonly="readonly">
                                            </label>
                                            <label><input value="${user.userEmail}" type="text"
                                                          class="form-control form-control-lg" id="userEmail"
                                                          name="userEmail" style="display: none" readonly="readonly">
                                            </label>
                                            <label><input value="${user.userAvatar}" type="text"
                                                          class="form-control form-control-lg" id="userAvatar"
                                                          name="userAvatar" style="display: none" readonly="readonly">
                                            </label>

                                            <label>输入评论内容：</label>
                                            <textarea type="text" class="form-control form-control-lg"
                                                      id="commentcontent" placeholder="输入内容"
                                                      name="commentcontent" required="required"
                                                      <#--style="width: 200px;height:60px;"-->></textarea>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-lg btn-primary btn-block"
                                                   value="发表评论"/>
                                        </div>
                                    </form>
                                </div>


                                <#if commentListCount==0>

                                    <div>
                                        这里还没有评论哦。
                                    </div>

                                <#else >

                                    <div id="useToLocate">
                                        <#list commentList as comment>

                                            <#if comment.commentPid==0><#--进行头像的显示-->
                                                <div><span><a href="">${comment.commentAuthorName}</a>:<pre>${comment.commentContent}</pre></span>

                                                </div>
                                                <div>${comment.commentCreateTime?string("yyyy-MM-dd HH:mm:ss")}</div>
                                            <#--<div>发出者的ID为：${comment.commentAuthorId}</div>-->

                                            <#else>
                                                <div><span>回复
                                                            ${comment.commentPname}:<pre>${commentService.getCommentById(comment.commentPid).commentContent}</pre></span>
                                                    <pre><a href="/space/${comment.commentAuthorId}">${comment.commentAuthorName}</a>:${comment.commentContent}</pre>
                                                </div>
                                                <div>${comment.commentCreateTime?string("yyyy-MM-dd HH:mm:ss")}</div>
                                            <#--<div>发出者的ID为：${comment.commentAuthorId}</div>-->
                                            </#if>
                                            <#if comment.commentAuthorId==user.userId >
                                                <div>
                                                    <a href="/deletecomment/${comment.commentId}/${article.articleId}"
                                                       class="text-primary">点击删除自己的评论</a>
                                                </div>
                                            </#if>

                                            <div id="pressToShow${comment.commentId}">
                                                <div>


                                                    <form action="/replycomment" method="post">
                                                        <div class="form-group">
                                                            <label><input value="${comment.commentId}" type="text"
                                                                          class="form-control form-control-lg"
                                                                          id="commentPid"
                                                                          name="commentPid" style="display: none"
                                                                          readonly="readonly"> </label>
                                                            <label><input value="${comment.commentAuthorName}"
                                                                          type="text"
                                                                          class="form-control form-control-lg"
                                                                          id="commentPname"
                                                                          name="commentPname" style="display: none"
                                                                          readonly="readonly"> </label>
                                                            <label><input value="${article.articleId}" type="text"
                                                                          class="form-control form-control-lg"
                                                                          id="articleId"
                                                                          name="articleId" style="display: none"
                                                                          readonly="readonly"> </label>
                                                            <label><input value="${user.userId}" type="text"
                                                                          class="form-control form-control-lg"
                                                                          id="userId"
                                                                          name="userId" style="display: none"
                                                                          readonly="readonly"> </label>
                                                            <label><input value="${user.userName}" type="text"
                                                                          class="form-control form-control-lg"
                                                                          id="userName"
                                                                          name="userName" style="display: none"
                                                                          readonly="readonly"> </label>
                                                            <label><input value="${user.userEmail}" type="text"
                                                                          class="form-control form-control-lg"
                                                                          id="userEmail"
                                                                          name="userEmail" style="display: none"
                                                                          readonly="readonly"> </label>
                                                            <label><input value="${user.userAvatar}" type="text"
                                                                          class="form-control form-control-lg"
                                                                          id="userAvatar"
                                                                          name="userAvatar" style="display: none"
                                                                          readonly="readonly"> </label>
                                                            <label>输入评论内容：</label>
                                                            <textarea type="text" class="form-control form-control-lg"
                                                                      id="replycommentcontent"
                                                                      placeholder="回复用户${userService.getUserById(comment.commentAuthorId).userName }"
                                                                      name="replycommentcontent"
                                                                      required="required"></textarea>
                                                            <input type="submit" id="show"
                                                                   class="btn btn-lg btn-primary btn-block"
                                                                   value="点击回复"/>
                                                        </div>

                                                        <#--<p>"comment.commentAuthorId is "</p>
                                                        <p>${comment.commentAuthorId}</p>
                                                        <br>
                                                        <p>"user.userId is "</p>
                                                        <p>${user.userId}</p>
                                                        <br>-->


                                                    </form>

                                                </div>
                                            </div>
                                            <button type="button" id="show${comment.commentId}"
                                                    value="${comment.commentId}"
                                                    onclick="showDiv1${comment.commentId}()">点击回复
                                            </button>
                                            <button type="button" id="hide${comment.commentId}"
                                                    value="${comment.commentId}"
                                                    onclick="hiddenDiv1${comment.commentId}()">取消回复
                                            </button>
                                            <div>
                                                <a href="/report/${comment.commentId}/${article.articleId}">点击举报</a>
                                            </div>
                                        </#list>
                                    </div>
                                </#if>
                                <#--<#if pagingDealList??>
                                    <#include "Paging.ftl">
                                    <@paging_macro.paging pagingList=pagingDealList url="/article/${pagingDealList.rows.get(1).commentAuthorId}"/>
                                </#if>-->
                                <#--<div class="col-md-4 bgc mb-4 ">-->
                                <#--<div class="card mb-4 box-shadow  mt-4">-->
                                <#--<div class="showimg">
                                    <img class="card-img-top" style=" width: 100%; display: block;"
                                         src="/images/7.jpg" data-holder-rendered="true">
                                </div>

                                <div class="card-body">
                                    <a href="#">测试图文</a>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group showtitle">
                                            <i class="el-time"></i>2019-04-03
                                        </div>
                                        <small class="text-muted"><i class="el-fire"></i>9 mins</small>
                                    </div>
                                </div>-->
                            </div>
                            <#--</div>-->

                            <#--<div class="col-md-4 bgc mb-4">
                                <div class="card mb-4 box-shadow mt-4">
                                    <div class="showimg showtitle">
                                        <img class="card-img-top" style=" width: 100%; display: block;"
                                             src="/images/8.jpg" data-holder-rendered="true">
                                    </div>
                                    <div class="card-body">
                                        <a href="#">测试图文</a>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group showtitle">
                                                <i class="el-time"></i>2019-04-03
                                            </div>
                                            <small class="text-muted">9 mins</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 bgc mb-4">
                                <div class="card  box-shadow mt-4">
                                    <div class="showimg">
                                        <img class="card-img-top" style=" width: 100%; display: block;"
                                             src="/images/9.jpg" data-holder-rendered="true">
                                    </div>
                                    <div class="card-body">
                                        <a href="#">测试图文</a>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group showtitle">
                                                <i class="el-time"></i>2019-04-03
                                            </div>
                                            <small class="text-muted">9 mins</small>
                                        </div>
                                    </div>
                                </div>
                            </div>-->


                        </div>
                    </div>


                </div>


            </div>
        </div>
    </div>

</div>

<!--底部-->
<footer id="footer">
    <div class="container">
        <div class="row footer-row">
            <div class="col-md-8 heng">
                <ul>
                    <li data-v-0c3930dc="">
                        <div class="logo" data-v-7d8b0b55="" data-v-0c3930dc="">
                            <svg version="1.1" id="图层_1"
                                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                 x="0px" y="0px" viewBox="0 0 84 30" xml:space="preserve"
                                 style="enable-background:new 0 0 84 30;" data-v-7d8b0b55="">
                                        <g id="Page-1" data-v-7d8b0b55="">
                                            <g id="Group-4" transform="translate(-35.000000, -103.000000)"
                                               data-v-7d8b0b55="">
                                                <g id="小黑盒-白-copy-3" transform="translate(35.000000, 103.000000)"
                                                   data-v-7d8b0b55="">
                                                    <path id="logo_heybox_with_en" d="M23.5,7.8C23.8,7.9,24,8.3,24,8.6v12.7c0,0.3-0.2,0.7-0.5,0.8l-3.8,2.2
                        c-0.3,0.2-0.5,0-0.5-0.3V11.7c0-0.3-0.2-0.7-0.5-0.8l-3.8-2.2c-0.3-0.2-0.5,0-0.5,0.3V12c0,0.3-0.2,0.5-0.6,0.5h-3.7
                        c-0.3,0-0.5-0.2-0.5-0.5V0.3c0-0.3,0.2-0.4,0.5-0.3l1.4,0.8C11.8,1,12,1.2,12,1.2c0,0,0.2,0.1,0.5,0.3L23.5,7.8z M9.6,17.9
                        c0-0.3,0.2-0.5,0.5-0.5h3.7c0.3,0,0.5,0.2,0.6,0.5v11.7c0,0.3-0.2,0.4-0.5,0.3l-4.7-2.7C9,27.1,8.8,27,8.8,27
                        c0,0-0.2-0.1-0.5-0.3l-7.8-4.5C0.2,22,0,21.7,0,21.4V8.6c0-0.3,0.2-0.7,0.5-0.8l3.8-2.2c0.3-0.2,0.5,0,0.5,0.3v12.5
                        c0,0.3,0.2,0.7,0.5,0.8l3.8,2.2c0.3,0.2,0.5,0,0.5-0.3L9.6,17.9z M28.7,15.8v-2c1.7-2.3,2.7-5.3,2.9-9H34
                        C33.8,9.6,32,13.3,28.7,15.8z M33.7,18.7v-1.6h1.4c0.8,0,1.1-0.3,1.1-1V1.7h2.6v14.6c0,1.6-0.9,2.4-2.6,2.4H33.7z M46,15.8
                        c-3.4-2.5-5.1-6.1-5.3-11h2.3c0.3,3.8,1.2,6.8,2.9,9L46,15.8L46,15.8z M48.6,9.2V2.3h15.1v4.3c0.1,1.8-0.8,2.7-2.6,2.6h-3.8v1.4
                        H64V12h-6.6v1.4h7.5v1.5H47.4v-1.5h7.5V12h-6.6v-1.4h6.6V9.2H48.6z M47.9,18.8c0.2-1.1,0.5-2.1,1-3.1h2c-0.5,1.3-0.7,2.3-0.8,3.1
                        H47.9z M50.8,7.8h4.1v-4h-4.1V7.8z M52.4,7.1c-0.5-0.9-0.7-1.7-0.8-2.6h1.8c0.1,0.9,0.4,1.7,0.8,2.6H52.4z M53.3,18.8
                        c-0.1-0.9-0.3-1.9-0.6-3.1h2c0.4,1,0.6,2,0.8,3.1H53.3z M57.8,18.8c-0.1-0.9-0.3-1.9-0.8-3.1h2c0.5,1,0.8,2,1,3.1H57.8z
                         M61.5,3.8h-4.1v4h3c0.8,0.1,1.2-0.4,1.1-1.2V3.8z M58,7.1c0.4-0.9,0.7-1.8,0.8-2.6h1.9c-0.2,1-0.5,1.9-0.8,2.6H58z M62.3,18.8
                        c-0.2-1-0.5-2-0.9-3.1h2c0.5,1,0.9,2,1.1,3.1H62.3z M83.6,6.6c-1.7-0.3-3.2-0.6-4.5-1v0.9h-8.5V5.6c-1.3,0.4-2.7,0.7-4.5,1V5.2
                        c3.4-0.8,5.8-2,7.4-3.6h2.6c1.6,1.7,4,2.9,7.4,3.6L83.6,6.6L83.6,6.6z M66.3,18.4v-1.5H68v-4.4h13.9v4.4h1.7v1.5H66.3z
                         M68.8,11.5V7.4H81v2c0,1.5-0.7,2.2-2.3,2.2H68.8z M70.3,14v2.9H72V14H70.3z M71.1,10.2H78c0.6,0.1,0.9-0.3,0.8-0.9V8.7h-7.7
                        V10.2z M74.9,3.5c-0.9,0.7-2,1.3-3.4,1.8h6.7C76.9,4.7,75.8,4.1,74.9,3.5z M74,14v2.9h1.8V14H74z M79.7,14h-1.8v2.9h1.8V14z
                         M32.6,28.5h-1v-7.1h1v3h2.9v-3h1v7.1h-1v-3.1h-2.9V28.5z M44.4,28.5h-3.7v-7.1h3.7v0.9h-2.6v2.1h2.6v0.9h-2.6v2.1h2.6V28.5z
                         M51,26v2.5h-1v-2.6l-2.2-4.5H49l1.6,3.4l1.6-3.4h1.1L51,26z M58.1,21.4c0.8,0,1.3,0.2,1.7,0.5c0.4,0.3,0.6,0.8,0.6,1.4
                        c0,0.3-0.1,0.5-0.2,0.8c-0.1,0.2-0.3,0.4-0.6,0.6c0.3,0.1,0.6,0.3,0.8,0.6c0.2,0.3,0.3,0.6,0.3,1.1c0,0.3-0.1,0.6-0.2,0.9
                        c-0.1,0.3-0.3,0.5-0.5,0.7c-0.2,0.2-0.5,0.3-0.7,0.4c-0.3,0.1-0.7,0.1-1.1,0.1h-1.6v-7.1H58.1z M57.6,27.5h0.8
                        c0.5,0,0.8-0.1,1-0.3c0.2-0.2,0.3-0.4,0.3-0.8c0-0.4-0.1-0.7-0.3-0.9c-0.2-0.2-0.6-0.3-1-0.3h-0.8V27.5z M57.6,24.4h0.3
                        c0.5,0,0.9-0.1,1.1-0.2c0.2-0.2,0.3-0.4,0.3-0.8c0-0.3-0.1-0.6-0.3-0.7c-0.2-0.2-0.5-0.2-0.9-0.2h-0.5V24.4z M64.3,24.9
                        c0-0.5,0.1-1,0.3-1.4c0.2-0.4,0.5-0.8,0.8-1.2c0.3-0.3,0.7-0.6,1.1-0.8c0.4-0.2,0.9-0.3,1.4-0.3c0.5,0,1,0.1,1.4,0.3
                        s0.8,0.4,1.2,0.8c0.4,0.4,0.6,0.7,0.8,1.2s0.3,0.9,0.3,1.4c0,0.5-0.1,1-0.2,1.4c-0.2,0.4-0.4,0.8-0.7,1.1
                        c-0.4,0.4-0.8,0.7-1.2,0.9c-0.5,0.2-0.9,0.3-1.5,0.3c-0.5,0-1-0.1-1.5-0.3c-0.4-0.2-0.9-0.5-1.2-0.9c-0.3-0.3-0.5-0.7-0.7-1.1
                        C64.4,25.9,64.3,25.4,64.3,24.9z M65.4,24.9c0,0.4,0.1,0.7,0.2,1c0.1,0.3,0.3,0.6,0.5,0.9c0.2,0.3,0.5,0.4,0.8,0.6
                        c0.3,0.1,0.6,0.2,1,0.2c0.7,0,1.3-0.3,1.8-0.8c0.5-0.5,0.7-1.2,0.7-1.9c0-0.3-0.1-0.6-0.2-0.9c-0.1-0.3-0.3-0.6-0.5-0.8
                        c-0.3-0.3-0.6-0.5-0.9-0.6s-0.6-0.2-1-0.2c-0.3,0-0.7,0.1-1,0.2c-0.3,0.1-0.6,0.3-0.8,0.5c-0.2,0.2-0.4,0.5-0.6,0.9
                        C65.5,24.2,65.4,24.6,65.4,24.9z M77.6,25.7l-1.8,2.8h-1.2l2.4-3.6l-2.3-3.5h1.2l1.7,2.7l1.7-2.7h1.2l-2.3,3.5l2.3,3.6h-1.2
                        L77.6,25.7z" class="st0" style="fill: #ffffff" data-v-7d8b0b55=""></path>
                                                    <!---->
                                                </g>
                                            </g>
                                        </g>
                                    </svg>
                        </div>
                    </li>

                    <li data-v-0c3930dc=""><a href="/heybox/about" class="nav-item" data-v-0c3930dc=""
                                              one-link-mark="yes">关于我们</a></li>
                    <li data-v-0c3930dc=""><a href="/heybox/contact" class="nav-item" data-v-0c3930dc=""
                                              one-link-mark="yes">联系我们</a></li>
                    <li data-v-0c3930dc=""><a href="/joinus/index" class="nav-item" data-v-0c3930dc=""
                                              one-link-mark="yes">加入我们</a></li>
                    <li data-v-0c3930dc=""><a href="/open" class="nav-item" data-v-0c3930dc=""
                                              one-link-mark="yes">开放平台</a></li>
                </ul>
                <div class="copy-right" data-v-0c3930dc="">
                    <p class="copy-right-1" data-v-0c3930dc="">清枫（北京）科技有限公司 2015-2020 © All Rights Reserved.</p>
                    <p class="copy-right-2" data-v-0c3930dc=""><a target="_blank"
                                                                  href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010502034222"
                                                                  data-v-0c3930dc="" one-link-mark="yes">京公网安备11010502034222号</a>
                        | <a target="_blank"
                             href="https://beian.miit.gov.cn/" data-v-0c3930dc=""
                             one-link-mark="yes">京ICP备15018522号-6</a> | 京网文[2017]8080-895号 | 京ICP证B2-20180020</p>
                    <p class="copy-right-2" data-v-0c3930dc="">违法和不良信息举报电话：010-84158300　举报邮箱：jubao@xiaoheihe.cn
                    </p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <a href="https://dl.max-c.com/app/heybox/heybox-release.apk" class="android" data-v-0c3930dc=""
               one-link-mark="yes"></a>
            <a href="https://itunes.apple.com/cn/app/id1244505010" class="iOS" data-v-0c3930dc=""
               one-link-mark="yes"></a>
        </div>
    </div>

    </div>

    <div class="row">

    </div>
    </div>
</footer>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/lib/jquery/jquery.js"></script>
<script src="https://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script src="/lib/bootstrap/js/bootstrap.js"></script>
<script src="/js/wow.js"></script>
<script>
    new WOW().init();//把wow初始化

</script>


<script>
    window.onload = function () {
        var art_list = document.getElementById('box');
        var art_list_a = art_list.getElementsByTagName('a');

        for (var i = 0; i < art_list_a.length; i++) {

            var aclick = art_list_a[i];

            aclick.onclick = function () {

                for (var j = 0; j < art_list_a.length; j++) {
                    art_list_a[j].className = '';
                    art_list_a[j].style.color = '#000000';
                }
                this.className = 'actives';
                this.style.color = '#ffffff';
            };


        }

    }
</script>


<#--<li><a id="likea" title="点赞" href="#"><i class="el-heart"></i><i id="likei">${article.articleLikeCount}</i></a></li>-->
<#--<li><a title="浏览数"><i class="el-eye-open"></i><i id="viewi">${article.articleViewCount}</i></a></li>-->
<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
<script src="/js/jquery.cookie.js" type="text/javascript"></script>
<script type="text/javascript">
    function increaseViewCount() {
        if ($.cookie("viewId") != ${article.articleId}) {
            $.ajax({
                async: false,
                type: "POST",
                url: "${springMacroRequestContext.contextPath}/article/view",
                // headers: { "X-CSRFtoken":$.cookie("csrftoken")},
                data: {articleId: ${article.articleId}},
                dataType: "text",
                success: function (data) {
                    //alert(data);
                    $("#viewi").html(data);
                    $.cookie(
                        "viewId",
                        ${article.articleId},//写入cookie
                        {
                            "path": "/", //cookie的有效路径
                        }
                    );
                },
                error: function () {
                    //alert("获取数据出错!");
                },
            });
        }
    }

    increaseViewCount();

    $("#likea").click(function () {
        if ($.cookie("likeId") != ${article.articleId}) {
            $.ajax({
                async: false,
                type: "POST",
                url: "${springMacroRequestContext.contextPath}/article/like",
                // headers: { "X-CSRFtoken":$.cookie("csrftoken")},
                data: {articleId: ${article.articleId}},
                dataType: "text",
                success: function (data) {
                    //alert(data);
                    $("#likei").html(data);
                    $.cookie(
                        "likeId",
                        ${article.articleId},//写入cookie
                        {
                            "path": "/", //cookie的有效路径
                        }
                    );
                },
                error: function () {
                    //alert("获取数据出错!");
                },
            });
        }
    });
</script>

</body>
</html>