// input 태그
const inputImage = document.getElementById("inputImage");

// 이미지 삽입될 div 태그
const inputImageDiv = document.getElementById("inputImageDiv");

// 이미지 삭제 버튼
let deleteImage = document.getElementsByClassName("delete-image");

// 
let preview = document.getElementsByClassName("preview");

let fileNo = 0;
let filesArr = [];

function addFile(obj) {

    for (const file of obj.files) {
        // 첨부파일 검증
        if (validation(file)) {
            // 파일 배열에 담기
            var reader = new FileReader();
            let fileURL;
            reader.readAsDataURL(file);
            reader.onload = e => {
                filesArr.push(file);
                fileURL = e.target.result;
                // 목록 추가
                let htmlData = '';
                htmlData += `<img src="${fileURL}" class="preview${fileNo}">
                            <span onclick="deleteImg(${fileNo})" id="dm${fileNo}" class="delete-image">&times;</span>`
                inputImageDiv.innerHTML += htmlData;
                fileNo++;
            };

        } else {
            continue;
        }

        // 초기화
        inputImage.value = "";
    }

    // const file = e.target.files[0];

    // if(file != undefined) {
    //     const inputImageDiv = document.getElementById("inputImageDiv");
    //     const reader = new FileReader(); // 파일을 읽는 객체
    //     reader.readAsDataURL(file); // 지정된 파일을 읽은 후 result 변수에 URL 형식으로 저장
    //     reader.onload = e => { // 파일을 다 읽은 후 수행
    //         inputImageDiv.innerHTML +=
    //         `<img src="${e.target.result}" class="preview">
    //         <span onclick="deleteImg(${deleteImage.length})" class="delete-image">&times;</span>`
    //     }
    //     filesArr.push(inputImage.value);
    // }
}

// 첨부파일 삭제
function deleteImg(i) {
    document.getElementsByClassName("preview" + i)[0].remove();
    document.getElementById("dm" + i).remove();
    filesArr[i].is_delete = true;
}

/* 첨부파일 검증 */
function validation(obj){
    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
    if (obj.name.length > 100) {
        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
        return false;
    } else if (obj.size > (100 * 1024 * 1024)) {
        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
        return false;
    } else if (obj.name.lastIndexOf('.') == -1) {
        alert("확장자가 없는 파일은 제외되었습니다.");
        return false;
    } else if (!fileTypes.includes(obj.type)) {
        alert("첨부가 불가능한 파일은 제외되었습니다.");
        return false;
    } else {
        return true;
    }
}

/* 폼 전송 */
function submitForm() {
    // 폼데이터 담기
    var form = document.querySelector("form");
    var formData = new FormData(form);
    for (var i = 0; i < filesArr.length; i++) {
        // 삭제되지 않은 파일만 폼데이터에 담기
        if (!filesArr[i].is_delete) {
            formData.append("attach_file", filesArr[i]);
        }
    }

    $.ajax({
        method: 'POST',
        url: 'insert',
        dataType: 'json',
        data: formData,
        async: true,
        timeout: 30000,
        cache: false,
        headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
        success: function () {
            alert("파일업로드 성공");
        },
        error: function (xhr, desc, err) {
            alert('에러가 발생 하였습니다.');
            return;
        }
    })
}