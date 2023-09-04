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

const toggleButtons = document.querySelectorAll('.td'); 

toggleButtons.forEach((button, index) => {
    button.addEventListener('click', () => {
        const faqAnswerRows = document.querySelectorAll('.faq-answer'); 

        // 현재 클릭한 버튼 다음의 답변 행을 토글하여 보이거나 숨깁니다.
        faqAnswerRows.forEach((row, rowIndex) => {
            if (rowIndex === index) {
                if (row.style.display === 'block' || row.style.display === '') {
                    row.style.display = 'none';
                } else {
                    row.style.display = 'block';
                }
            } else {
                row.style.display = 'none'; 
            }
        });
    });
});


