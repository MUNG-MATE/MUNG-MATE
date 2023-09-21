<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- map에 저장된 값들을 각각 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="boardList" value="${map.boardList}"/>
<c:set var="imageList" value="${imageList}"/>




<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 게시판 목록</title>

    <link rel="stylesheet" href="../../../resources/css/reviewBoard/reviewBoardList.css">
    <script src="https://kit.fontawesome.com/de9012b52d.js" crossorigin="anonymous"></script>

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

     <a href="#" class="scroll-top-btn">Top</a>
    <main>

       
        <!-- 게시판 제목 영역 -->
        <div>
            <h1>리뷰</h1>
        </div>

        <div class="btn-area">

            <!-- 로그인 상태일 경우 글쓰기 버튼 노출 -->

            <c:if test="${!empty loginMember}" >
                    <a href="/reviewBoard/reviewBoardList/insert"><button id="insertBtn"><i class="fa-solid fa-pen"></i> 글쓰기</button></a>                
            </c:if>

        </div>
        <c:if test="${!empty param.key}" >
            <h3 style="margin:30px">"${param.query}" 검색결과<h3>
        </c:if>

        <section>

            <!-- 게시글 영역 -->
            <c:choose>
               <c:when test="${empty boardList}">
                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                    <div id="nothing"><h3>게시글이 존재하지 않습니다</h3><div>
               </c:when>
            
               <c:otherwise>
                    <c:forEach items="${boardList}" var="board">
                    <%-- 게시글 있으면 --%>
                            <div class="h-list">

                                <div>
                                    <div class="first">No.${board.boardNo}&nbsp;<i class="fa-regular fa-eye" style="color:rgb(0,30,60)"></i>&nbsp;${board.readCount}</div>
                                    <br>
                                    <h2><a id="reviewTitle" href="/reviewBoard/reviewBoardList/${board.boardNo}?cp=${pagination.currentPage}${sp}"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;${board.boardTitle}&nbsp;[${board.replyCount}]</a></h2>
                                    <br>
                                    <div class="first">"${board.memberNickname}" 님의 리뷰</div>
                                    <div id="third"></div>
                                    <div id="second" style="font-size:small; color:gray;">${board.boardDate}</div>
                                </div>

                                <c:if test="${!empty board.imagePath}">    
                                <div class="thumbNail">
                                    <img class="thumbNail" src="${board.imagePath}${board.imageReName}" onerror="this.style.display='none'" alt='' class="h-listImg">
                                </div>
                                </c:if>

                            </div>
                    </c:forEach>
               </c:otherwise>
            </c:choose>

        


        </section>

       

        <!-- 페이지 네이션 영역 -->
        <div class="pagination-area">


            <ul class="pagination">

                <c:if test="${!empty boardList}" >
                <!-- 첫 페이지로 이동 -->
                <li><a href="/reviewBoard/reviewBoardList/${boardCode}?cp=1${sp}">&lt;&lt;</a></li>

                <!-- 이전 목록 마지막 번호로 이동 -->
                <li><a href="/reviewBoard/reviewBoardList/${boardCode}?cp=${pagination.prevPage}${sp}">&lt;</a></li>
                </c:if>

           
                <!-- 특정 페이지로 이동 -->
                <c:forEach var="i" begin="${pagination.startPage}"
                            end="${pagination.endPage}" step="1">

                    <c:choose>
                       <c:when test="${ i == pagination.currentPage}">
                            <!-- 현재 보고있는 페이지 -->
                            <li><a class="current">${i}</a></li>
                       </c:when>
                    
                       <c:otherwise>
                            <!-- 현재 페이지를 제외한 나머지 -->
                            <li><a href="/reviewBoard/reviewBoardList/${boardCode}?cp=${i}${sp}">${i}</a></li>

                       </c:otherwise>
                    </c:choose>

                </c:forEach>
                
                <c:if test="${!empty boardList}" >
                <!-- 다음 목록 시작 번호로 이동 -->
                <li><a href="/reviewBoard/reviewBoardList/${boardCode}?cp=${pagination.nextPage}${sp}">&gt;</a></li>

                <!-- 끝 페이지로 이동 -->
                <li><a href="/reviewBoard/reviewBoardList/${boardCode}?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>
                </c:if>

            </ul>
        </div>


     <!-- 검색창 -->
        <form action="${boardCode}" method="get" id="boardSearch">

            <select name="key" id="searchKey">
                <option value="t">제목</option>
                <option value="c">내용</option>
                <option value="tc">제목+내용</option>
                <option value="w">작성자</option>
            </select>

            <input type="text" name="query"  id="searchQuery" placeholder="검색어를 입력해주세요.">

            <button>검색</button>
        </form>


    </main>

    <script>
        // 검색창 이전 검색 기록을 남겨놓기
        const boardSearch = document.querySelector("#boardSearch");
        const searchKey = document.querySelector("#searchKey");
        const searchQuery = document.querySelector("#searchQuery");

        const options = document.querySelectorAll("#searchKey > option");

        (()=>{
            const params = new URL(location.href).searchParams;

            const key = params.get("key"); // t,c,tc,w 중 하나
            const query = params.get("query"); // 검색어

            if(key != null){ //검색을 했을때
                searchQuery.value = query; // 검색어를 화면에 출력
                
                // option태그를 하나씩 순차 접근해서 value가 key랑 같으면
                // selected 속성 추가
                for(let op of options){
                    if(op.value == key){
                        op.selected = true;
                    }
                }

            }

        })();

        // 검색어 입력 없이 제출된 경우
        boardSearch.addEventListener("submit", e=>{

            if(searchQuery.value.trim().length == 0){// 검색어 미 입력시
                e.preventDefault(); // form 기본 이벤트 제거

                location.href = location.pathname// 해당 게시판 1페이지로 이동

                // location.pathname : 쿼리스트링을 제외한 실제 주소
            
            }

        })

        
        /* 스크롤 함수 */
        document.addEventListener('DOMContentLoaded', function () {
            var scrollTopBtn = document.querySelector('.scroll-top-btn');

            window.addEventListener('scroll', function () {
                if (window.pageYOffset > 500) {
                    scrollTopBtn.classList.add('show');
                } else {
                    scrollTopBtn.classList.remove('show');
                }
            });

            scrollTopBtn.addEventListener('click', function (e) {
                e.preventDefault();
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            });
        });
    
    </script>


    <!-- footer 영역 -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />


    
</body>
</html>