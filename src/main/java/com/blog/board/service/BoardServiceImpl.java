package com.blog.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.board.dao.BoardDAO;
import com.blog.board.domain.BoardVO;
import com.blog.board.domain.DeviceVO;
import com.blog.board.domain.MemberVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name="BoardDAO")
	private BoardDAO boardDAO;
	

	public List<BoardVO> SelectBoardListForm(BoardVO boardVO)
	{
		return this.boardDAO.SelectBoardListForm(boardVO);
		//return null;
	}
	
	public List<Map<String,Object>> SelectBoardListForm2(Map<String,Object> paramMap)
	{
		return this.boardDAO.SelectBoardListForm2(paramMap);
	}

	
	public void InsertBoardDeviceForm(DeviceVO deviceVO)
	{
		this.boardDAO.InsertBoardDeviceForm(deviceVO);
	}
	
	public List<Map<String,Object>> SelectBoardDetailForm(Map<String,Object> paramMap)
	{
		return this.boardDAO.SelectBoardDetailForm(paramMap);
	}



}
