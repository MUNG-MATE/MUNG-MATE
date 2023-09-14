<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- map에 저장된 값들을 각각 변수에 저장 --%>
<c:set var="pagination" value="${map.pagination}"/>
<c:set var="boardList" value="${map.boardList}"/>




<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 게시판 목록</title>

    <link rel="stylesheet" href="../../../resources/css/reviewBoard/reviewBoardList.css">

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />


    <main>

       
        <!-- 게시판 제목 영역 -->
        <div>
            <h1>리뷰</h1>
        </div>

        <c:if test="${!empty param.key}" >
            <h3 style="margin:30px">"${param.query}" 검색결과<h3>
        </c:if>

        <section>

            <!-- 게시글 영역 -->
            <c:choose>
               <c:when test="${empty boardList}">
                <!-- 게시글 목록 조회 결과가 비어있다면 -->
                    <h3>게시글이 존재하지 않습니다</h3>
               </c:when>
            
               <c:otherwise>
                    <c:forEach items="${boardList}" var="board">
                    <%-- 게시글 있으면 --%>
                            <div class="h-list">

                                <div>
                                    <div>${board.boardNo}</div>
                                    <a href="/reviewBoard/reviewBoardList/${board.boardNo}?cp=${pagination.currentPage}${sp}">${board.boardTitle}</a>
                                                           
                                    <div>${board.memberNickname} | ${board.boardDate}</div>
                                </div>

                                <c:if test="${!empty board.imagePath}">    
                                <div>
                                    <img src="${board.imagePath}" class="h-listImg">
                                </div>
                                </c:if>

                            </div>
                    </c:forEach>
               </c:otherwise>
            </c:choose>

        


        </section>

        <div class="btn-area">

            <!-- 로그인 상태일 경우 글쓰기 버튼 노출 -->

                <c:if test="${!empty loginMember}" >
                    <a href="/reviewBoard/reviewBoardWrite"><button id="insertBtn">글쓰기</button></a>                
                </c:if>

        </div>

        <!-- 페이지 네이션 영역 -->
        <div class="pagination-area">


            <ul class="pagination">
            
                <!-- 첫 페이지로 이동 -->
                <li><a href="/reviewBoard/reviewBoardList/${boardCode}?cp=1${sp}">&lt;&lt;</a></li>

                <!-- 이전 목록 마지막 번호로 이동 -->
                <li><a href="/reviewBoard/reviewBoardList/${boardCode}?cp=${pagination.prevPage}${sp}">&lt;</a></li>

           
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
                
                <!-- 다음 목록 시작 번호로 이동 -->
                <li><a href="/reviewBoard/reviewBoardList/${boardCode}?cp=${pagination.nextPage}${sp}">&gt;</a></li>

                <!-- 끝 페이지로 이동 -->
                <li><a href="/reviewBoard/reviewBoardList/${boardCode}?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

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
    </script>


    <!-- footer 영역 -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />


    
</body>
</html>