<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<div id="replyArea">
    <!-- 댓글 목록 -->
    <div class="reply-list-area">
        
        <ul id="replyList">

            <c:forEach items="${board.replyList}" var="reply">

            <!-- 부모/자식 댓글 -->  
                    <li class="reply-row <c:if test='${reply.parentNo != 0}'>child-reply</c:if>">
                        <p class="reply-writer">

                            <!-- 프로필 이미지 -->
                            <c:if test="${empty reply.profileImage}" >
                                <%-- 없을 경우 기본 이미지 --%>
                                <img class="profile" src="../../../resources/images/user.png">
                            </c:if>
                            <c:if test="${!empty reply.profileImage}" >
                                <img class="profile" src="${reply.profileImage}">
                            </c:if>

                            <!-- 닉네임 -->
                            <span>${reply.memberNickname}</span>
                            
                            <!-- 작성일 -->
                            <span class="reply-date">${reply.replyCreateDate}</span>
                        </p>
                        
                        <!-- 댓글 내용 -->
                        <p class="reply-content">${reply.replyContent}</p>


                        <!-- 버튼 영역 -->
                        <div class="reply-btn-area">

                            <c:if test="${!empty loginMember.memberNo}" >
                            <button onclick="showInsertReply(${reply.replyNo}, this)">답글</button>   
                            </c:if>
                                
                            <!-- 로그인 회원과 댓글 작성자가 같은 경우 -->  
                            <c:if test="${reply.memberNo == loginMember.memberNo}" >
                                <button onclick="showUpdateReply(${reply.replyNo}, this)">수정</button>     
                                <button onclick="deleteReply(${reply.replyNo})">삭제</button>
                            </c:if>
                        </div>
                    </li>

            </c:forEach>
        

            

        </ul>
    </div>
    

    <!-- 댓글 작성 부분 -->
    <div class="reply-write-area">
        <textarea id="replyContent"></textarea>
        <button id="addReply">
            댓글<br>
            등록
        </button>
 
    </div>

</div>

<script>
    const boardNo = ${board.boardNo};
</script>