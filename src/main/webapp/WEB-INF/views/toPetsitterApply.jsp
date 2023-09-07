<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일반회원에서 펫시터로 신청</title>

    <link rel="stylesheet" href="../../resources/css/toPetsitterApply-style.css">
    <script src="https://kit.fontawesome.com/de9012b52d.js" crossorigin="anonymous"></script>

   
    
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main>
        <section class="main_container">
            <form action="#" method="" name="apply_form" onsubmit="return applyValidate()">
                <div class="main_first">펫시터 신청하기</div>
                <div class="main_second">
                    <div class="selection"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;지역</div>
                    <input type="text" name="location" placeholder="시/군/구 까지 입력해주세요">
                </div>
                <div class="main_third">
                    <div><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;반려 경험</div>
                    <div>
                        <input type="radio" name="exper" id="yes" value="있음">
                        <label for="yes">있음</label>
                        &nbsp;
                        <input type="radio" name="exper" id="no" value="없음">
                        <label for="no">없음</label>
                    </div>
                </div>
                <div class="main_fifth">
                    <div><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;지원 동기</div>
                    <textarea id="apply_content" name="motive" placeholder="내용을 입력해 주세요"></textarea>
                </div>
                <br>
                <div class="main_sixth">
                    <div><input type="checkbox" id="apply_all"> 전체 동의하기</div><br>
                    <div><input type="checkbox" name="apply_agree" id="essential"> 지원서에 기재된 내용은 모두 본인이 작성하였으며, 사실과 다름 없음을 확인했습니다(필수) </div><br>
                    <div><input type="checkbox" name="apply_agree"> 보다 나은 리뷰 서비스 제공을 위해 개인 정보 수집∙이용에 동의합니다.(선택)</div>
                </div>
                <div class="main_last"><button id="btn_apply">등 록</button></div>
            </form>
        </section>
       
    </main>
    <footer>
    </footer>
    <script>

        // 전체 동의하기 체크박스 js 
        const apply_all = document.getElementById("apply_all");
        const apply_agree = document.getElementsByName("apply_agree");
        apply_all.addEventListener("click",function(){

            for(let i = 0; i < apply_agree.length; i ++){
                apply_agree[i].checked = apply_all.checked;
            }
        })
        this.addEventListener("click",function(e){
            for(let i = 0; i<apply_agree.length; i ++){

                if(e.target == apply_agree[i]){

                    //  전부 선택 안되어 있을 시 전체선택 체크박스 해제하기

                    if(!this.checked && apply_all.checked){
                        //전체선택이 체크되어 있으면서 현재 클릭한 체크박스가 해제되는 경우
                        apply_all.checked = false;

                    }

                    // 전부 선택이 되어 있을 시 전체선택 체크박스 체크하기
                    let flag = true;
                    for(let j = 0 ; j < apply_agree.length; j ++){//전부 체크 됐는지 확인하기 위한 for문
                        if(!apply_agree[j].checked){ //하나라도 체크가 안되어 있을 때
                            flag = false;

                        }
                    }
                    // 전체선택 체크박스가 체크되어 있지 않으면서
                    // 전부 선택이 되어있는 경우
                    if(!apply_all.checked && flag){
                        apply_all.checked = true;
                    }
                }
                
            }

        })
        function applyValidate(){  
            const location = document.getElementsByName("location")[0];
            const exper = document.getElementsByName("exper")[0];
            const motive = document.getElementsByName("motive")[0];
            const essential = document.getElementById("essential");

            if(location.value.trim().length == 0){
                alert("지역을 입력해주세요!");

                return false;
            }

            if(exper.checked == false){

                alert("반려 경험에 체크 해주세요!");

                return false;
            }

            if(motive.value.trim().length == 0){

                alert("지원 동기를 작성해주세요!");

                return false;

            }


            if(essential.checked == false){

                alert("필수 항목을 체크 해주세요!");
                
                return false;
            }

            return true;
        }

    </script>
    
</body>
</html>