package com.obbang.mapper.board;

import java.util.List;

import com.obbang.model.board.EventCriteria;
import com.obbang.model.board.EventDTO;


public interface EventMapper {
	
	/* 이벤트 등록 */
    public void enroll(EventDTO event);
    /* 이벤트 게시판 목록 */
    public List<EventDTO> getList();
    /* 이벤트 게시판 조회 */
    public EventDTO getPage(int event_eno);
    /* 이벤트 게시판 수정 */
    public int modify(EventDTO event);
    /* 이벤트 게시판 삭제 */
    public int delete(int event_eno);
    /* 이벤트 게시판 목록(페이징 적용) */
    public List<EventDTO> getListPaging(EventCriteria event_cri);
    /* 이벤트 게시판 총 갯수 */
    public int getTotal();
 


}
