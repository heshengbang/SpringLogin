<%--
  Created by IntelliJ IDEA.
  User: hehu
  Date: 2017/1/6
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial0scale=1">
    <title>桔梗博客</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>修改博客</h1>
    <hr/>
    <form:form action="${pageContext.request.contextPath}/blog/blogs/updateBlog" method="post" commandName="blog" role="form">
    <div class="form-group">
        <label for="title">Title:&nbsp;</label>
        <input type="text" class="form-control" id="title" name="title" value="${blog.title}"/>
    </div>
        <div class="form-group">
            <label for="blogByUserId.id">Author:</label>
            <select class="form-control" id="blogByUserId.id" name="blogByUserId.id">
                <c:forEach items="${userList}" var="user">
                    <c:if test="${user.id==blog.blogByUserId.id}">
                        <option value="${user.id}" selected="selected">${user.nickname}, ${user.firstName} ${user.lastName}</option>
                    </c:if>
                    <c:if test="${user.id!=blog.blogByUserId.id}">
                        <option value="${user.id}">${user.nickname}, ${user.firstName} ${user.lastName}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="content">Content:</label>
            <textarea class="form-control" id="content" name="content" rows="3">${blog.content}</textarea>
        </div>
        <div class="form-group">
            <label for="pubDate">Publish Date:</label>
            <input type="date" class="form-control" id="pubDate" name="pubDate" value='<fmt:formatDate value="${blog.pubDate}" pattern="yyyy-MM-dd"/>'/>
        </div>
        <input type="hidden" id="id" name="id" value="${blog.id}"/>
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
            <a href="${pageContext.request.contextPath}/blog/blogs" type="button" class="btn btn-sm btn-default">返回</a>
        </div>
    </form:form>
</div>
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
