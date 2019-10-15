package com.blog.board.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.board.domain.BoardVO;
import com.blog.board.domain.MemberVO;
import com.blog.board.domain.DeviceVO;
import com.blog.board.domain.PagingVO;
import com.blog.board.service.BoardService;

@Controller
public class BoardController {

	@Resource(name="BoardService")
	private BoardService boardService;
	
	@RequestMapping(value="/selectBoardList.do")
	public String selectBoardList(Model model,
			@ModelAttribute("boardVO") BoardVO boardVO,
			@ModelAttribute("memberVO") MemberVO memberVO ) 
	{
		List<BoardVO> result = boardService.selectBoardList(boardVO);		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		List<Map<String,Object>> listMap01 = boardService.selectBoardTest01(paramMap);
		
		List<Map<String,Object>> listMap02 = boardService.selectBoardTest02(paramMap);
		return "board/boardList";
	}
	
	@RequestMapping(value="/insertBoardForm.do")
	public String insertBoardForm(Model model) 
	{
		return "board/boardWrite";		
	}
	
	@RequestMapping(value="/testBoardList.do")
	public String testBoardList(Model model, 
			@ModelAttribute("boardVO") BoardVO boardVO,
			@ModelAttribute("memberVO") MemberVO memberVO  )
	{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		List<Map<String,Object>> listMap = boardService.selectBoardTest02(paramMap);
		List<BoardVO> result = boardService.selectBoardList(boardVO);		
		PagingVO pagingVO = new PagingVO((Integer)listMap.get(0).get("totalCount"), 1, 10, 10);
		model.addAttribute("listMap222" , result);
		model.addAttribute("listMap" , listMap);

		return "blog/index";
	}
	
	//게시판등록 프론트 
		@RequestMapping(value="/InsertBoardDeviceView.do")
		public String InsertBoardDeviceView(Model model) {
			return "board/boardsign";		
		}
	
	//게시판 등록 백엔드
	@RequestMapping(value="/InsertBoardDeviceForm.do")
    public String InsertBoardDeviceForm(Model model, @ModelAttribute("DeviceVO") DeviceVO deviceVO){
			System.out.println("test1 = " + deviceVO.device_which());
			System.out.println("test2 = " + deviceVO.device_no());
			System.out.println("test3 = " + deviceVO.device_modelname());
			System.out.println("test4 = " + deviceVO.device_specification());
			System.out.println("test5 = " + deviceVO.device_buydate());
			System.out.println("test6 = " + deviceVO.device_manager());
			System.out.println("test6 = " + deviceVO.device_user());			
			System.out.println("test7 = " + deviceVO.device_state());
			System.out.println("test8 = " + deviceVO.device_etc());
			boardService.InsertBoardDeviceForm(deviceVO);
		return null;
	}

}
