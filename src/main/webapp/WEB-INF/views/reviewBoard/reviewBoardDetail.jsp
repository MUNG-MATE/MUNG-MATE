<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 게시판 상세조회</title>

    <link rel="stylesheet" href="/resources/css/reviewBoard/reviewBoardDetail.css">
    <link rel="stylesheet" href="/resources/css/reviewBoard/reply-style.css">
    <script src="https://kit.fontawesome.com/de9012b52d.js" crossorigin="anonymous"></script>


</head>
<body>
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />


    <main>


        <section>

            <!-- 제목 영역 -->
            <div>
                <h1><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;${board.boardTitle}</h1>
            </div>

            <!-- 게시글 상단 작성자 정보 영역 -->
            <div class="h-topArea">
                <div>
                    <!-- 작성자 프로필 영역 -->
                    <div class="profile-img">
                        <img src="${board.profileImage}" class="h-profileImg">
                    </div>

                    
                    <!-- 작성자 상세 정보 영역 -->
                    <div class="first">

                        <div>No.${board.boardNo}&nbsp;<i class="fa-regular fa-eye" style="color:rgb(0,30,60)"></i>&nbsp;${board.readCount}</div>
                        <br>
                        <div>
                            <div>"${board.memberNickname}" 님의 리뷰</div>
                            <span style="font-size:small; color:gray;">${board.boardDate}</span>
                            <span class="h-btnArea"></span>
                        </div>

                    </div>
                </div>
            </div>
          

            <!-- 이미지 영역 -->
            <div class="h-imgArea">
                <img src="${board.imagePath}" onerror="this.style.display='none'" alt=''/>
            </div>

            <!-- 내용 영역 -->
            <div class="h-contentArea">
                <textarea class="h-contentArea">${board.boardContent}</textarea>
            </div>

            
          

            <!-- 목록으로 버튼 영역 -->
            <div class="h-backListBtnArea">
                <c:if test="${board.memberNo == loginMember.memberNo}" >
                <button id="h-updateBtn">수정</button>
                <button id="h-deleteBtn">삭제</button>
                </c:if>
                <button id="h-backListBtn">목록으로</button>
            </div>





          
        </section>


        <!-- 댓글 영역 -->
        <jsp:include page="/WEB-INF/views/reviewBoard/reply.jsp"/>


    </main>

    <!-- footer 영역 -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>



       

        // 목록으로 버튼 클릭 시
        const goToListBtn = document.getElementById("h-backListBtn");

        goToListBtn.addEventListener("click", () => {

        

            // 이동할 주소 저장
            let url = "/reviewBoard/reviewBoardList";

            // URL 내장 객체 : 주소 관련 정보를 나타내는 객체
            // URL.searchParams : 쿼리스트링만 별도 객체로 변환

            const params = new URL(location.href).searchParams

            let cp;
            if(params.get("cp") != ""){ // 쿼리스트링에 cp가 있을 경우

                cp =  "?cp=" + params.get("cp");
            }else{
                cp = "?cp=1"
            }

            // 조립
            url += cp;

            // 검색 key, query가 존재하는 경우 url에 추가
            if(params.get("key") != null){
                const key = "&key=" + params.get("key");
                const query = "&query=" + params.get("query");
                
                url += key + query; // url 뒤에 붙이기
            }
            // location.href = "주소"; -> 해당 주소로 이동
           

            location.href = url;


        })


        // 게시글 수정 버튼 클릭 시
        const updateBtn = document.getElementById("h-updateBtn");
        if (updateBtn != null) {

            updateBtn.addEventListener("click", () => {

                location.href = "/reviewBoard/reviewBoardList" + "/${board.boardNo}" + "/update";
                    

            })

        }


        // 게시글 삭제 버튼이 클릭 되었을 때
        const deleteBtn = document.getElementById("h-deleteBtn");
        if (deleteBtn != null) {
            
            deleteBtn.addEventListener("click", () => {

                if (confirm("정말 삭제 하시겠습니까?")) {

                    location.href = "/reviewBoard/reviewBoardList" + "/${board.boardNo}" + "/delete";

                    // 삭제 서비스 호출 성공 시 redirect:/board/{boardCode}
                    // + RedirectAttributes 이용해서 "삭제 되었습니다" alert 출력

                    // 삭제 서비스 호출 실패 시 redirect:/board/{boardCoed}/{boardNo}
                    // + RedirectAttributes 이용해서 "삭제 실패" alert 출력
                }
            })
        }

        
    </script>

    <script> // 로그인한 회원 번호를 전역 변수로 선언
        
        const loginMemberNo = "${loginMember.memberNo}";
    </script>
    
    <script src="/resources/js/reviewBoard/reply.js"></script>  
    


    
</body>
</html>