<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>伽蓝忘川</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
<style>
    body {
        padding-top: 50px;
        padding-bottom: 40px;
        color: #5a5a5a;
    }

    /* 下面是左侧导航栏的代码 */
    .sidebar {
        position: fixed;
        top: 51px;
        bottom: 0;
        left: 0;
        z-index: 1000;
        display: block;
        padding: 20px;
        overflow-x: hidden;
        overflow-y: auto;
        background-color: #ddd;
        border-right: 1px solid #eee;
    }

    .nav-sidebar {
        margin-right: -21px;
        margin-bottom: 20px;
        margin-left: -20px;
    }

    .nav-sidebar > li > a {
        padding-right: 20px;
        padding-left: 20px;
    }

    .nav-sidebar > .active > a,
    .nav-sidebar > .active > a:hover,
    .nav-sidebar > .active > a:focus {
        color: #fff;
        background-color: #428bca;
    }
    已久

    .main {
        padding: 20px;
    }

    .main .page-header {
        margin-top: 0;
    }
</style>

</head>

<body>
    <!--下面是顶部导航栏的代码-->
    <nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=path %>">AndOne博客管理</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="<%=path %>">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">功能<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="dropdown-header">业务功能</li>
                        <li class="active"><a href="#">博客列表</a></li>
                        <li><a href="/jsp/addPost.jsp">创建博客</a></li>
                        <li><a href="<%=path%>/image?type=4">图片管理</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">系统功能</li>
                        <li><a href="#">设置</a></li>
                    </ul>
                </li>
                <li><a href="#">帮助</a></li>
            </ul>
            <c:if test="${not empty username}">
            	<ul class="nav navbar-nav navbar-right">
	              <li><a href="${pageContext.request.contextPath }/logout" data-toggle="modal" data-target="#about-modal">退出</a></li>
	            </ul>
            </c:if>
        </div>
    </div>
</nav>

<!—自适应布局-->
<div class="container-fluid">
    <div class="row">
        <!—左侧导航栏-->

        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="#">首页</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="${pageContext.request.contextPath }/listpost">博客列表</a></li>
                <li><a href="${pageContext.request.contextPath }/jsp/addPost.jsp">创建博客</a></li>
                <li><a href="${pageContext.request.contextPath }/listcomment">评论列表</a></li>
                <li><a href="<%=path%>/image?type=4">图片管理</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="#">设置</a></li>
                <li><a href="#">帮助</a></li>
            </ul>
        </div>
        <!—右侧管理控制台-->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <!-- 主要内容 -->
            <div class="container summary">

                <!-- 简介 -->
                <div class="row" id="summary-container">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-10">
		            
		         	</div>
		            <div class="col-md-1">
		            </div>
     </div>

     <!-- 特性 -->

     <hr class="feature-divider">

</div>
</div>


<footer class="footer">
    <!-- <p class="pull-right"><a href="#top">回到顶部</a></p> -->

    <p class="text-center">&copy; 2016 AndOne </p>
</footer>

</div>
</div>
</div>
</div>
</div>
</div>


<script src="/jsp/js/jquery-1.11.1.min.js"></script>
<script src="/jsp/js/bootstrap.min.js"></script>
</body>
</html>