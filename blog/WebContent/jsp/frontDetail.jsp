<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%  String path = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>伽蓝忘川的博客</title>
    <link href="<%=path %>/jsp/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=path %>/jsp/wangEditor/css/wangEditor.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/jsp/static/highlightjs/agate.css">
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


        /* 简介 */

        .summary {
            padding-right: 15px;
            padding-left: 15px;
        }

        .summary .col-md-4 {
            margin-bottom: 20px;
            text-align: center;
        }

        /* 特性 */

        .feature-divider {
            margin: 40px 0;
        }

        .feature {
            padding: 30px 0;
        }

        .feature-heading {
            font-size: 50px;
            color: #2a6496;
        }

        .feature-heading .text-muted {
            font-size: 28px;
        }

        /* 响应式布局 */

        @media (max-width: 768px) {

            .summary {
                padding-right: 3px;
                padding-left: 3px;
            }

            .carousel {
                height: 300px;
                margin-bottom: 30px;
            }

            .carousel .item {
                height: 300px;
            }

            .carousel img {
                min-height: 300px;
            }

            .carousel-caption p {
                font-size: 16px;
                line-height: 1.4;
            }

            .feature-heading {
                font-size: 34px;
            }

            .feature-heading .text-muted {
                font-size: 22px;
            }
        }

        @media (min-width: 992px) {
            .feature-heading {
                margin-top: 120px;
            }
        }
    </style>

</head>

<body>
<!-- 顶部导航 -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="menu-nav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">伽蓝忘川的博客</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li ><a href="${pageContext.request.contextPath }/index">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#feature-tab" data-tab="tab-chrome">Chrome</a></li>
                        <li><a href="#feature-tab" data-tab="tab-firefox">Firefox</a></li>
                        <li><a href="#feature-tab" data-tab="tab-safari">Safari</a></li>
                        <li><a href="#feature-tab" data-tab="tab-opera">Opera</a></li>
                        <li><a href="#feature-tab" data-tab="tab-ie">IE</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="#" data-toggle="modal" data-target="#about-modal">登陆</a></li>
              <li><a href="#" data-toggle="modal" data-target="#about-modal">注册</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
              </form>
            
        </div>
    </div>
</div>



<!-- 主要内容 -->
<div class="container summary">

    <!-- 简介 -->
    <div class="row" id="summary-container">
        <div class="col-xs-2">
            
        </div>
        <div class="col-xs-8">

            <h2 align="center">${post.title }</h2>
            <h4 align="center"><small><fmt:formatDate value="${post.createTime }" type="both"></fmt:formatDate> </small></h4>
            <p>${post.content }</p>

            
        </div>
        <div class="col-xs-2">
            
        </div>
    </div>

    <!-- 特性 -->

    <hr class="feature-divider">


    <!-- 登陆 -->
    <div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">登陆</h4>
                </div>
                <div class="modal-body">
                    <form action="" method="post"  class="form-horizontal">
                        <fieldset>
                            <div class="control-group">

                                  <!-- Text input-->
                                  <label class="control-label" for="input01">用户名</label>
                                  <div class="controls">
                                    <input type="text" placeholder="请输入用户名" class="form-control">

                                    <p class="help-block"></p>
                                  </div>
                                </div>

                            <div class="control-group">

                              <!-- Text input-->
                              <label class="control-label" for="input01">密码</label>
                              <div class="controls">
                                <input type="text" placeholder="请输入密码" class="form-control">
                                <p class="help-block"></p>
                              </div>
                            </div>

                        </fieldset>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">登陆</button>
                </div>
            </div>
        </div>
    </div>


    <footer>
        <!-- <p class="pull-right"><a href="#top">回到顶部</a></p> -->

        <p align="center">&copy; 2016 AndOne </p>
    </footer>

</div>

<script src="<%=path %>/jsp/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/jsp/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $('#ad-carousel').carousel();
        $('#menu-nav .navbar-collapse a').click(function (e) {
            var href = $(this).attr('href');
            var tabId = $(this).attr('data-tab');
            if ('#' !== href) {
                e.preventDefault();
                $(document).scrollTop($(href).offset().top - 70);
                if (tabId) {
                    $('#feature-tab a[href=#' + tabId + ']').tab('show');
                }
            }
        });
    });
</script>
</body>
</html>