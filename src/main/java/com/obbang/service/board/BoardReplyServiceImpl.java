package com.obbang.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.obbang.mapper.board.BoardReplyMapper;
import com.obbang.model.board.BoardReplyDTO;

@Service
public class BoardReplyServiceImpl implements BoardReplyService{
	
	@Autowired
	private BoardReplyMapper dao;
	// 댓글 조회
	@Override
	public List<BoardReplyDTO> list(int board_bno) {
		return dao.list(board_bno);
	}

	@Override
	public void write(BoardReplyDTO dto) {
		dao.write(dto);
	}

	@Override
	public void modify(BoardReplyDTO dto) {
		dao.modify(dto);
	}

	@Override
	public void delete(BoardReplyDTO dto) {
		dao.delete(dto);
	}

	@Override
	public BoardReplyDTO getUpdate(int reply_rno) {
		return dao.getUpdate(reply_rno);
		
	}

}
