<%--
  Created by IntelliJ IDEA.
  User: hehu
  Date: 2017/1/3
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Spring Login博客管理</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Spring Login 博客系统 - 博客管理</h1>
    <hr/>
    <h3>所有博客 <a href="${pageContext.request.contextPath}/blog/blogs/add" type="button" class="btn btn-primary btn-sm">添加</a></h3>
    <c:if test="${empty blogList}">
        <div class="alert alert-warning" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>Blog列表为空，请<a href="${pageContext.request.contextPath}/blog/blogs/add" type="button" class="btn btn-primary btn-sm">添加</a>
        </div>
    </c:if>
    <c:if test="${!empty blogList}">
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>标题</th>
                <th>作者</th>
                <th>发布日期</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${blogList}" var="blog">
                <tr>
                    <td>${blog.id}</td>
                    <td>${blog.title}</td>
                    <td>${blog.blogByUserId.nickname}, ${blog.blogByUserId.firstName} ${blog.blogByUserId.lastName}</td>
                    <td><fmt:formatDate value="${blog.pubDate}" pattern="yyyy-MM-dd" /></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/blog/blogs/show/${blog.id}" type="button" class="btn btn-sm btn-success">详情</a>
                        <a href="${pageContext.request.contextPath}/blog/blogs/update/${blog.id}" type="button" class="btn btn-sm btn-warning">修改</a>
                        <a href="${pageContext.request.contextPath}/blog/blogs/delete/${blog.id}" type="button" class="btn btn-sm btn-danger">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>




















