
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>test</title>
</head>
<body>
<p>
    点击 <a href="/index">这里</a>返回首页
</p>
<div>
    <form action="/logout" method="post">
        点击<input type="submit" value="登出"/>
    </form>
</div>
<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Password</th>
        <th>等级</th>
        <th>是否为管理员</th>
    </tr>
    <#list users as user>
        <tr>
            <td>${user.userId}</td>
            <td>${user.userName}</td>
            <td>${user.userPassword}</td>
            <td>${user.userLevel}</td>
            <td>${user.userStatus}</td>
        </tr>
    </#list>
</table>
</body>
</html>