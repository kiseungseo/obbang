package com.obbang.service.board;

import java.util.List;

import com.obbang.model.board.BoardReplyDTO;

public interface BoardReplyService {
	
	// 댓글 조회
	public List<BoardReplyDTO> list(int board_bno);

	// 댓글 조회
	public void write(BoardReplyDTO dto);

	// 댓글 수정조회
	public BoardReplyDTO getUpdate(int reply_rno);
	
	// 댓글 수정
	public void modify(BoardReplyDTO dto);

	// 댓글 삭제
	public void delete(BoardReplyDTO dto);
	

}
