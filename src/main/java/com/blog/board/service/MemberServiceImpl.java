package com.blog.board.service;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.board.dao.MemberDAO;
import com.blog.board.domain.MemberVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name="MemberDAO")
	private MemberDAO memberDAO;
	
	public MemberVO selectLoginForm(MemberVO memberVO)
	{
		return this.memberDAO.selectLoginForm(memberVO);
	}
	
	public MemberVO SelectIdCheck(MemberVO checkidVO)
	{
		return this.memberDAO.SelectIdCheck(checkidVO);
	}
	
	public void InsertSignUpForm(MemberVO signVO)
	{
		this.memberDAO.InsertSignUpForm(signVO);
	}
	
	public MemberVO selectLoginPasswordForm(MemberVO memberPVO)
	{
		return this.memberDAO.selectLoginPasswordForm(memberPVO);
	}
	
}

