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
	
	public List<Map<String,Object>> SelectBoardListForm(Map<String,Object> paramMap)
	{
		return sqlSessionTemplate.selectList("SelectBoardListForm", paramMap);
	}
	
	
	public void InsertBoardDeviceForm(DeviceVO deviceVO)
	{				
		//sqlSessionTemplate.insert("InsertBoardDeviceForm", deviceVO);
	}
	
}
