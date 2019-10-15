package com.blog.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blog.board.domain.MemberVO;

@Mapper
@Repository("MemberDAO")
public class MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public MemberVO selectLoginForm(MemberVO memberVO)
	{				
		return sqlSessionTemplate.selectOne("selectLoginForm", memberVO);
	}
	
	public MemberVO SelectIdCheck(MemberVO checkidVO)
	{				
		return sqlSessionTemplate.selectOne("SelectIdCheck", checkidVO);
	}
	
	public void InsertSignUpForm(MemberVO signVO)
	{				
		sqlSessionTemplate.insert("InsertSignUpForm", signVO);
	}
	
	//public List<BoardVO> selectBoardList(BoardVO boardVO);
	/*
	{
		System.out.println("***selectBoardList-DAO***");
		//return selectList("BoardSql.selectBoardList");
		//Map<String,Object> paramMap = new HashMap<String,Object>();
		
		//Test
		//connection = getOracle();
		//Test
		
		return sqlSession.selectList("com.blog.board.dao.BoardMapper.selectBoardList", boardVO);
		//return null;
	}
	*/
	public void selectLoginView_TEST()
	{			
		System.out.println("aaass");
		sqlSessionTemplate.selectOne("selectLoginView_TEST");
	}
}
