package com.blog.board.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.board.domain.MemberVO;
import com.blog.board.service.MemberService;
import com.blog.board.domain.DeviceVO;

@Controller
public class MemberController {

	//시작
	@Resource(name="MemberService")
	private MemberService memberService;
		
	
	//회원가입 페이지 프론트
	@RequestMapping(value="/SelectSignUpView.do")
	public String SelectSignUpView(Model model) {			
		return "member/SignUp";		
	}
	
	//로그인 프론트
	@RequestMapping(value="/selectLoginView.do")
	public String selectLoginView(Model model) {			
		return "member/login";		
	}
	
	
	//회원가입 페이지 백엔드
	@RequestMapping(value="/InsertSignUpForm.do")
    public String InsertSignUpForm(Model model, @ModelAttribute("memberVO") MemberVO signVO){
			System.out.println(signVO);
			memberService.InsertSignUpForm(signVO);
		return "redirect:/selectLoginView.do";
	}
	   
	//로그인 백엔드
	@RequestMapping(value="/selectLoginForm.do")
	public String selectLoginForm(Model model, @ModelAttribute("memberVO") MemberVO memberVO) {
		memberVO = memberService.selectLoginForm(memberVO);
		return "redirect:/selectLoginView.do";
	}
	
	//로그인 테스트-
	@RequestMapping(value="/selectLoginView2.do")
	public String selectLoginView2(Model model) {
		return "member/SignUp";		
	}
	
	@ResponseBody
	@RequestMapping	("/SelectIdCheck.do")
    public int SelectIdCheck(@ModelAttribute ("memberVO") MemberVO checkidVO) {
       // System.out.println("start : " + checkidVO);
        int count = 0;
        checkidVO = memberService.SelectIdCheck(checkidVO);
      //  System.out.println("end : " + checkidVO);
        if (checkidVO == null){
        	count = 1;
        	}else{
        	count = 0;
        }
       // System.out.println("count : " + count);
        return count;
    }
}
	
