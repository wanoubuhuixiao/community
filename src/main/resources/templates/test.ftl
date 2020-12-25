<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8"/>
    <title>test</title>
</head>
<body>
<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Account</th>
        <th>Password</th>
    </tr>
    <#list users as user>
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.account}</td>
            <td>${user.password}</td>
        </tr>
    </#list>
</table>
</body>
</html>