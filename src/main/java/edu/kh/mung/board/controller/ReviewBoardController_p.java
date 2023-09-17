package edu.kh.mung.board.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mung.board.model.dto.Board;
import edu.kh.mung.board.model.dto.BoardImage;
import edu.kh.mung.board.model.service.ReviewBoardService_p;
import edu.kh.mung.member.model.dto.Member;

@Controller
@SessionAttributes("{loginMember}")
@RequestMapping("/reviewBoard")
public class ReviewBoardController_p {

	@Autowired
	private ReviewBoardService_p service;



	// 리뷰 게시글 목록 조회
	@GetMapping("/reviewBoardList")
	public String selectReviewList(
			@RequestParam(value="cp",required=false, defaultValue = "1") int cp
			, Model model
			, @RequestParam Map<String, Object> paramMap 
			){
		int boardCode = 6;

		if(paramMap.get("key") == null) { //검색어가 없을 때( 검색 x )

			// 게시글 목록 조회 서비스 호출
			Map<String, Object> map = service.selectReviewList(boardCode ,cp);

			List<BoardImage> selectImageList = service.selectImageList();

			//System.out.println(selectImageList);

			model.addAttribute("imageList", selectImageList);
			// 조회 결과를 request scope에 세팅 후 forward
			model.addAttribute("map", map);

			/* System.out.println(map); */

		}else { // 검색어가 있을 때( 검색 o )

			paramMap.put("boardCode", boardCode);

			Map<String, Object> map = service.selectReviewList(paramMap, cp);


			model.addAttribute("map",map);

		}


		return "reviewBoard/reviewBoardList";
	}

	//게시글 상세 조회
	@GetMapping("/reviewBoardList/{boardNo}")
	public String reviewDetail(@PathVariable("boardNo") int boardNo
			, Model model
			, RedirectAttributes ra
			, @SessionAttribute(value="loginMember", required=false) Member loginMember
			, HttpServletRequest req
			, HttpServletResponse resp ) throws ParseException{

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("boardNo", boardNo);

		//게시글 상세 조회 서비스 호출
		Board board = service.selectBoard(map);

		board.setImagePath(board.getImagePath()+board.getImageReName());

		/* System.out.println(board.getImagePath()); */

		String path = null;
		
		//조회결과 있을경우
		if(board != null) {

			// 쿠키를 이용한 조회 수 증가 처리
			// 1) 비회원 또는 로그인한 회원의 글이 아닌 경우

			if(loginMember == null || // 비회원
					loginMember.getMemberNo() != board.getMemberNo()) {

				// 2) 쿠키 얻어오기
				Cookie c = null;

				// 요청에 담겨있는 모든 쿠키 얻어오기
				Cookie[] cookies = req.getCookies();

				if(cookies != null) { // 쿠키가 존재할 경우

					// 쿠키 중 "readBoardNo" 라는 쿠키를 찾아서 c에 대입
					for(Cookie cookie : cookies) {
						if(cookie.getName().equals("readBoardNo")) {
							c = cookie;
							break;

						}

					}
				}

				// 3) 기존 쿠키가 없거나 ( c == null )
				//      존재는 하나 현재 게시글 번호가
				//     쿠키에 저장되지 않은 경우(오늘 해당 게시글 본적 없음)
				int result = 0;

				if(c == null) {

					// 쿠키가 존재 X -> 하나 새로 생성
					c = new Cookie("readBoardNo", "|" + boardNo + "|");

					// 조회수 증가 서비스 호출
					result = service.updateReadCount(boardNo);

				} else {
					// 현재 게시글 번호가 쿠키에 있는지 확인

					// Cookie.getValue() : 쿠키에 저장된 모든 값을 읽어옴
					//                 -> String으로 반환

					// String.indexOf("문자열")
					// : 찾는 문자열이 몇번 인덱스에 존재하는지 반환
					//   단, 없으면 -1 반환

					if(c.getValue().indexOf("|" + boardNo + "|") == -1 ) {

						// 쿠키에 현재 게시글 번호가 없다면

						// 기존 값에 게시글 번호 추가해서 다시 세팅
						c.setValue(c.getValue() + "|" + boardNo + "|");

						// 조회수 증가 서비스 호출
						result = service.updateReadCount(boardNo);

					}


				} // 3) 종료

				// 4) 조회 수 증가 성공 시
				// 쿠키가 적용되는 경로, 수명(당일 23시59분 59초) 지정

				if(result > 0 ) {

					// 조회된 board 조회 수와 DB 조회 수 동기화
					board.setReadCount(board.getReadCount() +1);

					// 적용 경로 설정
					c.setPath("/"); // "/" 이하 경로 요청 시 쿠키 서버로 전달

					// 수명 지정
					Calendar cal = Calendar.getInstance(); // 싱글톤 패턴
					cal.add(cal.DATE,1);

					// 날짜 표기법 변경 객체 (DB의 TO_CHAR()와 비슷)
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					// java.util.Date
					Date a = new Date(); // 현재 시간

					Date temp = new Date(cal.getTimeInMillis()); // 내일 (24시간 후)
					// 2023-08-24 12:17:40

					Date b = sdf.parse(sdf.format(temp)); // 내일 0시 0분 0초

					// 내일 0시 0분 0초 - 현재 시간
					long diff = (b.getTime() - a.getTime()) / 1000;
					// -> 내일 0시 0분 0초 까지 남은 시간을 초단위로 반환

					c.setMaxAge((int)diff); // 수명 설정

					resp.addCookie(c); // 응답 객체를 이용해서
					// 클라이언트에게 전달

				}

			}
			path = "reviewBoard/reviewBoardDetail";
			model.addAttribute("board",board);

		}else { //조회 결과 없을경우
			
			path = "redirect:/reviewBoard/reviewBoardList"; 
			
	        ra.addFlashAttribute("message" , "해당 게시글이 존재하지 않습니다.");
		}

		return path;

	}



}
