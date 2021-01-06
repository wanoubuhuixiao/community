<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8"/>
    <title>小黑盒-登录</title>
</head>
<body>
<form action="/login" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div>
        <label> 用户名: <input type="text" name="username"/>
        </label>
    </div>
    <div>
        <label> 密码: <input type="password" name="password"/>
        </label>
    </div>
    <div>
        <input type="submit" value="登录"/>
    </div>
</form>
</body>
</html>
