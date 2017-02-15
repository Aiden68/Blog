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
	      <ul class="nav navbar-nav navbar-right">
	        <li><a  href="<%=path %>/index">首页</a></li>
	        <li><a  href="<%=path %>/jsp/backIndex.jsp">返回</a></li>
			<li id="sidebar_trigger"><a  href="#">分类</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<div class="container" style="min-height: 100%;">
        <!-- 首部 start -->
        <div class="row">
            <div class="col-xs-8 col-xs-offset-2">
                <h3 class="page-header">
                    ${user.username}&nbsp;&nbsp;&nbsp;<small>Totals:<span class="badge">${imageList.size()}</span></small>
                    <div class="btn-group pull-right">
                      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                          	图片操作<span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#" data-toggle="modal" data-target="#myModa2">上传</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#myModa3">删除</a></li>
                        <li><a href="<%=path %>/jsp/backIndex.jsp">返回</a></li>
                      </ul>
                    </div>
                </h3>
            </div>
        </div>
        <!-- 首部 end -->

        <!-- 显示图片列表 -->
        <c:forEach items="${imageList}" varStatus="status" var="image">
            <c:choose>
                <c:when test="${status.first or status.index % 4 eq 0}">
                    <div class="row">
                        <div class="col-xs-2 col-xs-offset-2">
                          <a href="#" class="thumbnail text-center">
                            <img name="${image.name}" date="<fmt:formatDate value='${image.date}' pattern='yyyy-MM-dd HH:mm'/>" style="width: 140px; height: 130px;" src="http:///okziuy4fm.bkt.clouddn.com/${image.url}"><!--这里请填写自己的链接地址，详见下图-->
                            <input class="pull-left" type="checkbox" value="${image.id}" url="${image.url}"/>${image.name }
                          </a>
                        </div>
                </c:when>
                <c:when test="${status.index % 4 eq 3 and not status.last }">
                        <div class="col-xs-2">
                          <a href="#" class="thumbnail text-center">
                            <img name="${image.name}" date="<fmt:formatDate value='${image.date}' pattern='yyyy-MM-dd HH:mm'/>" style="width: 140px; height: 130px;" src="http://okziuy4fm.bkt.clouddn.com/${image.url}"><!--这里请填写自己的链接地址，详见下图-->
                            <input class="pull-left" type="checkbox" value="${image.id}" url="${image.url}" />${image.name }
                          </a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-xs-2">
                      <a href="#" class="thumbnail text-center">
                        <img name="${image.name}" date="<fmt:formatDate value='${image.date}' pattern='yyyy-MM-dd HH:mm'/>" style="width: 140px; height: 130px;" src="http:///okziuy4fm.bkt.clouddn.com/${image.url}"><!--这里请填写自己的链接地址，详见下图-->
                        <input class="pull-left" type="checkbox" value="${image.id}" url="${image.url}"/>${image.name }
                      </a>
                    </div>
                </c:otherwise>
            </c:choose>
            <c:if test="${status.last}">
                </div>
            </c:if>
        </c:forEach>
        <!-- 显示图片列表 end -->

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

<!-- 显示图片对话框 start -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel"></h4>
          </div>
          <div class="modal-body" id="modal-content">
          </div>
        </div>
      </div>
    </div>
    <!-- 显示图片对话框 end -->

    <!-- 上传图片对话框 start -->
    <div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabe2">Image Upload</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal" role="form" id="form">
                <div class="form-group"  >
                <label for="image_name" class="col-xs-2 control-label" >Title</label>
                <div class="col-xs-4">
                  <input type="text" class="form-control" id="image_name" name="image_name"/>
                </div>
              </div>
              <div class="form-group">
                <label for="image" class="col-xs-2 control-label">Image</label>
                <div class="col-xs-4">
                    <input type="file" id="image" name="image"/>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary" id="upload">Upload</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 上传图片对话框 end -->

    <!-- 删除图片对话框 start -->
    <div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog" style="width: 400px">
        <div class="modal-content">
          <div  class="modal-header">
            <h4 class="modal-title" id="myModalLabe3">确定要删除吗?</h4>
          </div>
          <div class="modal-body" style="text-align: center;">
            <h5 class="modal-title" id="myModalLabe3">删除后的图片将不能恢复！</h4>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-danger" id="delete">确定</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 删除图片对话框 end -->

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

<script type="text/javascript">
        $(document).ready(function() {
            //点击图片
            $('img').click(function() {
                $('#myModalLabel').html($(this).attr('name') + '&nbsp;&nbsp;&nbsp;<small>' + $(this).attr('date') + '</small>');
                $('#modal-content').html('<img class=\'img-responsive\' src=\'' + $(this).attr('src') + '\'/>');
                $('#myModal').modal('show');
            });

            //点击上传
            $('#upload').click(function() {
                if ($('#image_name').val() == '' || $('#image').val() == '') {
                } else {
                    $('#form').attr('action', '${pageContext.request.contextPath}' + '/image?type=5');
                    $('#form').attr('enctype', 'multipart/form-data');
                    $('#form').attr('method', 'post');
                    $('#form').submit();
                }
            });

            //点击确定退出
            $('#exit').click(function() {
                $.get('${pageContext.request.contextPath}' + '/UserAction?type=3', function(data, status) {
                    location.href = '${pageContext.request.contextPath}' + '/index.jsp';
                });
            });

            //点击确定删除图片
            $('#delete').click(function() {
                var ids = "";
                var urls = "";
                $('input[type=checkbox]:checked').each(function() {
                    ids += $(this).val() + ',';
                    urls += $(this).attr('url') + ',';
                }); 
                $.post('${pageContext.request.contextPath}' + '/image?type=2', {
                    ids: ids,
                    urls: urls
                },function(data, status) {
                    $('#myModa3').modal('hide');
                    location.href = '${pageContext.request.contextPath}' + '/image?type=4';
                });
            });
        });
    </script>
</body>
</html>