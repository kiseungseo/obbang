package com.obbang.controller.board;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.obbang.model.board.Criteria;
import com.obbang.model.board.NoticeDTO;
import com.obbang.model.board.PageMakerDTO;
import com.obbang.model.board.UploadResult;
import com.obbang.service.board.NoticeService;


@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService nservice;


    /* 게시판 목록 페이지 접속(페이징 적용) */
  @GetMapping("/noticelist")
  public void noticeListGET(Model model, Criteria cri) {
      
      model.addAttribute("list", nservice.getListPaging(cri));
      
      int total = nservice.getTotal(cri);
      System.out.println("total : "+ total);
      PageMakerDTO pageMake = new PageMakerDTO(cri, total);
      
      model.addAttribute("pageMaker", pageMake);
  }
	
	@GetMapping("/noticeenroll")
	public void noticeEnrollGET() {

		log.info("게시판 등록 페이지 진입");

	}
	
	/* 게시판 등록 */
	@PostMapping("/noticeenroll")
	public String noticeEnrollPOST(NoticeDTO notice,RedirectAttributes rttr) {

		nservice.enroll(notice);
		rttr.addFlashAttribute("result", "enrol success");
		return "redirect:/notice/noticelist";
	}

    /* 게시판 조회 */
    @GetMapping("/noticeget")
    public void noticeGetPageGET(int notice_nno, Model model) throws Exception {
        
        model.addAttribute("pageInfo", nservice.getPage(notice_nno));

    }
    
	//이미지 업로드
	@PostMapping("/uploadAjaxAction")
	public ResponseEntity<UploadResult> uploadAjaxActionPOST(MultipartFile[] notice_image) {
	    System.out.println(":::Photo 등록");

	    /* 이미지 파일 체크 */
	    for (MultipartFile multipartFile : notice_image) {
	        File checkfile = new File(multipartFile.getOriginalFilename());
	        String type = null;
	        try {
	            type = Files.probeContentType(checkfile.toPath());
	            System.out.println("MIME TYPE : " + type);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

	    String uploadFolder = "C:\\upload";

	    /* 폴더 생성 */
	    File uploadPath = new File(uploadFolder);
	    if (uploadPath.exists() == false) {
	        uploadPath.mkdirs();
	    }

	    List<UploadResult> resultList = new ArrayList<>();
	    for (MultipartFile multipartFile : notice_image) {
	        /* 파일 이름 */
	        String uploadFileName = multipartFile.getOriginalFilename();

	        /* uuid 적용 파일 이름 */
	        String uuid = UUID.randomUUID().toString();
	        uploadFileName = uuid + "_" + uploadFileName;

	        /* 파일 위치, 파일 이름을 합친 File 객체 */
	        File saveFile = new File(uploadFileName);
	        System.out.println(saveFile);
	        /* 파일 저장 */
	        try {
	            multipartFile.transferTo(saveFile);
	            resultList.add(new UploadResult(uploadFileName)); // 업로드 결과 리스트에 추가
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    // 업로드 결과를 리턴
	    UploadResult result = resultList.get(0); // 파일 하나만 업로드하는 경우
	    return ResponseEntity.ok().body(result);
	}
	
	
	//UploadController에서 섬네일 데이터 전송하기
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){	//특정 파일의 이름을 받아서 이미지 데이터를 전송하는 코드
		System.out.println("fileName : " + fileName);	//fileName
		
		File file = new File("C:\\upload\\"+fileName);	//파일 경로
		
		System.out.println("file : " + file);
		
		ResponseEntity<byte[]> result = null;
		
		System.out.println("result : " + result);
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header, HttpStatus.OK	);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result; //notice/display?fileName=P1234.png 경로 참조
	}    
    
    
    /* 수정 페이지 이동 */
    @GetMapping("/noticemodify")
    public void noticeModifyGET(int notice_nno, Model model) {
        
        model.addAttribute("pageInfo", nservice.getPage(notice_nno));
        
    }

    /* 페이지 수정 */
    @PostMapping("/noticemodify")
    public String noticeModifyPOST(NoticeDTO notice, RedirectAttributes rttr) {
        
        nservice.modify(notice);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/notice/noticelist";
        
    }
    
    /* 페이지 삭제 */
    @PostMapping("/delete")
    public String noticeDeletePOST(int notice_nno, RedirectAttributes rttr) {
        
        nservice.delete(notice_nno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/notice/noticelist";
    }
    


}
