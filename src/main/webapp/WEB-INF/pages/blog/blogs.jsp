<%--
  Created by IntelliJ IDEA.
  User: hsb
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
    <title>桔梗博客</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".btn-danger").click(function () {
                var $this = $(this);
                var id = $this.attr("blogId");
                $this.attr("data-toggle","modal");
                $this.attr("data-target","#myModal");
                $("#deleteblog").attr("blogId",id);
                var name = $this.parents("tr").find("td:eq(1)").html();
                $(".modal-body").html($(".modal-body").html()+name);
            });
            $("#deleteblog").click(function () {
                var id = $("#deleteblog").attr("blogId");
                $.post("${pageContext.request.contextPath}/blog/blogs/delete", {id: id}, function () {
                    $("#deleteUser").removeAttr("blogId");
                    location.href = "${pageContext.request.contextPath}/blog/blogs";
                });
            })
        })
    </script>
</head>
<body>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    删除博客
                </h4>
            </div>
            <div class="modal-body">
                是否删除博客：
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="deleteblog">删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<div class="container">
    <h1>博客管理</h1>
    <hr/>
    <h3>所有博客 <a href="${pageContext.request.contextPath}/blog/blogs/add" type="button" class="btn btn-primary btn-sm">添加</a></h3>
    <c:if test="${empty blogList}">
        <div class="alert alert-warning" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>Blog列表为空，请&nbsp;<a href="${pageContext.request.contextPath}/blog/blogs/add" type="button" class="btn btn-primary btn-sm">添加</a>
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
                        <a type="button" id="delete" class="btn btn-sm btn-danger" blogId="${blog.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <div class="text-center">
        <a href="${pageContext.request.contextPath}/" type="button" class="btn btn-sm btn-default">返回</a>
    </div>
</div>
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>