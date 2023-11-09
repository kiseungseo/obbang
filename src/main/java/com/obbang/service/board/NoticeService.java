package com.obbang.service.board;

import java.util.List;

import com.obbang.model.board.Criteria;
import com.obbang.model.board.NoticeDTO;

public interface NoticeService {
	/* 게시판 등록 */
	public void enroll(NoticeDTO notice);
	/* 게시판 목록 */
	public List<NoticeDTO> getList();
    /* 게시판 조회 */
    public NoticeDTO getPage(int notice_nno);
    /* 게시판 수정 */
    public int modify(NoticeDTO notice);
    /* 게시판 삭제 */
    public int delete(int notice_nno);
    /* 게시판 목록(페이징 적용) */
    public List<NoticeDTO> getListPaging(Criteria cri);
    /* 게시판 총 갯수 */
    public int getTotal(Criteria cri);
	
}
