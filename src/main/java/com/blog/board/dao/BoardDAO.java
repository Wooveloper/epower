package com.blog.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blog.board.domain.BoardVO;
import com.blog.board.domain.DeviceVO;
import com.blog.board.domain.MemberVO;

@Mapper
@Repository("BoardDAO")
public class BoardDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<BoardVO> SelectBoardListForm(BoardVO boardVO)
	{
		return sqlSessionTemplate.selectList("SelectBoardListForm", boardVO);
	}
	
	public List<Map<String,Object>> SelectBoardListForm2(Map<String,Object> paramMap)
	{
		return sqlSessionTemplate.selectList("SelectBoardListForm2", paramMap);
	}
	
	public void InsertBoardDeviceForm(DeviceVO deviceVO)
	{				
		System.out.println("DAOtest1 = " + deviceVO.device_which());
		System.out.println("DAOtest2 = " + deviceVO.device_no());
		System.out.println("DAOtest3 = " + deviceVO.device_modelname());
		System.out.println("DAOtest4 = " + deviceVO.device_specification());
		System.out.println("DAOtest5 = " + deviceVO.device_buydate());
		System.out.println("DAOtest6 = " + deviceVO.device_manager());
		System.out.println("DAOtest6 = " + deviceVO.device_user());			
		System.out.println("DAOtest7 = " + deviceVO.device_state());
		System.out.println("DAOtest8 = " + deviceVO.device_etc());
		sqlSessionTemplate.insert("InsertBoardDeviceForm", deviceVO);
	}
	
	public List<Map<String,Object>> SelectBoardDetailForm(Map<String,Object> paramMap)
	{
		System.out.println("dao : " + paramMap);
		return sqlSessionTemplate.selectList("SelectBoardDetailForm", paramMap);
	}
	
	public List<Map<String,Object>> UpdateDetailForm(Map<String,Object> paramMap)
	{
		//System.out.println("dao : " + paramMap);
		return sqlSessionTemplate.selectList("UpdateDetailForm", paramMap);
		//return null;
	}
	
}
