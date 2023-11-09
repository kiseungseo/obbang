package com.obbang.controller.board;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.obbang.model.board.BoardReplyDTO;
import com.obbang.model.member.MemberVO;
import com.obbang.service.board.BoardReplyService;
import com.obbang.service.board.BoardService;
import com.obbang.service.member.MemberService;

@Controller
@RequestMapping("/boardReply/*")
public class BoardReplyController {
	@Inject
	private BoardReplyService replyService;
	
	@Autowired
	private BoardService bservice;
	
	@Autowired
	private MemberService memberservice;
	
	// 댓글 작성
	@PostMapping (value = "/write")
	public String posttWirte(BoardReplyDTO dto,HttpSession session) {
	    
		MemberVO user = (MemberVO) session.getAttribute("user");
		System.out.println("user"+ user);
        String writer = user.getUser_name();
        dto.setUser_replyname(writer); // 작성자 정보 저
	    
        replyService.write(dto);
	    
	    return "redirect:/board/get?board_bno=" + dto.getBoard_bno();
	}
	
	/* 댓글 삭제 */
	@PostMapping("/delete")
	public void replyDeletePOST(BoardReplyDTO dto) {
		System.out.println("삭제>>>>>>>>>>>>>"+dto);
		replyService.delete(dto);
	}

	/* 댓글 상세 조회 */
    @GetMapping("/getUpdate")
    public void replyUpdateGET(BoardReplyDTO dto, Model model,HttpSession session) throws Exception {
		MemberVO user = (MemberVO) session.getAttribute("user");
		System.out.println("user"+ user);
        BoardReplyDTO reply = replyService.getUpdate(dto.getReply_rno());
        System.out.println("reply : "+ reply);
        model.addAttribute("reply", reply);
    }
    
	/* 댓글 수정 */
	@PostMapping("/modify")
	public void replyModifyPOST(BoardReplyDTO dto) {
		System.out.println("수정>>>>>>>>>>>>>"+dto);
		replyService.modify(dto);
	}

}
