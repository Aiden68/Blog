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
    <title>某管理系统</title>
    <link href="<%=path%>/jsp/css/bootstrap.min.css" rel="stylesheet" type="text/css">

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
            <a class="navbar-brand" href="#">AneOne博客管理</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="<%=path %>">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">功能<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="dropdown-header">业务功能</li>
                        <li class="active"><a href="#">博客列表</a></li>
                        <li><a href="<%=path%>/jsp/addPost.jsp">创建博客</a></li>
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
	              <li><a href="${pageContext.request.contextPath }/logout">退出</a></li>
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
                <li ><a href="#">首页</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li class="active"><a  href="#">博客列表</a></li>
                <li><a href="<%=path%>/jsp/addPost.jsp">创建博客</a></li>
                <li><a href="<%=path%>/listcomment">评论列表</a></li>
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
		            <h2 style="margin: 20px 0;">文章列表</h2>
		            <table align="center" class="text-center table table-striped  table-hover">
		               <thead>
		                 <tr>
		                   <th class="text-center">序号</th>
		                   <th class="text-center">标题</th>
		                   <th class="text-center">文章编号</th>
		                   <th class="text-center">创建时间</th>
		                   <th class="text-center">操作</th>
		                 </tr>
		               </thead>
		               <tbody>
		               <c:forEach items="${list}" var="post" varStatus="vars">
							<tr>
								<td>${vars.count }</td>
								<td>${post.title }</td>
								<td>${post.id }</td>
								<td>${post.createTime }</td>
								<td><a href="${pageContext.request.contextPath }/editpost?id=${post.id}">修改</a>&nbsp;&nbsp;&nbsp;
								<a href="#" data-toggle="modal" data-target="#myModa3" url="${post.id }">删除</a></td>
							</tr>
						</c:forEach>
		               </tbody>
		             </table>
		         </div>
         <div class="col-md-1">

         </div>
     </div>

     <!-- 特性 -->

     <hr class="feature-divider">

    </div>
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

<!-- 删除 start -->
    <div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog" style="width: 400px">
        <div class="modal-content">
          <div  class="modal-header">
            <h4 class="modal-title" id="myModalLabe3">确定要删除吗?</h4>
          </div>
          <div class="modal-body" style="text-align: center;">
            <h5 class="modal-title" id="myModalLabe3">删除后的博客将不能恢复！</h4>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-danger" id="delete">确定</button>
          </div>
        </div>
      </div>
    </div>
<!-- 删除 end -->

<script src="<%=path%>/jsp/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="<%=path%>/jsp/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
	var id;
	$("table tr a").click(function(){
		id = $(this).attr('url');
	});
	
	$("#delete").click(function(){	
        $('#myModa3').modal('hide');
        location.href = '${pageContext.request.contextPath}/deletepost?id=' + id; 
	})
</script>
</body>
</html>