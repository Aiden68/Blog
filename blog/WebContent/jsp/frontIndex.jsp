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
    <title>伽蓝忘川的博客</title>
    <link href="<%=path %>/jsp/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path %>/jsp/css/pagination.css" rel="stylesheet">
	
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

        /* 轮播广告 */

        /* .carousel {
            height: 500px;
            margin-bottom: 60px;
        }

        .carousel .item {
            height: 500px;
            background-color: #000;
        }

        .carousel .item img {
            width: 100%;
        }

        .carousel-caption {
            z-index: 10;
        }

        .carousel-caption p {
            margin-bottom: 20px;
            font-size: 20px;
            line-height: 1.8;
        } */

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
                <li class="active"><a href="#ad-carousel">首页</a></li>
<!--                 <li><a href="#summary-container">简述</a></li> -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#feature-tab" data-tab="tab-chrome">java</a></li>
                        <li><a href="#feature-tab" data-tab="tab-firefox">c++</a></li>
                        <li><a href="#feature-tab" data-tab="tab-safari">python</a></li>
                        <li><a href="#feature-tab" data-tab="tab-opera">javascript</a></li>
                        <li><a href="#feature-tab" data-tab="tab-ie">algorithm</a></li>
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


<!-- 广告轮播 -->
<%-- <div id="ad-carousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
        <li data-target="#ad-carousel" data-slide-to="1"></li>
        <li data-target="#ad-carousel" data-slide-to="2"></li>
        <li data-target="#ad-carousel" data-slide-to="3"></li>
        <li data-target="#ad-carousel" data-slide-to="4"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="<%=path %>/jsp/images/bg1.jpg" alt="1 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>Chrome</h1>

                    <p>Google Chrome，又称Google浏览器，是一个由Google（谷歌）公司开发的网页浏览器。</p>

                    <p><a class="btn btn-lg btn-primary" href="http://www.google.cn/intl/zh-CN/chrome/browser/"
                          role="button" target="_blank">点我下载</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="<%=path %>/jsp/images/bg2.jpg" alt="2 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>Firefox</h1>

                    <p>Mozilla Firefox，中文名通常称为“火狐”或“火狐浏览器”，是一个开源网页浏览器。</p>

                    <p><a class="btn btn-lg btn-primary" href="http://www.firefox.com.cn/download/" target="_blank"
                          role="button">点我下载</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="<%=path %>/jsp/images/safari-big.jpg" alt="3 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>Safari</h1>

                    <p>Safari，是苹果计算机的最新操作系统Mac OS X中的浏览器。</p>

                    <p><a class="btn btn-lg btn-primary" href="http://www.apple.com/cn/safari/" target="_blank"
                          role="button">点我下载</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="<%=path %>/jsp/images/opera-big.jpg" alt="4 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>Opera</h1>

                    <p>Opera浏览器，是一款挪威Opera Software ASA公司制作的支持多页面标签式浏览的网络浏览器。</p>

                    <p><a class="btn btn-lg btn-primary" href="http://www.opera.com/zh-cn" target="_blank"
                          role="button">点我下载</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="<%=path %>/jsp/images/ie-big.jpg" alt="5 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h1>IE</h1>

                    <p>Internet Explorer，简称 IE，是微软公司推出的一款网页浏览器。</p>

                    <p><a class="btn btn-lg btn-primary" href="http://ie.microsoft.com/" target="_blank"
                          role="button">点我下载</a></p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#ad-carousel" data-slide="prev"><span
            class="glyphicon glyphicon-chevron-left"></span></a>
    <a class="right carousel-control" href="#ad-carousel" data-slide="next"><span
            class="glyphicon glyphicon-chevron-right"></span></a>
</div> --%>


<!-- 主要内容 -->
<div style="margin-top: 30px" class="container summary">

    <div class="row" id="summary-container">
        <div class="col-md-2">
            
        </div>
        <div class="col-md-8">
        	<form action="<%=path %>/index?pageNum=new_page_index+1" id="postForm" method="post">
			<c:forEach items="${result.resultList}" var="post">
				<h3 >
                	<a href="<%=path %>/postdetail?id=${post.id}">${post.title }</a>
		        </h3>
	            <h4><small><fmt:formatDate value="${post.createTime }" type="both"></fmt:formatDate></small></h4>
	            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${post.summary }</p>
	            <p class="text-right"><a  href="<%=path %>/postdetail?id=${post.id}" >read more</a></p>
				<hr>
			</c:forEach>
            <div id="News-Pagination" align="center"></div>
            </form>
        </div>
        
        <div class="col-md-2">
            
        </div>
    </div>
    <!-- 关于 -->
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
        <p class="pull-right"><a href="#top">回到顶部</a></p>

        <p align="center">&copy; 2016 AndOne </p>
    </footer>

</div>

<script src="<%=path %>/jsp/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/jsp/js/bootstrap.min.js"></script>
<script src="<%=path %>/jsp/js/jquery.pagination.js"></script>
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
<script type="text/javascript">

// 点击分页按钮以后触发的动作
function handlePaginationClick(new_page_index, pagination_container) {
    $("#postForm").attr("action", "<%=path %>/index?pageNum=" + (new_page_index+1));
    $("#postForm").submit();
    return false;
}

$(function(){
	$("#News-Pagination").pagination(${result.totalSize}, {
        items_per_page:${result.pageSize}, // 每页显示多少条记录
        current_page:${result.currentPage} - 1, // 当前显示第几页数据
        num_display_entries:8, // 分页显示的条目数
        next_text:"下一页",
        prev_text:"上一页",
        num_edge_entries:2, // 连接分页主体，显示的条目数
        callback:handlePaginationClick
	});
	
});
</script>
</body>
</html>