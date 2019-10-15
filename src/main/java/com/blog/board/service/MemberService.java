package com.blog.board.service;

import java.util.List;
import java.util.Map;

import com.blog.board.domain.MemberVO;

public interface MemberService {
	
	public MemberVO selectLoginForm(MemberVO memberVO);
	
	public MemberVO SelectIdCheck(MemberVO checkidVO);	
	
	public void InsertSignUpForm(MemberVO signVO);
	
	
}