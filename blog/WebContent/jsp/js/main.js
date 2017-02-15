;$(function()
{
    var sidebar = $('#sidebar'),
        mask = $('.mask'),
        backBtn = $('.back-to-top'),
        sidebar_trigger = $('#sidebar_trigger');
    function showSidebar() {
    	$.ajax( {
			type    : "POST",
			url     : "<%=path%>/listcat?time="+new Date().getTime(),
			success : function(backDate,textStatus,ajax){
						//alert(backDate!=null?"收到":"为收到");	
						//alert(ajax.responseText);
						//解析json文本
						alert(textStatus);
						var jsonJS = eval("("+backDate+")");
						var array = jsonJS;
					  	var size = array.length;
					  	for(var i=0;i<size;i++){
					  		var cat = array[i];
					  		var $li = $("<li><a href='#'>"+cat+"</a></li>");
					  		$("#catSelect").append($li);
					  	}
					  }
		} );
        mask.fadeIn();
        sidebar.css('right',0);
    }
    function hideSidebar() {
        mask.fadeOut();
        sidebar.css('right',-sidebar.width());
    }
    sidebar_trigger.click(showSidebar);
    mask.on('click',hideSidebar);


    backBtn.on('click',function () {
        $('html,body').animate({
            scrollTop:0
        }, 800)
    })

    $(window).on('scroll',function () {
        if($(window).scrollTop() > $(window).height())
            backBtn.fadeIn();
        else
            backBtn.fadeOut();
    })

    $(window).trigger('scroll');

    var sm = $('#scrollmore');
        var t = $(window).scrollTop();
        sm.on('click',function () {
            $('html,body').animate({
            scrollTop:t+700
            }, 800)
        })
})

