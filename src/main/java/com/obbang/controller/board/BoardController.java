package com.obbang.controller.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.obbang.model.board.BoardDTO;
import com.obbang.model.board.BoardReplyDTO;
import com.obbang.model.board.Criteria;
import com.obbang.model.board.PageMakerDTO;
import com.obbang.model.member.MemberVO;
import com.obbang.service.board.BoardReplyService;
import com.obbang.service.board.BoardService;
import com.obbang.service.member.MemberService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService bservice;

	@Inject
	private BoardReplyService replyService;
	
	@Autowired
	private MemberService memberservice;
	
    /* 게시판 목록 페이지 접속(페이징 적용) */
    @GetMapping("/list")
    public void boardListGET(Model model, Criteria cri) {
        
    	log.info("boardListGET");

    	List<BoardDTO> list = bservice.getListPaging(cri);
    	int total = bservice.getTotal(cri);
    	PageMakerDTO pageMake = new PageMakerDTO(cri, total);
    	model.addAttribute("list", list);
    	model.addAttribute("pageMaker", pageMake);
        
    	log.info("list" + list);
    }  

    
	@GetMapping("/enroll")
	// => @RequestMapping(value="enroll", method=RequestMethod.GET)
	public void boardEnrollGET() {

		log.info("게시판 등록 페이지 진입");

	}
	/* 게시판 등록 */
	@PostMapping("/enroll")
	public String boardEnrollPOST(BoardDTO board,RedirectAttributes rttr,HttpSession session) {
		
		MemberVO user = (MemberVO) session.getAttribute("user");
        String writer = user.getUser_name();
        board.setUser_boardname(writer); // 작성자 정보 저장
       
		bservice.enroll(board);
		rttr.addFlashAttribute("result", "enrol success");
		return "redirect:/board/list";
	}

    /* 게시판 조회 */
    @GetMapping("/get")
    public void boardGetPageGET(int board_bno, Model model,HttpSession session) throws Exception {
    	MemberVO user = (MemberVO) session.getAttribute("user");
    	System.out.println("user: "+ user);
        model.addAttribute("pageInfo", bservice.getPage(board_bno));
        // 댓글 조회
        List<BoardReplyDTO> reply = replyService.list(board_bno);
        model.addAttribute("reply", reply);
        System.out.println("reply ="  +  reply);
    }
    
    /* 수정 페이지 이동 */
    @GetMapping("/modify")
    public void boardModifyGET(int board_bno, Model model) {
        
        model.addAttribute("pageInfo", bservice.getPage(board_bno));
        
    }

    /* 페이지 수정 */
    @PostMapping("/modify")
    public String boardModifyPOST(BoardDTO board, RedirectAttributes rttr) {
        
        bservice.modify(board);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/board/list";
        
    }
    
    /* 페이지 삭제 */
    @PostMapping("/delete")
    public String boardDeletePOST(int board_bno, RedirectAttributes rttr) {
        
        bservice.delete(board_bno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/board/list";
    }
    


}
