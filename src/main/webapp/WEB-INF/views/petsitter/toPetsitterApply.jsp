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

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />


    
    <main>
        <section class="main_container">
            <form action="/petsitter/goToPetsitter" method="POST" name="apply_form" onsubmit="return applyValidate()">
                <div class="main_first">펫시터 신청하기</div>
                <div class="main_second">
                    <div class="selection"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;지역</div>
                    <select name="sido1" id="sido1"></select>
                    <select name="gugun1" id="gugun1"></select>
                </div>
                <div class="main_third">
                    <div><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;반려 경험</div>
                    <div>
                        <input type="radio" name="exper" id="yes" value="O">
                        <label for="yes">있음</label>
                        &nbsp;
                        <input type="radio" name="exper" id="no" value="X">
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
                    <div><input type="checkbox" name="apply_agree"> 보다 나은 리뷰 서비스 제공을 위해 개인 정보 수집∙이용에 동의합니다.(필수)</div>
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
            const radio = document.getElementsByName("exper");
            const motive = document.getElementsByName("motive")[0];
            const essential = document.getElementById("essential");


            if(!radio[0].checked && !radio[1].checked){

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
        $('document').ready(function() {
            var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
            var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
            var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
            var area3 = ["대덕구","동구","서구","유성구","중구"];
            var area4 = ["광산구","남구","동구","북구","서구"];
            var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
            var area6 = ["남구","동구","북구","중구","울주군"];
            var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
            var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
            var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
            var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
            var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
            var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
            var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
            var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
            var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
            var area16 = ["서귀포시","제주시","남제주군","북제주군"];

 

            // 시/도 선택 박스 초기화

            $("select[name^=sido]").each(function() {
            $selsido = $(this);
            $.each(eval(area0), function() {
            $selsido.append("<option value='"+this+"'>"+this+"</option>");
            });
            $selsido.next().append("<option value=''>구/군 선택</option>");
            });

            

            // 시/도 선택시 구/군 설정

            $("select[name^=sido]").change(function() {
            var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
            var $gugun = $(this).next(); // 선택영역 군구 객체
            $("option",$gugun).remove(); // 구군 초기화

            if(area == "area0")
            $gugun.append("<option value=''>구/군 선택</option>");
            else {
            $.each(eval(area), function() {
                $gugun.append("<option value='"+this+"'>"+this+"</option>");
            });
            }
            });


            });


    </script>
    
</body>
</html>