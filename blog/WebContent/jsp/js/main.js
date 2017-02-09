;$(function()
{
    'use strict';
    var sidebar = $('#sidebar'),
        mask = $('.mask'),
        backBtn = $('.back-to-top'),
        sidebar_trigger = $('#sidebar_trigger');
    function showSidebar() {
        mask.fadeIn();
        sidebar.css('right',0);
    }
    function hideSidebar() {
        mask.fadeOut();
        sidebar.css('right',-sidebar.width());
    }
    sidebar_trigger.on('click',showSidebar);
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

