<%--
  Created by IntelliJ IDEA.
  User: hehu
  Date: 2017/1/3
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Spring Login用户信息修改</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Spring Login 修改用户</h1>
    <hr/>
    <form:form action="${pageContext.request.contextPath}/admin/users/update" method="post" commandName="user" role="form">
        <div class="form-group">
            <label for="firstName">Nickname:&nbsp;</label>
            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="Enter Nickname" value="${user.nickname}"/>
        </div>
        <div class="form-group">
            <label for="firstName">First Name:&nbsp;</label>
            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter FirstName" value="${user.firstName}"/>
        </div>
        <div class="form-group">
            <label for="firstName">Last Name:&nbsp;</label>
            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter LastName" value="${user.lastName}"/>
        </div>
        <div class="form-group">
            <label for="password">Password:&nbsp;</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password:" value="${user.password}"/>
        </div>
        <input type="hidden" id="id" name="id" value="${user.id}">
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>
</div>
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
