package com.obbang.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.obbang.mapper.board.EventMapper;
import com.obbang.model.board.EventCriteria;
import com.obbang.model.board.EventDTO;

@Service
public class EventServiceImpl implements EventService{
	
	
	@Autowired 
	private EventMapper mapper;
	
	//글쓰기
	@Override
	public void enroll(EventDTO event) {

		mapper.enroll(event);

	}
	//게시판 리스트
	@Override
	public List<EventDTO> getList() {

		return mapper.getList();
	}
	  /* 게시판 조회 */
    @Override
    public EventDTO getPage(int event_eno) {
         
        return mapper.getPage(event_eno);
    }
    /* 게시판 수정 */
    @Override
    public int modify(EventDTO event) {
        
        return mapper.modify(event);
    }
    /* 게시판 삭제 */
    @Override
    public int delete(int event_eno) {
        
        return mapper.delete(event_eno);
    }
	@Override
	public List<EventDTO> getListPaging(EventCriteria event_cri) {
		
		return mapper.getListPaging(event_cri);
	}
	@Override
	public int getTotal(EventCriteria event_cri) {
		return mapper.getTotal();
	}    
 
}
