<%--
  Created by IntelliJ IDEA.
  User: hehu
  Date: 2016/12/30
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>桔梗博客</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".btn-danger").click(function () {
                var $this = $(this);
                var id = $this.attr("userId");
                $this.attr("data-toggle","modal");
                $this.attr("data-target","#myModal");
                $("#deleteUser").attr("userId",id);
                var name = $this.parents("tr").find("td:eq(1)").html();
                $(".modal-body").html("是否删除用户："+name);
            });
            $("#deleteUser").click(function () {
                var id = $("#deleteUser").attr("userId");
                $.post("${pageContext.request.contextPath}/admin/users/delete",{id:id},function(data){
                    $("#deleteUser").removeAttr("userId");
                    if(data == "SUCCESS") {
                        location.reload();
                    }else {
                        $(".modal-body").html("失败！该用户还有 "+data+" 篇博客文章在本平台中");
                        setTimeout(reloadPage,3000);
                    }
                });
            });
            var reloadPage = function(){
                location.reload();
            }
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
                    删除用户
                </h4>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="deleteUser">删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



<div class="container">
    <h1>用户管理</h1>
    <hr/>
    <h3>所有用户&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/users/add" type="button" class="btn btn-primary btn-sm">添加</a></h3>
    <c:if test="${empty userList}">
        <div class="alert alert-warning" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>User表为空，请&nbsp;<a href="${pageContext.request.contextPath}/admin/users/add" type="button" class="btn btn-primary btn-sm">添加</a>
        </div>
    </c:if>
    <c:if test="${!empty userList}">
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>昵称</th>
                <th>姓名</th>
                <th>密码</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.nickname}</td>
                    <td>${user.firstName} ${user.lastName}</td>
                    <td>${user.password}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/users/show/${user.id}" type="button" class="btn btn-sm btn-success">详情</a>
                        <a href="${pageContext.request.contextPath}/admin/users/update/${user.id}" type="button" class="btn btn-sm btn-warning">修改</a>
                        <a type="button" id="delete" class="btn btn-sm btn-danger" userId="${user.id}">删除</a>
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
