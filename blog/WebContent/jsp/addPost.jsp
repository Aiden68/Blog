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
    <title>伽蓝忘川的博客</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/jsp/css/bootstrap.min.css" >
	<link rel="stylesheet" type="text/css" href="<%=path %>/jsp/wangEditor/css/wangEditor.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/jsp/static/highlightjs/dark.css">
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
            <a class="navbar-brand" href="<%=path %>">AndOne的博客</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li ><a href="<%=path %>/index">首页</a></li>
<!--                 <li><a href="#summary-container">简述</a></li> -->
                <!-- <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#feature-tab" data-tab="tab-chrome">Chrome</a></li>
                        <li><a href="#feature-tab" data-tab="tab-firefox">Firefox</a></li>
                        <li><a href="#feature-tab" data-tab="tab-safari">Safari</a></li>
                        <li><a href="#feature-tab" data-tab="tab-opera">Opera</a></li>
                        <li><a href="#feature-tab" data-tab="tab-ie">IE</a></li>
                    </ul>
                </li> -->
            </ul>
            <c:if test="${not empty username}">
            	<ul class="nav navbar-nav navbar-right">
	              <li><a href="${pageContext.request.contextPath }/logout" >退出</a></li>
	            </ul>
            </c:if>
            
        </div>
    </div>
</div>



<!-- 主要内容 -->
<div class="container summary">

    <!-- 简介 -->
    <div class="row" id="summary-container">
        <div class="col-md-2">
            
        </div>
        <div class="col-md-8">

            
          <form action="${pageContext.request.contextPath }/addpost" method="post">
            <fieldset>
              <div style="margin-top: 25px" id="legend" class="">
                <legend class="">创建文章</legend>
              </div>
            <div class="control-group">

                  <!-- Text input-->
                  <label class="control-label" for="input01">标题</label>
                  <div class="controls">
                    <input type="text" name="title" placeholder="文章的标题" class="form-control">
                    <p class="help-block"></p>
                  </div>
                </div>


            <div class="control-group">

                  <!-- Select Basic -->
                  <label class="control-label">分类</label>
                  <div class="controls form-inline">
                    <select style="width: 400px" class="form-control" id="catSelect">
		              <option >选择分类</option>
		              <!-- <option >数据结构与算法</option>
		              <option>java</option>
		              <option >javaWeb</option> -->
		            </select>
		            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#cat-modal" >新增分类</button>
		          </div>

                </div>

            <div style="margin-top: 20px;margin-bottom: 0px" class="control-group">
                  <label class="control-label">上传图片</label>

                  <!-- File Upload -->
                  <div>
                  	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#pic-modal" >选择图片</button>&nbsp;&nbsp;
                  	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModa3" >删除图片</button>
                  </div>
                  
            </div>
			<!-- 显示图片列表 -->
			<div id="piclist">
		        <%-- <div style="margin:20px;display:inline-block">
					<a href="#" class="thumbnail text-center">
		              <img name="${image.name}" style="width: 140px; height: 130px;" src="../jsp/images/pic2.jpg">
		              <input class="pull-left" type="checkbox" value="${image.id}" url="${image.url}"/>我叫图片
		            </a>
				</div> --%>
		    </div>
        <!-- 显示图片列表 end -->
            <div style="margin-top: 10px" class="control-group">

                  <!-- Textarea -->
                  <label class="control-label">内容</label>
                  <div class="controls">
                    <div  class="textarea">
                          <textarea style="height: 500px" id="editor" name="content" class="form-control"> </textarea>
                    </div>
                  </div>
                </div>

            <div class="control-group">
                  <label class="control-label"></label>

                  <!-- Button -->
                  <div class="controls">
                    <button style="width: 100px;margin-top: 20px" class="btn pull-right btn-success">保存</button>
                  </div>
                </div>

            

            </fieldset>
          </form>

        </div>
        <div class="col-md-2">
            
        </div>
    </div>

    <!-- 新增分类对话框 -->
    <div class="modal fade" id="cat-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div  class="modal-dialog" style="width: 400px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">新增分类</h4>
                </div>
                <div class="modal-body">
                    <form action="" method="post"  class="form-horizontal" id="catform">
                        <fieldset>
                            <div class="control-group">

                                  <!-- Text input-->
                                  <label class="control-label" for="input01">分类名称</label>
                                  <div class="controls">
                                    <input minlength="1" type="text" placeholder="请输入分类名称" class="form-control" name="newcatName" id="newcatName" >
                                    <p class="help-block"></p>
                                  </div>
                                </div>

                        </fieldset>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="newcat">确定</button>
                </div>
            </div>
        </div>
    </div>
	<!-- 分类对话框end -->
	
	<!-- 上传图片对话框 start -->
    <div class="modal fade" id="pic-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="myModalLabe2">图片上传</h4>
          </div>
          <div class="modal-body">
              <form class="form-horizontal" role="form" id="pic-form" enctype="multipart/form-data">
                <div class="form-group"  >
                <label for="image_name" class="col-xs-2 control-label" >图片名称</label>
                <div class="col-xs-4">
                  <input type="text" class="form-control" id="image_name" name="image_name"/>
                </div>
              </div>
              <div class="form-group">
                <label for="image" class="col-xs-2 control-label">图片</label>
                <div class="col-xs-4">
                    <input type="file" id="image" name="image"/>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-primary" id="upload">上传</button>
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
    <hr class="feature-divider">
    <footer>
        <!-- <p class="pull-right"><a href="#top">回到顶部</a></p> -->

        <p class="text-center">&copy; 2016 AndOne </p>
    </footer>

