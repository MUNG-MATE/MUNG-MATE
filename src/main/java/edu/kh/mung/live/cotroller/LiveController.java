package edu.kh.mung.live.cotroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mung.live.model.dto.LiveCard;
import edu.kh.mung.live.model.dto.LocationService;
import edu.kh.mung.live.model.service.LiveService;
import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.service.MyPageServiceImpl_k;
import edu.kh.mung.myPage.model.service.MyPageService_k;
import edu.kh.mung.reservation.model.dto.Pet2;
import edu.kh.mung.reservation.model.dto.Reservation;

@Controller
@RequestMapping("/live")
@SessionAttributes({"loginMember"})
public class LiveController {
	
	@Autowired
	private LiveService service;
	
	@GetMapping
	public String test() {
		return "/live/live";
	}
	
	@GetMapping("/insertLocation")
	@ResponseBody
	public int insertLocation(LocationService ls) {
		return service.insertLocation(ls);
	}
	
	@GetMapping("/selectLocation")
	@ResponseBody
	public List<LocationService> selectLocation(LocationService ls) {
		System.out.println(ls);
		return service.selectLocation(ls);
	}
	
	@GetMapping("/selectPetImage")
	@ResponseBody
	public List<Pet2> selectPetImage(int rsNo) {
		return service.selectPetImage(rsNo);
	}
	
	@GetMapping("/card/insert")
	public String selectLiveCard(int rsNo, Model model) {
		return "/live/liveCardInsert";
	}
	
	@PostMapping("/card/insert")
	public String insertLiveCard(
			LiveCard lc,
			@RequestParam(value="inputImage", required=false) List<MultipartFile> images,
			@SessionAttribute("loginMember") Member loginMember,
			RedirectAttributes ra,
			HttpSession session) throws IllegalStateException, IOException {
		
		lc.setPetsitterNo(loginMember.getMemberNo());
		
		System.out.println("LiveCard : " + lc);
		System.out.println("images : " + images);
		
		String webPath = "/resources/images/live/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int liveNo = service.insertLiveCard(lc, images, webPath, filePath);
		
		String message = null;
		String path = "redirect:";
		
		if(liveNo > 0) {
			message = "라이브 카드가 등록되었습니다.";
			path += "/myPage/liveCard?rsNo=" + lc.getRsNo();
					
		} else {
			message = "라이브 카드가 등록에 실패했습니다.";
			path += "/";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
}
