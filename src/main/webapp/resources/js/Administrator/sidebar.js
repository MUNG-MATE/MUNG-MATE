$(".toggle_btn").click(function () {
    $(this).toggleClass("active");
    $(".sub_gnb").hide();
});

$(".toggle_btn").click(function () {

    // if($(".toggle_btn").hasClass("active") === false){
    //     $(".gnb").hide();
    // }else{
    //     $(".gnb").show();
    // }

    $(".nav").stop().animate({ width: "toggle"}, 800)

});

$(".gnb>li").click(function () {
    $(this).children("ul").slideToggle();
    $(this).siblings().children("ul").slideUp();

    $(".nav").mouseleave(function(){
        $(".sub_gnb").slideUp();
    })
    
});



