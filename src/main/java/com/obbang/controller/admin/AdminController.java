package com.obbang.controller.admin;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.obbang.model.Criteria;
import com.obbang.model.PageMakerDTO;
import com.obbang.model.image.ImageVO;
import com.obbang.model.order.OrderCancelDTO;
import com.obbang.model.order.OrderDTO;
import com.obbang.model.store.StoreVO;
import com.obbang.service.admin.AdminService;
import com.obbang.service.order.OrderService;
import com.obbang.service.store.StoreService;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin")
@Log4j2
public class AdminController {

	@Autowired
	private StoreService storeService;

	@Autowired
	private AdminService adminService;

	@Autowired
	private OrderService orderService;

	/* 관리자 메인 페이지 이동 */
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public void adminMainGET() throws Exception{

		log.info("관리자 페이지 이동");

	}
	/* 점포 관리(점포목록) 페이지 접속 */
	@RequestMapping(value = "/storeManage", method = RequestMethod.GET)
	public void storeManageGET(Criteria cri, Model model) throws Exception{

		log.info("상품 관리(상품목록) 페이지 접속");

		/* 상품 리스트 데이터 */
		List list = storeService.StoreGetListAdmin(cri);

		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}

		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageMakerDTO(cri, storeService.StoreGetTotaladmin(cri)));

	}
	/* 점포 등록 페이지 접속 */
	@RequestMapping(value = "/storeEnroll", method = RequestMethod.GET)
	public void goodsEnrollGET(Criteria cri,Model model) throws Exception{

		log.info("상품 등록 페이지 접속");

		ObjectMapper objm = new ObjectMapper();

		List list = storeService.StoreGetListAdmin(cri);

		String cateList = objm.writeValueAsString(list);

		model.addAttribute("cateList", cateList);

		//logger.info("변경 전.........." + list);
		//logger.info("변경 gn.........." + cateList);

	}
	/* 점포 등록 */
	@PostMapping("/storeEnroll")
	public String storeEnrollPOST(StoreVO store, RedirectAttributes rttr) {

		log.info("storeEnrollPOST......" + store);

		adminService.storeEnroll(store);

		rttr.addFlashAttribute("enroll_result", store.getStore_store());

		return "redirect:/admin/main";
	}
	/* 상품 관리(상품목록) 페이지 접속 */
	@RequestMapping(value = "menuManage", method = RequestMethod.GET)
	public void menuManageGET(StoreVO vo, Criteria cri, Model model) throws Exception{

		log.info("상품 관리(상품목록) 페이지 접속");

		/* 상품 리스트 데이터 */
		List list = storeService.menuGet(cri);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}

		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageMakerDTO(cri, storeService.StoreGetTotalMenu(cri)));

	}
	/* 상품 등록 페이지 접속 */
	@RequestMapping(value = "menuEnroll", method = RequestMethod.GET)
	public void menuEnrollGET(StoreVO vo,Criteria cri,Model model) throws Exception{

		log.info("상품 등록 페이지 접속");

		ObjectMapper objm = new ObjectMapper();

		List list = storeService.menuGet(cri);

		String cateList = objm.writeValueAsString(list);

		model.addAttribute("cateList", cateList);

		//logger.info("변경 전.........." + list);
		//logger.info("변경 gn.........." + cateList);

	}
	/* 점포,상품 등록 */
	@PostMapping("/menuEnroll")
	public String menuEnrollPOST(StoreVO store, RedirectAttributes rttr) {

		log.info("menuEnrollPOST......" + store);

		adminService.menuEnroll(store);

		rttr.addFlashAttribute("enroll_result", store.getStore_store());

		return "redirect:/admin/main";
	}
	/* 점포 검색 팝업창 */
	@GetMapping("/storePop")
	public void storePopGET(Criteria cri, Model model) throws Exception{
		log.info("storePopGET.......");
		cri.setAmount(5);
		/* 게시물 출력 데이터 */
		List list = storeService.StoreGetListAdmin(cri);

		if(!list.isEmpty()) {
			model.addAttribute("list",list);	// 점포 존재 경우
		} else {
			model.addAttribute("listCheck", "empty");	// 점포 존재하지 않을 경우
		}


		/* 페이지 이동 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageMakerDTO(cri, storeService.StoreGetTotaladmin(cri)));

	}
	/* 상품 조회 페이지 */
	@GetMapping({"/storeDetail","/storeModify"})
	public void storeGetInfoGET(int store_id, Criteria cri, Model model) {

		log.info("goodsGetInfo()........." + store_id);

		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);

		/* 조회 페이지 정보 */
		model.addAttribute("store", storeService.StoreGetDetail(store_id));
		/* 페이지 이동 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageMakerDTO(cri, storeService.StoreGetTotaladmin(cri)));
	}
	/* 상품 조회 페이지 */
	@GetMapping({"/menuDetail","/menuModify"})
	public void menuGetInfoGET(int menu_id, Criteria cri, Model model) {

		log.info("goodsGetInfo()........." + menu_id);

		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);

		/* 조회 페이지 정보 */
		model.addAttribute("menu", storeService.menuGetDetail(menu_id));
		/* 페이지 이동 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageMakerDTO(cri, storeService.StoreGetTotalMenu(cri)));
	}
	/* 점포 정보 수정 */
	@PostMapping("/storeModify")
	public String storeModifyPOST(StoreVO vo, RedirectAttributes rttr) {

		log.info("storeModifyPOST.........." + vo);

		int result = adminService.storeModify(vo);

		rttr.addFlashAttribute("modify_result", result);

		return "redirect:/admin/storeManage";		

	}
	/* 상품 정보 수정 */
	@PostMapping("/menuModify")
	public String menuModifyPOST(StoreVO vo, RedirectAttributes rttr) {

		log.info("menuModifyPOST.........." + vo);

		int result = adminService.menuModify(vo);

		rttr.addFlashAttribute("modify_result", result);

		return "redirect:/admin/menuManage";		

	}
	/* 점포 정보 삭제 */
	@PostMapping("/storeDelete")
	public String storeDeletePOST(int store_id, RedirectAttributes rttr) {

		log.info("storeDeletePOST..........");

		List<ImageVO> fileList = adminService.getStoreInfo(store_id);

		if(fileList != null) {

			List<Path> pathList = new ArrayList();

			fileList.forEach(vo ->{

				// 원본 이미지
				Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);

				// 섬네일 이미지
				path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid()+"_" + vo.getFileName());
				pathList.add(path);

			});

			pathList.forEach(path ->{
				path.toFile().delete();
			});

		}

		int result = adminService.storeDelete(store_id);

		rttr.addFlashAttribute("delete_result", result);

		return "redirect:/admin/storeManage";

	}
	/* 상품 정보 삭제 */
	@PostMapping("/menuDelete")
	public String menuDeletePOST(int menu_id, RedirectAttributes rttr) {

		log.info("menuDeletePOST..........");

		List<ImageVO> fileList = adminService.getMenuInfo(menu_id);

		if(fileList != null) {

			List<Path> pathList = new ArrayList();

			fileList.forEach(vo ->{

				// 원본 이미지
				Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);

				// 섬네일 이미지
				path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid()+"_" + vo.getFileName());
				pathList.add(path);

			});

			pathList.forEach(path ->{
				path.toFile().delete();
			});
		}
			int result = adminService.menuDelete(menu_id);

			rttr.addFlashAttribute("delete_result", result);

			return "redirect:/admin/menuManage";
			
	}
	/* 첨부 파일 업로드 */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {

		log.info("uploadAjaxActionPOST..........");

		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			try {
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(!type.startsWith("image")) {

				List<ImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

			}
		}

		String uploadFolder = "C:\\upload";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);

		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		/* 이미저 정보 담는 객체 */
		List<ImageVO> list = new ArrayList();
		// 향상된 for
		for(MultipartFile multipartFile : uploadFile) {

			ImageVO vo = new ImageVO();
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();			
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);

				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	

				BufferedImage bo_image = ImageIO.read(saveFile);

				//비율 
				double ratio = 3;
				//넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);					


				Thumbnails.of(saveFile)
				.size(width, height)
				.toFile(thumbnailFile);

			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(vo);
		}
		ResponseEntity<List<ImageVO>> result = new ResponseEntity<List<ImageVO>>(list,HttpStatus.OK);
		return result;
	}
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){

		log.info("deleteFile........" + fileName);

		File file = null;
		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:/upload/" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");

			log.info("originFileName : " + originFileName);

			file = new File(originFileName);

			file.delete();
		} catch(Exception e) {

			e.printStackTrace();

			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);

		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	/* 주문 현황 페이지 */
	@GetMapping("/orderList")
	public String orderListGET(Criteria cri, Model model) {
		List<OrderDTO> list = adminService.getOrderList(cri);

		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageMakerDTO(cri, adminService.getOrderTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}

		return "/admin/orderList";
	}
	/* 주문삭제 */
	@PostMapping("/orderCancle")
	public String orderCanclePOST(OrderCancelDTO dto) {
		orderService.orderCancle(dto);
		return "redirect:/store/home";
	}
}
