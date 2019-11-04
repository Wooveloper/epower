package com.blog.board.service;

import java.util.List;
import java.util.Map;

import com.blog.board.domain.BoardVO;
import com.blog.board.domain.DeviceVO;
import com.blog.board.domain.MemberVO;

public interface BoardService {
	
	public List<BoardVO> SelectBoardListForm(BoardVO boardVO);
	
	public List<Map<String,Object>> SelectBoardListForm2(Map<String,Object> paramMap);
	
	public void InsertBoardDeviceForm(DeviceVO diviceVO);
	
	public List<Map<String,Object>> SelectBoardDetailForm(Map<String,Object> paramMap);
	
	public List<Map<String,Object>> UpdateDetailForm(Map<String,Object> paramMap);
	
	public List<Map<String,Object>> DeleteDetailForm(Map<String,Object> paramMap);
		
}
