<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 게시판 상세조회</title>

    <link rel="stylesheet" href="../../../resources/css/reviewBoard/reviewBoardDetail.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

    <main>


        <section>

            <!-- 제목 영역 -->
            <div>
                <h1>${board.boardTitle}</h1>
            </div>

            <!-- 게시글 상단 작성자 정보 영역 -->
            <div class="h-topArea">

                <!-- 작성자 프로필 영역 -->
                <div>
                    <img src="${board.profileImage}" class="h-profileImg">
                </div>

                <!-- 작성자 상세 정보 영역 -->
                <div>

                    <p>${board.memberNickname}</p>
                    <p>
                        <span>${board.boardDate}</span>
                        <span class="h-btnArea">
                        <c:if test="${board.memberNo == loginMember.memberNo}" >
                            <button id="h-updateBtn">수정</button>
                            <button id="h-deleteBtn">삭제</button>
                        </c:if>
                   
                        </span>
                    </p>

                </div>
            </div>

            <!-- 이미지 영역 -->
            <div class="h-imgArea">
                <img src="${board.imagePath}" onerror="this.style.display='none'" alt=''/>
            </div>

            <!-- 내용 영역 -->
            <div class="h-contentArea">
                <pre>
${board.boardContent}
                </pre>
            </div>

            <!-- 목록으로 버튼 영역 -->
            <div class="h-backListBtnArea">
                <button id="h-backListBtn">목록으로</button>
            </div>

            <!-- 댓글 영역 -->
            <div>
                <div class="h-replyArea">

                    <div>
                        <img src="#" id="h-replyProfile">
                    </div>
                    
                    <div>
                        <div><small>작성자 아이디</small><small>2023-08-29</small></div>
                        <div><p>댓글 내용 입니다.</p></div>

                    </div>

                </div>

                <!-- 댓글 수정 삭제 버튼 영역 -->
                <div class="h-replyBtnArea">
                    <button id="h-replyUpdateBtn">수정</button>
                    <button id="h-replyDeleteBtn">삭제</button>
                </div>

                
            </div>

            <!-- 댓글 작성 영역 -->
            <div class="h-replyWriter">

                <div>
                    <textarea name="" id="h-replyTextarea" cols="120" rows="5" placeholder="내용을 입력해주세요."></textarea>
                </div>
                <div>
                    <button id="h-replyBtn">댓글 등록</button>
                </div>

            </div>


        </section>


       

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


    
</body>
</html>