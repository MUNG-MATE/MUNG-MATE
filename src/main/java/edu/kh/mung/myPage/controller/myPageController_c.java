package edu.kh.mung.myPage.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mung.board.model.dto.BoardImage;
import edu.kh.mung.member.model.dto.Member;
import edu.kh.mung.myPage.model.dto.Pet;
import edu.kh.mung.myPage.model.service.myPageService_c;

@Controller
@SessionAttributes({"loginMember","loginMemberPet"})
public class myPageController_c {
	
	@Autowired
	private myPageService_c service;
	
	@RequestMapping("/myPage/petInfo")
	public String petInfo(@SessionAttribute("loginMemberPet")List<Pet> loginMemberPetList) {

		return "myPage/petInfo";
	}
	
	@RequestMapping("/myPage/petInfo/insert")
	public String petInfoInsert() {
		return "myPage/petInfoInsert";
	}

	@RequestMapping("/myPage/petInfo/add")
	public String petInfoInsert(@RequestParam("petName") String petName
							  , @RequestParam("petType") String petType
							  , @RequestParam("petBirth") String petBirth
							  , @RequestParam("gender") String petGender
							  , @RequestParam("petOption") String petOption
							  , @SessionAttribute("loginMember") Member loginMember
							  , @RequestParam("inputImage")MultipartFile profileImage
							  , HttpSession session
							  , RedirectAttributes ra
							  , @SessionAttribute("loginMemberPet")List<Pet> loginMemberPet) throws IllegalStateException, IOException {
		
		Pet newPet = new Pet();
		
		newPet.setPetName(petName);
		newPet.setPetType(petType);
		newPet.setPetBirth(petBirth);
		if(petGender.equals("m")) {
			petGender = "남";
			newPet.setPetGender(petGender);
			
		}else {
			petGender = "남";
			newPet.setPetGender(petGender);
		}
		newPet.setPetOption(petOption);
		newPet.setMemberNo(loginMember.getMemberNo());
		
		String webPath = "/resources/images/pet/";
		
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int result = service.insertPet(profileImage, webPath, filePath, newPet);
		
		
		String path = "redirect:";
		String message = null;
		
		if(result > 0) {
			
			int petNo = service.selectPetNo(newPet);
			
			newPet.setPetNo(petNo);
			
			loginMemberPet.add(newPet);
			
			path += "/myPage/petInfo"; 
			message = "새로운 반려견이 등록되었습니다.";
			
		}else{
			
			path += "/myPage/petInfo/insert";
			message = "반려견 등록 실패 !!";
			
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
	@RequestMapping("/myPage/petInfo/delete")
	@ResponseBody
	public int deletePet(@RequestBody int petNo
						   ,@SessionAttribute("loginMemberPet")List<Pet> loginMemberPet
						   ,RedirectAttributes ra) {
		
		int result = service.deletePet(petNo);
		
		if(result > 0) {
			
			loginMemberPet.removeIf(pet -> pet.getPetNo() == petNo);
			
		}
	
		return result;
	}
	
	@RequestMapping("/myPage/petInfo/update")
	public String updatePet(Pet pet
						   ,Model model) {
		
		model.addAttribute("pet", pet);
		
		return "myPage/petInfoUpdate"; 
	}
	
	@RequestMapping("/myPage/petInfo/updatePet")
	public String updatePet(@RequestParam("petNo") int petNo
						  ,	@RequestParam("petName") String petName
						  , @RequestParam("petType") String petType
						  , @RequestParam("petBirth") String petBirth
						  , @RequestParam("gender") String petGender
						  , @RequestParam("petOption") String petOption
						  , @RequestParam("petImage") String petImage
						  , @SessionAttribute("loginMember") Member loginMember
						  , @RequestParam("inputImage")MultipartFile profileImage
						  , @SessionAttribute("loginMemberPet") List<Pet> loginMemberPetList 
						  , HttpSession session
						  , RedirectAttributes ra
						  , Model model
						  , @SessionAttribute("loginMemberPet")List<Pet> loginMemberPet) throws IllegalStateException, IOException {
		
		Pet pet = new Pet();
		
		pet.setPetNo(petNo);
		pet.setMemberNo(loginMember.getMemberNo());
		pet.setPetBirth(petBirth);
		if(petGender.equals("m")) {
			petGender = "남";
			pet.setPetGender(petGender);
			
		}else {
			petGender = "남";
			pet.setPetGender(petGender);
		}
		pet.setPetName(petName);
		pet.setPetOption(petOption);
		pet.setPetType(petType);
		pet.setPetProfile(petImage);
		
		System.out.println("변경하려는 펫 정보  : " + pet);


		String webPath = "/resources/images/pet/";

		String filePath = session.getServletContext().getRealPath(webPath);
		
		int result = service.updatePet(profileImage, webPath, filePath, pet);
		 
		String message = "";
		String path;
		
		if(result > 0) {
			
			for (Pet petInfo : loginMemberPetList) {
			    if (petInfo.getPetNo() == petNo) {
			    	
			    	petInfo.setPetName(pet.getPetName());
			    	petInfo.setPetBirth(pet.getPetBirth());
			    	petInfo.setPetGender(pet.getPetGender());
			    	petInfo.setPetNo(pet.getPetNo());
			    	petInfo.setPetOption(pet.getPetOption());
			    	petInfo.setPetProfile(pet.getPetProfile());
			    	petInfo.setPetType(pet.getPetType());
			    	
			    
			    }
			}
			System.out.println(loginMemberPetList);
			session.setAttribute("loginMemberPetList", loginMemberPetList);
			
			message = "반려견의 정보가 수정되었습니다.";
			path = "myPage/petInfo";
			model.addAttribute("message", message);
		}else {
			message = "반려견 정보 수정 실패 !!";
			path = "redirect:myPage/petInfoUpdate";
			ra.addFlashAttribute("message", message);
		}
		
		
		
		return path;
		
	}
	
	
	@RequestMapping("/myPage/myPost")
	public String myPostList(@RequestParam(value="cp",required=false, defaultValue = "1") int cp
						   , @SessionAttribute("loginMember") Member loginMember
						   , Model model) {
		
		Map<String, Object> map = service.selectMyPostList(loginMember, cp);
		
		List<BoardImage> selectImageList = service.selectImageList();
		
		System.out.println(selectImageList);
		
		model.addAttribute("imageList", selectImageList);
		
		model.addAttribute("map", map);
		
		return "myPageBoard/myPageBoardList";
	}
	
	
	
	
	
	
}
