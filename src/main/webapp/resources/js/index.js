
// 요소의 투명도를 처리하는 함수
function fadeInOnScroll() {
    var elements = document.getElementsByClassName("fade-in");
    for (var i = 0; i < elements.length; i++) {
      var element = elements[i];
      var elementTop = element.getBoundingClientRect().top;
      var elementBottom = element.getBoundingClientRect().bottom;
      var isVisible = elementTop < window.innerHeight && elementBottom >= 0;
  
      if (isVisible) {
        element.classList.add("active");
      } else {
        element.classList.remove("active");
      }
    }

    var events = document.getElementsByClassName("fade-in-2");
    for (var i = 0; i < events.length; i++) {
      var event = events[i];
      var eventTop = event.getBoundingClientRect().top;
      var eventBottom = event.getBoundingClientRect().bottom;
      var isVisible2 = eventTop < window.innerHeight && eventBottom >= 0;
  
      if (isVisible2) {
        event.classList.add("active");
      } else {
        event.classList.remove("active");
      }
    }
  }
  
  // 스크롤 이벤트 리스너 등록
  window.addEventListener("scroll", fadeInOnScroll);
  window.addEventListener("resize", fadeInOnScroll);
  // 초기 로드 시에도 페이드 인 효과 적용을 위해 실행
  fadeInOnScroll();
  