package com.blog.board.service;

import java.util.List;
import java.util.Map;

import com.blog.board.domain.BoardVO;
import com.blog.board.domain.DeviceVO;
import com.blog.board.domain.MemberVO;

public interface BoardService {
	
	public List<BoardVO> selectBoardList(BoardVO boardVO);
	
	public List<Map<String,Object>> selectBoardTest01(Map<String,Object> paramMap);
	
	public List<Map<String,Object>> selectBoardTest02(Map<String,Object> paramMap);
	
	public void InsertBoardDeviceForm(DeviceVO diviceVO);
	
}