</div>

<script src="<%=path %>/jsp/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/jsp/js/jquery.form.js"></script>
<script src="<%=path %>/jsp/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/jsp/wangEditor/js/wangEditor.min.js"></script>

<script>
    $("#catSelect").click(function(){
    	var len = $("#catSelect option").size();
    	if(len == 1){
    		$.ajax( {
    			type    : "POST",
    			url     : "<%=path%>/listcat?time="+new Date().getTime(),
    			success : function(backDate,textStatus,ajax){
    						//alert(backDate!=null?"收到":"为收到");	
    						//alert(ajax.responseText);
    						//解析json文本
    						var jsonJS = eval("("+backDate+")");
    						var array = jsonJS;
    					  	var size = array.length;
    					  	for(var i=0;i<size;i++){
    					  		var cat = array[i];
    					  		var $option = $("<option>"+cat+"</option>");
    					  		$("#catSelect").append($option);
    					  	}
    					  }
    		} );
    	}  	
    });
</script>

<script>
    $("#newcat").click(function(){
    	var newcatName = $("#newcatName").val();
    	if(newcatName.length == 0){
    		alert("分类名没有填");
    	}
    	else{
    		var url = "<%=path%>/addcat?time="+new Date().getTime();
			var sendData = $("#catform").serialize();
			$.post(url,sendData,function(backDate){
				//backDate：
				//如果服务器返回html，即backDate就是string，不要解析
				//如果服务器返回json，即backDate就是object，要解析	
				//如果服务器返回xml，即backDate就是object，要解析	
				var option = $("<option>"+backDate+"</option>");
				$("#catSelect").append(option);
			});
    	}
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
                $("#pic-form").ajaxSubmit({
                	success: function (url) {
                        alert("上传成功");
                        var pic = $("<div style='margin:10px;display:inline-block'><a href='#' class='thumbnail text-center'><img style='width: 140px; height: 130px;' src="+ "http://okziuy4fm.bkt.clouddn.com/" +url+"><input class='pull-left' type='checkbox' value='${image.id}' url='${image.url}'/>图片</a></div>");
                        $("#piclist").append(pic);
                    },
                    error: function (error) { alert(error); },
                    url: '<%=path%>/image?type=1', /*设置post提交到的页面*/
                    type: "post", /*设置表单以post方法提交*/
                    dataType: "json" /*设置返回值类型为文本*/
                });
                
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
                location.href = '${pageContext.request.contextPath}' + '/jsp/addPost.jsp';
            });
        });
    });
</script>
<script type="text/javascript">
    var editor = new wangEditor('editor');
    editor.create();
</script>
</body>
</html>