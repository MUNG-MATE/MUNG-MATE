let current_year = (new Date()).getFullYear(); // 현재 년
let current_month = (new Date()).getMonth() + 1; // 현재 월
let current_day = (new Date()).getDate(); // 현재 일

$("#year").val(current_year);
$("#month").val(current_month);

let rsDateList = []; // 2023-09-01
let rsTimeList = []; // 14:30
let rList = [];

changeYearMonth(current_year, current_month);

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
    let index = [...data];
    index.splice(0, getFirstDayofWeek(year, month));

    let today = current_day + getFirstDayofWeek(year, month) - 1; // 오늘 일
    
    let thisMonth = (new Date()).getMonth() + 1; // 이번 달
    if(thisMonth < 10) thisMonth = "0" + thisMonth;

    let calendarMonth = $("#month").val();
    if(calendarMonth < 10) calendarMonth = "0" + calendarMonth;
    
    let calendarYear = $("#year").val(); // 캘린더 년도

    let h = [];

    /* ajax */
    fetch("selectRsList?memberNo=" + memberNo)
    .then(resp => resp.json())
    .then(rsList => {

      for(let rs of rsList) {
        
        let rsYear = new Date(rs.rsDate).getFullYear();
        let rsMonth = new Date(rs.rsDate).getMonth() + 1;
        let rsDay = new Date(rs.rsDate).getDate();
        let rsHour = new Date(rs.rsDate).getHours();
        let rsMinutes = new Date(rs.rsDate).getMinutes();

        if(rsMonth < 10) rsMonth = "0" + rsMonth;
        if(rsDay < 10) rsDay = "0" + rsDay;
        if(rsHour < 10) rsHour = "0" + rsHour;
        if(rsMinutes < 10) rsMinutes = "0" + rsMinutes;
        
        let rsDate = rsYear + "-" + rsMonth + "-" + rsDay;
        let rsTime = rsHour + ":" + rsMinutes;

        rsDateList[rsDateList.length] = rsDate;
        rsTimeList[rsTimeList.length] = rsTime;
        rList[rList.length] = rs;
      }
      
      for(let i = 0; i < data.length; i++) {
        
        let dataDay = 0;

        if(data[i] < 10) dataDay = "0" + data[i];
        else dataDay = data[i];

        let i_day = calendarYear + "-" + calendarMonth + "-" + dataDay;

        if(i == 0) {
          h.push('<tr>');
  
        } else if(i % 7 == 0) {
          h.push('</tr>');
          h.push('<tr>');
        }
        
        h.push('<td onclick="setDate(' + data[i] +')" ');
  
        // 조회한 날짜가 이번 달이면서 오늘인 경우
        if(i == today && calendarMonth == thisMonth && current_year == calendarYear) {
          h.push('id="today" class="day' + data[i] + '"><div class="day_div">' + data[i]);

          for(let i = 0 ; i < rsDateList.length; i++) {
            if(rsDateList[i] == i_day) {
              h.push('<div class="rs-point"></div>');
              break;
            }
          }
          
          h.push('</div>');

          // if(일정이 있을 때 추가)
          for(let i = 0 ; i < rsDateList.length; i++) {
            if(rsDateList[i] == i_day) {
              h.push('<div class="schedule">[' + rsTimeList[i] + '] ' + rList[i].serviceType + '(' + rList[i].serviceTime + ')</div>');
            }
          }
  
          h.push('</td>');
  
        } else {
          h.push('class="day' + data[i] + '"><div class="day_div">' + data[i]);
  
          // if(일정이 있을 때 추가)
          for(let i = 0 ; i < rsDateList.length; i++) {
            if(rsDateList[i] == i_day) {
              h.push('<div class="rs-point"></div>');
              break;
            }
          }
  
          h.push('</div>');
  
          // if(일정이 있을 때 추가)
          for(let i = 0 ; i < rsDateList.length; i++) {
            if(rsDateList[i] == i_day) {
              h.push('<div class="schedule">[' + rsTimeList[i] + '] ' + rList[i].serviceType + '(' + rList[i].serviceTime + ')</div>');
            }
          }
  
          h.push('</td>');
        }
      }
      h.push('</tr>');
  
      $("#tb_tbody").html(h.join(""));
      
    })
    .catch(e => console.log(e))
    
  }
}


// 날짜 클릭 시 input에 해당 날짜 대입
function setDate(day) {
  
  const dayOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
  
  // 선택된 날짜가 없으면 실행 X
  if(day == undefined) return;

  // 날짜 세팅
  if(day < 10) day = "0" + day;
  let input_year = $("#year").val();
  let input_month = $("#month").val();
  if(input_month < 10) input_month = "0" + input_month;
  
  let selectDay = input_year + "-" + input_month + "-" + day; // 2023-09-14

  let flag = false;

  for(let i = 0; i < rList.length; i++) {
    if(rsDateList[i] == selectDay) {
      $("#serviceType").html(rList[i].serviceType + " [" + rList[i].serviceTime + "]");
      selectDay += `(${dayOfWeek[new Date(selectDay).getDay()]})`; // 요일 추가
      $("#serviceDate").html(selectDay + " " + rList[i].serviceTime);
      $("#servicePrice").html((rList[i].servicePrice).toLocaleString('ko-KR') + "원");
      $("#address").html(rList[i].memberAddress);

      let p = [];
      for(let j = 0; j < rList[i].petList.length; j++) {
        p.push('<div>');
        p.push(`<img src="${rList[i].petList[j].petProfile}" class="pet-image">`);
        p.push(`<div class="pet-name">${rList[i].petList[j].petName}</div>`);
        p.push('</div>');
      }
      $("#pet-area").html(p.join(""));
      flag = true;
    }
  }
  
  if(!flag) return;

  // 앞면 -> 뒷면
  $(".card").css("transform", "rotateY(180deg)");
}

// 뒷면 -> 앞면
function flip() {
  $(".card").css("transform", "rotateY(0deg)");
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