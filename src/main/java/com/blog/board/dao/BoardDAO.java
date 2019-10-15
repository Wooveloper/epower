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
	
	public List<BoardVO> selectBoardList(BoardVO boardVO)
	{
		return sqlSessionTemplate.selectList("selectBoardList", boardVO);
	}
	
	public List<Map<String,Object>> selectBoardTest01(Map<String,Object> paramMap)
	{
		return sqlSessionTemplate.selectList("selectBoardTest01", paramMap);
	}
	
	public List<Map<String,Object>> selectBoardTest02(Map<String,Object> paramMap)
	{
		return sqlSessionTemplate.selectList("selectBoardTest02", paramMap);
	}
	
	public void InsertBoardDeviceForm(DeviceVO deviceVO)
	{				
		//sqlSessionTemplate.insert("InsertBoardDeviceForm", deviceVO);
	}
	
}
