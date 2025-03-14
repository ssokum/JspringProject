package com.spring.JspringProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.JspringProject.service.User2Service;
import com.spring.JspringProject.vo.UserVo;

@Controller
@RequestMapping("/user2")
public class User2Controller {

	@Autowired
	User2Service userService;

	// user메인화면
	@RequestMapping("/userMain")
	public String userMainGet() {
		return "user2/userMain";
	}

	// user 등록화면 폼보기
	@RequestMapping(value = "/userInput", method = RequestMethod.GET)
	public String userInputGet() {
		return "user2/userInput";
	}

	// user 등록 처리
	@RequestMapping(value = "/userInput", method = RequestMethod.POST)
	public String userInputPost(UserVo vo) {
		// 아이디 중복체크
		UserVo vo2 = userService.getUserIdSearch(vo.getMid());
		System.out.println("vo2 : " + vo2);
		if (vo2 != null)
			return "redirect:/message/user2IdDuplication";

		// 회원 가입처리
		int res = userService.setUserInput(vo);
		if (res != 0)
			return "redirect:/message/user2InputOk";
		else
			return "redirect:/message/user2InputNo";
	}

	// user 개별검색 폼 보기
	@RequestMapping(value = "/userSearch", method = RequestMethod.GET)
	public String userSearchGet() {
		return "user2/userSearch";
	}

	// user 개별검색 처리하기
	@RequestMapping(value = "/userSearchPart", method = RequestMethod.GET)
	public String userSearchPartGet(Model model, UserVo vo) {
		UserVo vo2 = userService.getUserSearchPart(vo);
		System.out.println("vo2: " + vo2);
		if (vo2 == null)
			return "redirect:/message/user2SearchNo";
		
		model.addAttribute("vo", vo2);

		return "user2/userSearch";
	}

	// user 전체 자료 보기
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String userListGet(Model model) {
		List<UserVo> vos = userService.getUserList();

		model.addAttribute("vos", vos);

		return "user2/userList";
	}
	
	// user 삭제처리
			@RequestMapping(value = "/userDeleteOk", method = RequestMethod.GET)
			public String userDeleteOkGet(int idx) {
				int res = userService.setUserDeleteOk(idx);
				
				if(res != 0) return "redirect:/message/user2DeleteOk";
				else return "redirect:/message/user2DeleteNo";
			}
			
			// user 수정 폼 보기
			@RequestMapping(value = "/userUpdate", method = RequestMethod.GET)
			public String userUpdateGet(Model model, int idx) {
				UserVo vo = userService.getSearchIdx(idx);
				
				System.out.println("vo: " + vo);
				model.addAttribute("vo",  vo);
				
				return "user2/userUpdate";
			}
			
			// user 수정 처리하기
			@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
			public String userUpdatePost(Model model, UserVo vo) {
				int res = userService.setUserUpdate(vo);
				
				System.out.println("res: " + res);
				
				if(res != 0) return "redirect:/message/user2UpdateOk";
				else return "redirect:/message/user2UpdateNo";
			}
}
