package com.obbang.mapper.board;

import java.util.List;

import com.obbang.model.board.BoardDTO;
import com.obbang.model.board.Criteria;


public interface BoardMapper {
	/* 작가 등록 */
    public void enroll(BoardDTO board);
    /* 게시판 목록 */
    public List<BoardDTO> getList();
    /* 게시판 조회 */
    public BoardDTO getPage(int board_bno);
    /* 게시판 수정 */
    public int modify(BoardDTO board);
    /* 게시판 삭제 */
    public int delete(int board_bno);
    /* 게시판 목록(페이징 적용) */
    public List<BoardDTO> getListPaging(Criteria cri);
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);

}
