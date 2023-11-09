package com.obbang.controller.member;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.JavaMailSender;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.obbang.model.member.MemberVO;
import com.obbang.service.member.MemberService;


@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	 @Autowired
	    private JavaMailSender mailSender;
	
	
	@Autowired
	private MemberService memberservice;



	//회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void joinGET() {

		logger.info("회원가입 페이지 진입");

	}

	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception{

		logger.info("join 진입");

		// 회원가입 서비스 실행
		memberservice.memberJoin(member);

		logger.info("join Service 성공");

		return "redirect:/store/home";

	}

	//로그인 페이지 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGET() {

		logger.info("로그인 페이지 진입");

	}

	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String user_id) throws Exception{

		// logger.info("memberIdChk() 진입");
		logger.info("memberIdChk() 진입");

		int result = memberservice.idCheck(user_id);

		logger.info("결과값 = " + result);

		if(result != 0) {

			return "fail";	// 중복 아이디가 존재

		} else {

			return "success";	// 중복 아이디 x

		}	
	}

	//이메일 인증
//	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
//	@ResponseBody
//	public String mailCheckGET(String email) throws Exception{
//		/* 뷰로부터 넘어온 데이터 확인 */
//		logger.info("이메일 데이터 전송 확인");
//		logger.info("인증메일" + email);
//
//		/* 인증번호(난수) 생성 */
//		Random random = new Random();
//		int checkNum = random.nextInt(888888) + 111111;
//		logger.info("인증번호 " + checkNum);
//
//		String setFrom = "police-112@naver.com"; //발신용 메일 아이디를 넣으면 됨.
//		String toMail = email;
//		String title = "회원가입 인증 이메일 입니다.";
//		String content = 
//				"홈페이지를 방문해주셔서 감사합니다." +
//						"<br><br>" + 
//						"인증 번호는 " + checkNum + "입니다." + 
//						"<br>" + 
//						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
//
//		try {
//
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
//			helper.setFrom(setFrom);
//			helper.setTo(toMail);
//			helper.setSubject(title);
//			helper.setText(content,true);
//			mailSender.send(message);
//
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//
//		String num = Integer.toString(checkNum);
//
//		return num;
//
//	}

	/* 로그인 */
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO user, RedirectAttributes rttr) throws Exception{

		//   System.out.println("login 메서드 진입");
		// System.out.println("전달된 데이터 : " + member);

		HttpSession session = request.getSession();
		MemberVO lvo = memberservice.memberLogin(user);


		if(lvo == null) {                 // 일치하지 않는 아이디, 비밀번호 입력 경우

			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";

		}



		session.setAttribute("user", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)

		return "redirect:/store/home";


	} 

	/* 로그아웃 */
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception{

		logger.info("logoutMainGET메서드 진입");

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/store/home";        

	}

	/* 회원 목록  */
	@RequestMapping(value="list", method=RequestMethod.GET)
	public void listListGET(Model model) {

		logger.info("게시판 목록 페이지 진입");

		model.addAttribute("list", memberservice.getList());

	}

	/* 회원 조회 */
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public void memberGetPageGET(int user_bno, Model model) {

		model.addAttribute("pageInfo", memberservice.getMember(user_bno));

	}

	/* 회원 수정 페이지 이동 */
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public void memberModifyGET(int user_bno, Model model) {

		model.addAttribute("pageInfo", memberservice.getMember(user_bno));

	}
	
	/* 페이지 수정 */
    @PostMapping("/modify")
    public String memberModifyPOST(MemberVO member, RedirectAttributes rttr) {
        
        memberservice.modify(member);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/store/home";
        
    }
	
	/* 회원 삭제 */
    @PostMapping("/delete")
    public String boardDeletePOST(int user_bno, RedirectAttributes rttr) {
        
        memberservice.delete(user_bno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/member/list";
    }
    
    /* 아이디 찾기 */
    @RequestMapping(value = "/search_id", method = RequestMethod.GET)
    public String search_id(HttpServletRequest request, Model model,
            MemberVO searchVO) {
        
        
        return "/member/search_id";
    }
    @RequestMapping(value = "/search_result_id")
    public String search_result_id(HttpServletRequest request, Model model,
        @RequestParam(required = true, value = "user_name") String user_name, 
        @RequestParam(required = true, value = "user_phone") String user_phone,
        MemberVO searchVO) {
    try {
        searchVO.setUser_name(user_name);
        searchVO.setUser_phone(user_phone);
        MemberVO memberSearch = memberservice.memberIdSearch(searchVO);
        
        model.addAttribute("searchVO", memberSearch);
     
    } catch (Exception e) {
        System.out.println(e.toString());
        model.addAttribute("msg", "오류가 발생되었습니다.");
    }
    return "/member/search_result_id";
    }
    
    /* 비밀번호 찾기 */
    @RequestMapping(value = "/search_pw", method = RequestMethod.GET)
    public String search_pw(HttpServletRequest request, Model model,
            MemberVO searchVO) {
        return "/member/search_pw";
    }
    @RequestMapping(value = "/search_result_pw")
    public String search_result_pw(HttpServletRequest request, Model model,
        @RequestParam(required = true, value = "user_id") String user_id, 
        @RequestParam(required = true, value = "user_name") String user_name,
        @RequestParam(required = true, value = "user_phone") String user_phone,
        MemberVO searchVO) {
    try {
    	searchVO.setUser_id(user_id);
        searchVO.setUser_name(user_name);
        searchVO.setUser_phone(user_phone);
        MemberVO memberSearch = memberservice.memberPwSearch(searchVO);
        
        model.addAttribute("searchVO", memberSearch);
        
    } catch (Exception e) {
        System.out.println(e.toString());
        model.addAttribute("msg", "오류가 발생되었습니다.");
    }
    return "/member/search_result_pw";
    }
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
    
    	 /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
    
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호 " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "hgfr123@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
 
 		String num = Integer.toString(checkNum);
 		
 		 return num;
    
    }
  
    }
    
    
    


