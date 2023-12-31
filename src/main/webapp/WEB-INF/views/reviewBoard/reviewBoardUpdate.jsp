<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 게시판 목록</title>

    <link rel="stylesheet" href="../../../resources/css/reviewBoard/reviewBoardWrite.css">
    <script src="https://kit.fontawesome.com/de9012b52d.js" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

    <main>
       
        <section>

            <h1>리뷰</h1>

            <form action="update" method="POST"
                class="board-write" id="boardUpdateFrm" enctype="multipart/form-data">
            
                <div>

                    <!-- 게시물 제목 -->
                    <div class="titleArea">
                        <i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;<input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력해주세요."
                        value="${board.boardTitle}">
                    </div>

                 
                        
                    <%-- <c:set var="img" value="${img.imagePath}"/> --%>
                      
                      


                    <!-- 업로드 이미지 영역 -->
                    <div class="imgContent">
                        <div class="imageArea">
                            <label for="img" id="labelImg">
                                <img id="preview" class="preview" src="${board.imagePath}" />
                            </label>
                            <input type="file" name="images" class="uploadImg" id="img" accept="image/*">
                            <button type="button" id="deleteBtn">사진삭제</button>
                        </div>
                    </div>

                    <!-- 내용 -->
                    <div class="boardContent">
                        <textarea name="boardContent" id="boardContent"  placeholder="내용을 입력해주세요.">${board.boardContent}</textarea>
                    </div>

                    <div class="frame">
                        <button class="custom-btn btn-5"><span>수정</span></button>
                        <button type="button" id="backBtn" class="custom-btn btn-5"><span>뒤로가기</span></button>
                    </div>

                    <%-- 기존 이미지가 있다가 삭제된 이미지의 순서를 기록 --%>
                    <input type="hidden" name="deleteList" value="">

                    <%-- 수정 성공 시 주소(쿼리스트링) 유지용도 --%>
                    <input type="hidden" name="cp" value=${param.cp}>

                </div>


            </form>



        </section>
        

    </main>

    <script>
        const preview = document.getElementsByClassName("preview")[0];
        const uploadImg = document.getElementsByClassName("uploadImg")[0];
        const deleteImage = document.getElementsByClassName("delete-image")[0];
        const deleteBtn = document.getElementById("deleteBtn");
        
        const deleteSet = new Set();
        // 파일이 선택되거나, 선택 후 취소 되었을 때 
        // for(let i=0; i < uploadImg.length; i++){

       
            // 파일이 선택되거나, 선택 후 취소 되었을 때 
            uploadImg.addEventListener("change", e=>{
        
                const file = e.target.files[0] // 선택된 파일의 데이터
        
                if(file != undefined){ // 파일이 선택 되었을 때 == undefined가 아닐때!!
                    const reader = new FileReader(); // 파일을 읽는 객체
                    reader.readAsDataURL(file);
                    // 지정된 파일을 읽은 후 result 변수에 URL 형식으로 저장

                    reader.onload = e => { // 파일을 다 읽은 후 수행
                        preview.setAttribute("src", e.target.result);

                        // 이미지가 성공적으로 읽어지면
                        // deleteSet에서 삭제
                        deleteSet.delete();
                    }
                } else{ // 선택 후 취소 되었을 때
                    // -> 선택된 파일이 없음 -> 미리보기 삭제
                    preview.removeAttribute("src");
                    
                }
            });
        
            // 미리보기 삭제 버튼(x버튼) 
            deleteBtn.addEventListener("click", () => {
                
                // 미리보기 이미지가 있을 경우
                if(preview.getAttribute("src") != ""){
                    
                    // 미리보기 삭제
                    preview.removeAttribute("src");
                
                    // input type="file" 태그의 value를 삭제
                    // *** input type="file"의 value는 ""(빈칸)만 대입 가능 ***
                    uploadImg.value = "";

                    // deleteSet에 삭제된 이미지 순서(i) 추가
                    deleteSet.add(uploadImg);
                }
            })
        // }
        
        // 게시글 수정 시 제목, 내용 작성 여부 검사
        const boardTitle = document.querySelector("[name='boardTitle']")
        const boardContent = document.querySelector("[name='boardContent']")
        const boardUpdateFrm = document.getElementById("boardUpdateFrm");
        
        boardUpdateFrm.addEventListener("submit", e=>{
            
            if(boardTitle.value.trim().length == ""){
                alert("제목을 입력해주세요!");
                boardTitle.value = "";
                boardTitle.focus();
                e.preventDefault();
                return;
            }
            if(boardContent.value.trim().length == ""){
                alert("내용을 입력해주세요!");
                boardContent.value = "";
                boardContent.focus();
                e.preventDefault();
                return;
            }
            document.querySelector("[name='deleteList']").value = Array.from(deleteSet);

        })

        // 뒤로가기
        const backBtn = document.getElementById("backBtn")

        backBtn.addEventListener("click", () => {

               location.href = "/reviewBoard/reviewBoardList/${board.boardNo}?cp=${pagination.currentPage}${sp}";

        })
    </script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>