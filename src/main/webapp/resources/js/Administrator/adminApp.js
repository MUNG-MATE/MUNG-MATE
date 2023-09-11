

function selectApp(){

    $.ajax({
        url : contextPath + "/admin/selectbookList",
        type : "get",
        dataType : "JSON",
        success : function(rsvList){

            const applistTable = document.getElementById("appListtable");
            const appList = document.getElementById("adminappList");

            appList.innerHTML= "";

                /* 큰 틀 */
                const appRow = document.createElement("div");
                appRow.setAttribute("id", "adminRsvList");

                /* 타이틀 부분 */
                const appTitle = document.createElement("div");
                appTitle.classList.add("C-rsvlist-container");
                appTitle.setAttribute("id","Ctitle");

                const title1 = document.createElement("div");
                title1.innerHTML = "신청번호";
                const title2 = document.createElement("div");
                title2.innerHTML = "신청지역";
                const title3 = document.createElement("div");
                title3.innerHTML = "반려동물 경험";
                const title4 = document.createElement("div");
                title4.innerHTML = "신청내용";
                const title5 = document.createElement("div");
                title5.innerHTML = "신청일";
                const title6 = document.createElement("div");
                title6.innerHTML = "신청회원이메일";

                appTitle.append(title1);
                appTitle.append(title2);
                appTitle.append(title3);
                appTitle.append(title4);
                appTitle.append(title5);
                appTitle.append(title6);

                appRow.append(appTitle);
                appList.append(appRow);

                for(let app of appList){
                    
                const container = document.createElement("div");
                container.classList.add("C-rsvlist-container");


                const appNo = document.createElement("div");
                appNo.innerHTML= app.appNo;
                const appLocation = document.createElement("div");
                appLocation.innerHTML = app.appLocation;
                const appEx = document.createElement("div");
                appEx.innerHTML = app.appEx;
                const appContent = document.createElement("div");
                appContent.innerHTML = app.appContent;
                const appDate = document.createElement("div");
                appDate.innerHTML = app.appDate;
                const memberEmail = document.createElement("div");
                memberEmail.innerHTML = app.memberEmail;
                const cancelBtnarea = document.createElement("div")

                
                const btn = document.createElement("button");
                btn.setAttribute("onclick","deleteReservation(" + app.appNo + ")");
                btn.innerHTML = "취소";
                cancelBtnarea.append(btn);
                
                container.append(appNo);
                container.append(appLocation);
                container.append(appEx);
                container.append(appContent);
                container.append(appDate);
                container.append(memberEmail);
                container.append(cancelBtnarea);
                
                appList.append(container);
            }
            applistTable.append(appList);

        },
        error : function(){
            console.log("에러발생!!!");    
        }
    })



}







function deleteApp(bookNo){


        if (confirm("정말 취소하시겠습니까?")) {

            $.ajax({
                url: contextPath+"/admin/delete",
                data: {"bookNo" : bookNo},
                type: "GET",
                success: function(result) {

                    if(result > 0){
                        alert("해당 객실의 예약이 취소되었습니다.");
                        selectApp();
                    }else{
                        alert("해당 객실의 예약을 취소할 수 없습니다.");
                    }
                },
                error: function (req,status,error) {
                    console.log("예약 취소 실패");
                    console.log(req.responseText);
                }
            })
        }

}
