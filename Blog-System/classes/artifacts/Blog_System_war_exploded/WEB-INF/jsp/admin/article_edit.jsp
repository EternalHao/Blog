
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/static/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/static/js/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript"  src="/static/js/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<div style="position: relative;top: 10%">
    <c:if test="${!empty succ}">
        <div class="alert alert-success" role="alert">
                ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger" role="alert">
                ${error}
        </div>
    </c:if>
</div>
<div class="container">
    <form action="/admin/article/edit/do" method="post">
        <input type="hidden" value="${article.id}" name="id">
        <div class="form-group">
            <label for="title">文章标题</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="文章标题" value="${article.title}">
        </div>
        <div class="form-group">
            <label for="catalogId">栏目</label>
            <select class="form-control" id="catalogId" name="catalogId">
                <option value="0" <c:if test="${article.catalogId==0}">selected="selected"</c:if>>学习</option>
                <option value="1" <c:if test="${article.catalogId==1}">selected="selected"</c:if>>生活</option>
            </select>
        </div>
        <div class="form-group">
            <label for="keywords">关键字</label>
            <input type="text" class="form-control" id="keywords" name="keywords" placeholder="关键字" value="${article.keywords}">
        </div>
        <div class="form-group">
            <label for="desci">简介</label>
            <textarea class="form-control" id="desci" rows="3" name="desci" placeholder="简介">${article.desci}</textarea>
        </div>
        <div id="cont" style="display: none">
            ${article.content}
        </div>
        <div class="form-group">
            <label for="editor">内容</label>
            <script id="editor" type="text/plain"  name="content" style="width:1024px;height:500px;" >
            </script>
            </div>
            <input type="submit" />
                </form>

                <script>
                $(function(){
                    var ue = UE.getEditor('editor');
                    ue.ready(function() {
                        ue.setContent($("#cont").html());
                    });
                });
            </script>
        </div>
</body>
</html>