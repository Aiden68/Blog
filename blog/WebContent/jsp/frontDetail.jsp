<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%  String path = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<%=path %>/jsp/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/jsp/css/addtion.css">
	<link href="<%=path %>/jsp/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path %>/jsp/css/pagination.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=path %>/jsp/static/highlightjs/agate.css">
    <link href="<%=path%>/jsp/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path%>/jsp/css/validate.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="<%=path %>">AndOne的博客</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li ><a href="#">&nbsp; <span class="sr-only">(current)</span></a></li>
	
	      </ul>
	      <form action="<%=path %>/index" class="navbar-form navbar-left">
	        <div class="form-group">
	          <input type="text" class="form-control" name="search" placeholder="Search">
	        </div>
	        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
	      </form>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a  href="<%=path %>/index">首页</a></li>
	        <li><a  href="<%=path %>/image?type=3">图册</a></li>
			<li id="sidebar_trigger"><a  href="#">分类</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<div class="container" style="min-height: 100%;">
        <div class="col-md-2">
            
        </div>
        <div  class="col-md-8">
			<article class="post post-type-normal" style="opacity: 1; display: block; transform: translateY(0px);">
					<header class="post-header">
						<h1 style="text-align: center;">
							<p style="font-weight: 500;
								font-family: 
								display: inline-block;
								position: relative;
								color: #555;
								word-break: break-word;
								border-bottom: none;
								line-height: 1.2;
								vertical-align: top;
								font-size: 25px;
								font-family: 'Lato', 'PingFang SC', 'Microsoft YaHei', 'sans-serif';" 
								 class="mytitle">&nbsp;
							${post.title }
							</p>
						</h1>
						<div class="mypost-meta">
							<span style="text-align: center;" class="post-time">
								<span >
									<i class="fa fa-calendar-o"></i>
								</span>
								<span>< fmt:setLocale value="en"/> < fmt:formatDate value="${post.createTime}"/> </span>
							</span>


							<span >
								&nbsp; | &nbsp;
								<span class="post-meta-item-icon">
									<i class="fa fa-folder-o"></i>
								</span>
								<span >In</span>
								<span >
									<a href="<%=path %>/index?catName=${post.catName}" rel="index">
										<span>${post.catName}</span>
									</a>
								</span>
							</span>
							<span class="post-comments-count">
								&nbsp; | &nbsp;
								<a href="#comment_id" >
									<span >${post.comSize}条评论</span>
								</a>
							</span>
							<span >
								&nbsp; | &nbsp;
								<span class="post-meta-item-icon">
									<i class="fa fa-eye"></i>
								</span>
								<span>visitors </span>
								<span>${post.visitor}</span>
							</span>
						</div>
					</header>
					<div style="margin-top: 0px;
					padding-top: 0;font-family: 'Lato', 'PingFang SC', 'Microsoft YaHei', 'sans-serif';" 
					class="post-body" itemprop="articleBody">
						<p>${post.content }</p>
						
					</div>
					<hr>				
				</article>
				<c:if test="${empty commentList }">
					<h3 style="padding-top: 10px">暂无评论</h3>
				</c:if> 
				<c:if test="${not empty commentList }">
					<h3 style="padding-top: 10px">评论列表&nbsp;&nbsp;&nbsp;&nbsp;${comSize }条</h3>
				</c:if> 
				<hr>
				<div style="padding-top: 10px;padding-left: 10px;padding-right: 10px">
			        <c:if test="${not empty commentList }">
						<c:forEach items="${commentList }" var="com" varStatus="vs">
							<span style="color:black;width: 40px">${vs.count }楼</span>
						        &nbsp;&nbsp;&nbsp;&nbsp;
						        <span class="glyphicon glyphicon-user" style="color: gray ;width:150px" aria-hidden="true">&nbsp;${com.name }</span>
						        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        <span class="glyphicon glyphicon-envelope" style="color: gray;width:300px" aria-hidden="true">&nbsp;${com.email }</span>
						        <div style="font-size:16px;padding: 20px 50px 10px 45px;">${com.content }</div>
						        <div style="color:gray;float: right">
						            <i>评论于 ${com.createTime }</i>
						        </div>
						        <hr>
						</c:forEach>
					</c:if> 
			    </div>	
			  <form id="comment_id" action="<%=path %>/addcomment?pid=${post.id}&comSize=${comSize }" method="post" novalidate="novalidate">
		        <fieldset>
		            <legend style="font-family: 'Lato', 'PingFang SC', Microsoft YaHei, sans-serif">说点什么吧...</legend>
		            <input value="65" type="hidden" name="comment.blog_id">
		            <div class="form-inline">
		                <div class="form-group col-lg-offset-1">
		                    <label style="font-size: 15px;width: 60px;">昵称：</label>
		                    <input style="width:200px;font-size: 15px" type="text" minlength="4" maxlength="30" class="form-control" name="comName" required="" >
		                </div>
		            </div>
		            <div class="form-inline">
		                <div class="form-group  col-lg-offset-1">
		                    <label style="font-size: 15px;width: 60px;padding-top: 20px">邮箱：</label>
		                    <input placeholder="可不填" style="width:250px;font-size: 15px" type="email" class="form-control" name="comEmail"  aria-invalid="true">
		                    <!-- <label id="comEmail" class="error" for="comEmail">这是必填字段</label> -->
		                </div>
		            </div>
		            <div class="form-inline" style="padding-top: 20px">
		                <div class="form-group  col-lg-offset-1">
		                    <label style="font-size: 15px;width: 60px">内容：</label>
		                    <textarea name="comContent" id="comContent" style="width: 500px" class="form-control" rows="4" required=""></textarea>
		                </div>
		            </div>
		
		            <div class="col-lg-offset-1" style="text-align:center; padding-top: 20px;padding-left: 60px;padding-bottom: 15px">
		                <button type="submit" style="width: 200px;text-align: center" class="btn btn-info">评论</button>
		            </div>
		        </fieldset>
		    </form>
        </div>       
        <div class="col-md-2"> </div>
    </div>
	<footer class="footer">
		<ul class="share-group">
			<li><i class="fa fa-weixin fa-2x"></i>微信</li>
			<li><i class="fa fa-qq fa-2x"></i>QQ</li>
			<li><i class="fa fa-weibo fa-2x"></i>新浪微博</li>
			<a href="https://github.com/Aiden68" target="_blank"><li><i class="fa fa-github fa-2x"></i>GitHub</li></a>
			<li><i class="fa  fa-facebook fa-2x"></i>FaceBook</li>
		</ul>
		<div class="copy">
			©AndOne 2016 10-06
		</div>
	</footer>

