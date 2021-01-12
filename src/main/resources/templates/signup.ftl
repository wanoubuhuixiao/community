<#import "/spring.ftl" as spring />
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/animate.css">
    <link rel="stylesheet" href="/css/font-icon.css">
    <link rel="stylesheet" href="/css/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.max-c.com/version_1_5_58/common.12a94361288ce402f996.css">
    <link rel="stylesheet" href="/css/login.css">

    <link rel="shortcut icon" sizes="48x48" href="https://cdn.max-c.com/logo/heybox_bbs_128_128.png">
    <title>小黑盒-注册</title>
</head>

<body>
    <div class="container">
        <div class="row bg">
            <!--导航-->
            <nav class="navbar navbar-expand-lg navbar-light nav-color-nav  navbar-lk text-dark">
                <div class="container">
                    <div class="logo-wrapper" data-v-8f2efb28="">
                        <div class="logo" data-v-7d8b0b55="" data-v-8f2efb28="">
                            <svg version="1.1" id="图层_1" xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 84 30"
                                xml:space="preserve" style="enable-background:new 0 0 84 30;" data-v-7d8b0b55="">
                                <g id="Page-1" data-v-7d8b0b55="">
                                    <g id="Group-4" transform="translate(-35.000000, -103.000000)" data-v-7d8b0b55="">
                                        <g id="小黑盒-白-copy-3" transform="translate(35.000000, 103.000000)"
                                            data-v-7d8b0b55="">
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
                                <a class="nav-link"> <span class="sr-only">(current)</span></a>
                            </li>
                        </ul>
                        <!--<form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>-->
                    </div>
                    <div class="collapse navbar-collapse justify-content-center" id="nabmune">
                        <ul class="navbar-nav nav-color ">
                            <li class="nav-item active ">
                                <a class="nav-link" href="/signup">注册 <span class="sr-only">(current)</span></a>
                            </li>
                        </ul>
                        <!--<form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>-->
                    </div>
                </div>
            </nav>
            <div class="container">
                <div class="row bg">
                    <div class="col-md-4 login-form">
                        <div class="container">
                            <div class="row mt-2 wow">
                                <div class="col-md-12 bgc">
                                    <form class="form-horizontal" id="loginForm" action="/signup" method="post">
                                        <@spring.bind "user" />
                                        <div class="form-group">
                                            <label for="username" class="col-sm-4 control-label">用户名</label>
                                            <div class="col-sm-8">
                                                <@spring.bind "user.userName" />
                                                <input value="${user.userName!}" type="text" class="form-control" id="username"
                                                    placeholder="请输入用户名" name="userName">
                                                <span class="text-danger">
                                                    <@spring.showErrors "" />
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="col-sm-4 control-label">密码</label>
                                            <div class="col-sm-8">
                                                <@spring.bind "user.userPassword" />
                                                <input value="${user.userPassword!}" type="password" class="form-control" id="password"
                                                    placeholder="请输入密码" name="userPassword">
                                                <span class="text-danger">
                                                    <@spring.showErrors "" />
                                                </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="col-sm-4 control-label">再次输入密码</label>
                                            <div class="col-sm-8">
                                                <@spring.bind "user.userRePassword" />
                                                <input value="${user.userRePassword!}" type="password" class="form-control" id="password"
                                                    placeholder="请再次输入密码" name="userRePassword">
                                                <span class="text-danger">
                                                    <@spring.showErrors "" />
                                                </span>
                                            </div>
                                        </div>
                                        <@spring.bind "user.userStatus" />
                                        <input hidden type="text" name="userStatus" value="1">
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <input type="submit" class="btn btn-primary btn-lg" id="denglu"
                                                    value="注册" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <a href="/signin">已有账号？去登录</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.js"></script>

</body>

</html>