package com.obbang.service.member;




import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.obbang.mapper.member.MemberMapper;
import com.obbang.model.member.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper membermapper;

	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}
	@Override
	public int idCheck(String user_id) throws Exception {
		
		return membermapper.idCheck(user_id);
		
		
	}
	
	
	
	
	 /* 로그인 */
    @Override
    public MemberVO memberLogin(MemberVO member) throws Exception {
        
        return membermapper.memberLogin(member);
    }
    
    @Override
    public List<MemberVO> getList() {
        
        return membermapper.getList();
    }
    
    /* 게시판 조회 */
    @Override
    public MemberVO getMember(int user_bno) {
         
        return membermapper.getMember(user_bno);
    }    
    /* 회원 수정 */
    @Override
    public int modify(MemberVO member) {
        
        return membermapper.modify(member);
    }
    
    /* 게시판 삭제 */
    @Override
    public int delete(int user_bno) {
        
        return membermapper.delete(user_bno);
    }  
    @Override
    public MemberVO memberIdSearch(MemberVO searchVO) {
    	
        return membermapper.memberIdSearch(searchVO);
    }
    
    @Override
    public MemberVO memberPwSearch(MemberVO searchVO) {
    	
        return membermapper.memberPwSearch(searchVO);
    }
    
    /* 주문자 정보 */
	@Override
	public MemberVO getMemberInfo(String user_id) {
		
		return membermapper.getMemberInfo(user_id);
		
	}
	

}