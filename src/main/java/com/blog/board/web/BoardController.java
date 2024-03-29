package com.blog.board.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.NumberUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.board.domain.BoardVO;
import com.blog.board.domain.MemberVO;
import com.blog.board.domain.PagingVO;
import com.blog.board.domain.DeviceVO;
import com.blog.board.service.BoardService;

@Controller
public class BoardController {

	@Resource(name="BoardService")
	private BoardService boardService;
	
	@RequestMapping(value="/Main.do")
	public String Main(Model model) 
	{		
		return "redirect:/SelectBoardListForm.do";		
	}
	
	
	//게시판
	@RequestMapping(value="/SelectBoardListForm.do")
	public String SelectBoardListForm(Model model, 
			@ModelAttribute("boardVO") BoardVO boardVO,
			@ModelAttribute("memberVO") MemberVO memberVO,
			@RequestParam(value="totalCount", defaultValue="0") int totalCount,
			@RequestParam(value="pageNo", defaultValue="1") int pageNo) 
	{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		PagingVO pagingVO = new PagingVO(totalCount, pageNo, 10, 10);
		paramMap.put("pagingVO", pagingVO);
		List<Map<String,Object>> listMap = boardService.SelectBoardListForm2(paramMap);
		pagingVO.setTotalCount((int)listMap.get(0).get("totalCount"));
		model.addAttribute("listMap", listMap);
		model.addAttribute("pagingVO" , pagingVO);	
		return "blog/main";
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
		return "redirect:/Main.do";
	}
	
	
	
	@RequestMapping(value="/SelectBoardDetailView.do")
	public String SelectBoardDetailView(Model model) {
		return "board/boarddetail";		
	}
	
	//시부랄거
	@RequestMapping(value="/SelectBoardDetailForm.do")
	public String SelectBoardDetailForm(Model model,@ModelAttribute("deviceVO") DeviceVO deviceVO){	
	System.out.println("lalala :" + deviceVO.getdevice_no());
	Map<String,Object> paramMap = new HashMap<String,Object>();
	paramMap.put("deviceVO", deviceVO);
	System.out.println("udiro?BoardDetailForm : " + paramMap);	
	List<Map<String,Object>> listMap = boardService.SelectBoardDetailForm(paramMap);
	model.addAttribute("listMap", listMap);
	
	return "board/boarddetail";
	}
	
	

	//수정
	@RequestMapping(value="/UpdateBoardDetailView.do")
	public String UpdateBoardDetailView(Model model) {
		return "board/boarddetail";		
	}
	
	//device_no 이동 상세페이지 ->수정
	@RequestMapping(value="/SelectDetailForm.do")
	public String SelectDetailForm(Model model,@ModelAttribute("deviceVO") DeviceVO deviceVO){
	System.out.println("udiro?DetailForm : " + deviceVO.getdevice_no());	
	Map<String,Object> paramMap = new HashMap<String,Object>();
	paramMap.put("deviceVO", deviceVO);
	System.out.println("udiro?DetailForm : " + paramMap);	
	List<Map<String,Object>> listMap = boardService.SelectBoardDetailForm(paramMap);
	model.addAttribute("listMap", listMap);
	return "board/boarddetailedit";
	}
    
	//상세페이지 수정
	@RequestMapping(value="/UpdateDetailForm.do")
	public String UpdateDetailForm(Model model,@ModelAttribute("deviceVO") DeviceVO deviceVO){
	System.out.println("no : "+deviceVO.device_no());
	Map<String,Object> paramMap = new HashMap<String,Object>();
	paramMap.put("deviceVO", deviceVO);
	List<Map<String,Object>> listMap = boardService.UpdateDetailForm(paramMap);	
	model.addAttribute("listMap", listMap);
	return "redirect:/SelectBoardDetailForm.do?device_no="+deviceVO.device_no();
	
	}

	
	//상세페이지 삭제
	@RequestMapping(value="/DeleteDetailForm.do")
	public String DeleteDetailForm(Model model,@ModelAttribute("deviceVO") DeviceVO deviceVO){
	System.out.println("test2 = " + deviceVO.device_no());
	Map<String,Object> paramMap = new HashMap<String,Object>();
	paramMap.put("deviceVO", deviceVO);
	boardService.DeleteDetailForm(paramMap);
	return "redirect:/Main.do";
	}

}
