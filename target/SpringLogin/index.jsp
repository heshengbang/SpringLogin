<%@page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>桔梗博客</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>首页</h1>
    <h2>出现此页面，说明你获得系统使用权限</h2>
    <div class="form-group">
        <a href="${pageContext.request.contextPath}/admin/users" type="button" class="btn btn-info">用户管理</a>
        <a href="${pageContext.request.contextPath}/blog/blogs" type="button" class="btn btn-info">博客管理</a>
    </div>
</div>
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
