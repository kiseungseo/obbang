package com.obbang.controller.board;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
import com.obbang.model.board.EventCriteria;
import com.obbang.model.board.EventDTO;
import com.obbang.model.board.EventPageMakerDTO;
import com.obbang.model.board.UploadResult;
import com.obbang.service.board.EventService;



@Controller
@RequestMapping("/event/*")
public class EventController {
	
		@Autowired
		private EventService eservice;
		
		/* 게시판 등록 페이지 */
		@GetMapping("/eventenroll")
		public void eventEnrollGET() {
			System.out.println("이벤트 등록 페이지");
		}
		/* 게시판 등록 */
		@PostMapping("/eventenroll")
		public String eventEnrollPOST(EventDTO event,RedirectAttributes rttr) {
			
			//log.info("DTO : " + event);
			eservice.enroll(event);
			rttr.addFlashAttribute("result", "enrol success");
			return "redirect:/event/eventlist";
		}
		
		 /* 게시판 조회 */
	    @GetMapping("/eventget")
	    public void boardGetPageGET(int event_eno, Model model) throws Exception {
	        
	        model.addAttribute("pageInfo", eservice.getPage(event_eno));
	       
	    }
		
		@GetMapping("/adminProfilePhoto")
		public String adminProfilePhoto() {
			System.out.println("adminProfilePhoto페이지");
			return "/event/adminProfilePhoto";
		}


		//이미지 업로드
		@PostMapping("/uploadAjaxAction")
		public ResponseEntity<UploadResult> uploadAjaxActionPOST(MultipartFile[] event_image) {
		    System.out.println(":::Photo 등록");

		    /* 이미지 파일 체크 */
		    for (MultipartFile multipartFile : event_image) {
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
		    for (MultipartFile multipartFile : event_image) {
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
			System.out.println("fileName : " + fileName);	//fileName은 파일의 경로
			
			File file = new File("C:\\upload\\"+fileName);
			
			System.out.println("file : " + file);
			
			ResponseEntity<byte[]> result = null;
			
			try {
				HttpHeaders header = new HttpHeaders();
				
				header.add("Content-Type", Files.probeContentType(file.toPath()));
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header, HttpStatus.OK	);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return result; //event/display?fileName=P1234.png 경로 참조
		}
		
		
		
		/* 이벤트 게시판 목록 페이지 접속(페이징 적용) */
		@GetMapping("/eventlist")
		public void EventListGET(Model model, EventCriteria event_cri) {
			
			model.addAttribute("list", eservice.getListPaging(event_cri));
			
			int total = eservice.getTotal(event_cri);
			
			
			EventPageMakerDTO eventpageMaker = new EventPageMakerDTO(event_cri, total);
			
			model.addAttribute("eventpageMaker", eventpageMaker);
			
		}


		/* 수정 페이지 이동 */
		@GetMapping("/eventmodify")
		public void eventModifyGET(int event_eno, Model model) {

			model.addAttribute("pageInfo", eservice.getPage(event_eno));

		}

		/* 페이지 수정 */
		@PostMapping("/eventmodify")
		public String eventModifyPOST(EventDTO event, RedirectAttributes rttr) {

			eservice.modify(event);

			rttr.addFlashAttribute("result", "modify success");

			return "redirect:/event/eventlist";

		}

		/* 페이지 삭제 */
		@PostMapping("/delete")
		public String eventDeletePOST(int event_eno, RedirectAttributes rttr) {

			eservice.delete(event_eno);

			rttr.addFlashAttribute("result", "delete success");

			return "redirect:/event/eventlist";
		}

	}