<div class="mask"></div>
<div id="sidebar">
	<ul>
		<li><a href="<%=path %>/index">所有文章</a></li>
		<c:forEach items="${ catList}" var="cat">
			<li><a href="<%=path%>/index?catName=${cat.catName }">${cat.catName }</a></li>
		</c:forEach>
	</ul>
</div>
<button  class="back-to-top"><i class="fa fa-arrow-up"></i></button>

<script src="<%=path %>/jsp/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/jsp/js/bootstrap.min.js"></script>
<script src="<%=path %>/jsp/js/main.js"></script>
<script src="<%=path %>/jsp/vendor/jquery.validate-1.13.1.js"></script>
<script>
    var validator1;
    $(document).ready(function () {
        validator1 = $("#comment_id").validate({
            /* debug: true, */
            rules: {
                comName: {
                    required: true,
                    minlength: 2,
                    maxlength: 16
                },
                comEmail:{
                	email:true,
                },
                comContent: {
                    required: true,
                },
            },
            messages: {
                comName: {
                    required: '请输入昵称',
                    minlength: '昵称不能小于2个字符',
                    maxlength: '昵称不能超过16个字符'
                    /* remote: '用户名不存在' */
                },
                comEmail:{
                	email:'请输入正确的电子邮件地址'
                },
                comContent: {
                    required: '请输入内容'
                },              
            },          
        });
    });
</script>
</body>
</html>