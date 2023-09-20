// // 방문 날짜 설정(오늘 기준으로 그 달 한 달 간)
// const date = new Date();

// const weekdayList = ['일', '월', '화', '수', '목', '금', '토'];
// const weekday = weekdayList[date.getDay()];

// const year = date.getFullYear();
// const month = date.getMonth() + 1;
// const day = date.getDate();

const selectDay = document.getElementById("input_date");
const selectTime = document.getElementById("selectTime");
const nextBtn = document.getElementById("nextBtn");
const inputAddr = document.getElementById("rs_input0");

// let lastDay;

// if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
//     lastDay = 31;
// } else if(month == 4 || month == 6 || month == 9 || month == 11) {
//     lastDay = 30;
// } else {
//     lastDay = 28;
// }

// let count = 0;
// let index = date.getDay();

// for(let i = day; i <= lastDay; i++) {

//     if(index > 6) {
//         index -= 7;
//     }
    
//     selectDay.innerHTML += `<option>${year}년 ${month}월 ${day + count}일(${weekdayList[index]})</option>`;
//     count++;
//     index++;
// }



selectTime.addEventListener("change",() =>{

    rsStartDate = selectTime.value
    console.log(rsStartDate);
})



/* ------------------------------------------------------------------------------------------------------------------ */

/* 윤년 계산 */
function checkLeapYear(year) {
    if(year % 400 == 0) {
      return true;
  
    } else if (year % 100 == 0) {
      return false;
  
    } else if(year % 4 == 0) {
      return true;
  
    } else {
      return false;
    }
  }
  
  // 현재 월의 첫 째일의 요일을 반환하는 함수
  function getFirstDayofWeek(year, month) {
    // 매개 변수로 받아온 월이 한 자리 수라면 월(0~9) 앞에 0을 붙임
    if(month < 10) month = "0" + month;
  
    // 매개 변수로 받아온 년월의 1일(2023-09-01)의 요일 인덱스(일~토 : 0~6)를 반환
    return (new Date(year + "-" + month + "-01")).getDay(); 
  }
  
  // 년월 변경에 따른 일 변경
  function changeYearMonth(year, month) {
    let month_day = [31,28,31,30,31,30,31,31,30,31,30,31]; // 각 월의 일 수 배열
  
    if(month == 2) { // 2월인 경우
      if(checkLeapYear(year)) month_day[1] = 29; // 해당 년이 윤년이라면 2월의 일 수 = 29
    }
  
    let first_day_of_week = getFirstDayofWeek(year, month);
  
    let arr_calendar = []; // 현재 월의 일 수를 대입할 배열 선언
  
    for(let i = 0; i < first_day_of_week; i++) { // 현재 월의 시작 일 전까지 빈칸 대입할 for문
      arr_calendar.push("");
    }
  
    for(let i = 1; i <= month_day[month - 1]; i++) { // 빈칸 이후 현재 월의 일 수만큼 i++ 대입
      arr_calendar.push(String(i));
    }
  
    let remain_day = 7 - ( arr_calendar.length % 7 ); // 남은 날만큼 빈칸 대입
    if(remain_day < 7) {
      for(let i = 0; i < remain_day; i++) {
        arr_calendar.push("");
      }
    }
  
    renderCalendar(arr_calendar);
  
    function renderCalendar(data) {
      let today = current_day + getFirstDayofWeek(year, month) - 1; // 오늘 일
      let thisMonth = (new Date()).getMonth() + 1; // 이번 달
      let calendarYear = $("#year").val(); // 캘린더 년도
  
      let h = [];
      for(let i = 0; i < data.length; i++) {
        if(i == 0) {
          h.push('<tr>');
  
        } else if(i % 7 == 0) {
          h.push('</tr>');
          h.push('<tr>');
        }
        
        // 조회한 날짜가 이번 달이면서 오늘인 경우
        if(i == today && current_month == thisMonth && current_year == calendarYear) {
          h.push('<td onclick="setDate(' + data[i] +')" id="today">' + data[i] + '</td>');
  
        } else {
          h.push('<td onclick="setDate(' + data[i] +')">' + data[i] + '</td>');
        }
      }
      h.push('</tr>');
  
      $("#tb_tbody").html(h.join(""));
    }
  }
  
  // 날짜 클릭 시 input에 해당 날짜 대입
  function setDate(day) {
    
    const dayOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
    
    if(day == undefined) {
      return;
    }
  
    if(day < 10) day = "0" + day;
  
    let input_year = $("#year").val();
    let input_month = $("#month").val();
  
    if(input_month < 10) {
      input_month = "0" + input_month;
    }
  
    
    const date = new Date();
    let selectDay = input_year + "-" + input_month + "-" + day;
    let sysDate = current_year + "-" + (date.getMonth() + 1) + "-" + current_day;
  
    if( new Date(selectDay) < new Date(sysDate) ) {
      alert("이전 날짜는 선택할 수 없습니다.");
      return;
    }
  
    selectDay += `(${dayOfWeek[new Date(selectDay).getDay()]})`;
  
    $("#input_date").val(selectDay);
    $("#div_calendar").hide();
  }
  
  function changeMonth(diff) {
    if(diff == undefined) { // select에서 선택했을 경우
      current_month = parseInt($("#month").val());
  
    } else {
      current_month = current_month + diff; // -1 or +1
  
      if(current_month == 0) { // 현재 월이 0일 경우
        $("#year").val(Number($("#year").val()) - 1);
        
        current_month = 12;
  
      } else if(current_month == 13) { // 현재 월이 13일 경우
        $("#year").val(Number($("#year").val()) + 1);
        current_month = 1;
      }
    }
    loadCalendar();
  }
  
  function changeYear() {
    changeYearMonth($("#year").val(), current_month);
  }
  
  function loadCalendar() {
    $("#month").val(current_month);
    changeYearMonth($("#year").val(), current_month);
  }
  
  let current_year = (new Date()).getFullYear(); // 현재 년
  let current_month = (new Date()).getMonth() + 1; // 현재 월
  let current_day = (new Date()).getDate(); // 현재 일
  
  $("#year").val(current_year);
  $("#month").val(current_month);
  
  changeYearMonth(current_year, current_month);
  
  $("#input_date").click(function(){
    $("#div_calendar").toggle();
  });


  let rsDate;
selectDay.addEventListener("change",() =>{

    rsDate = selectDay.value
    console.log(rsDate);
})

nextBtn.addEventListener("click", e => {

  if(selectDay.value == "" || selectTime.value == "" || inputAddr.value == ""){
    alert("정보를 입력해주세요.")
    e.preventDefault();
    return;

  }

})