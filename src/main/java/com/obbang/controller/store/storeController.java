package com.obbang.controller.store;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.obbang.mapper.image.ImageMapper;
import com.obbang.model.Criteria;
import com.obbang.model.PageMakerDTO;
import com.obbang.model.image.ImageVO;
import com.obbang.model.order.OrderDTO;
import com.obbang.model.reply.ReplyDTO;
import com.obbang.model.store.StoreVO;
import com.obbang.service.image.ImageService;
import com.obbang.service.member.MemberService;
import com.obbang.service.order.OrderService;
import com.obbang.service.reply.ReplyService;
import com.obbang.service.store.StoreService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/store/*")
@Log4j2
public class storeController {

	private static final Logger logger = LoggerFactory.getLogger(storeController.class);

	@Autowired
	StoreService storeService;
	@Autowired
	private ImageMapper ImageMapper;
	@Autowired
	MemberService member;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ImageService imageService;

	/* 상품 관리(상품목록) 페이지 접속 */
	@RequestMapping(value = "list_*", method = RequestMethod.GET)
	public void goodsManageGET(StoreVO vo, Criteria cri, Model model) throws Exception{

		log.info("상품 관리(상품목록) 페이지 접속");

		/* 상품 리스트 데이터 */
		List<StoreVO> list = storeService.StoreGetList(cri);
		//카테고리
		model.addAttribute("menu",storeService.categoryGet(vo));
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}

		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageMakerDTO(cri, storeService.StoreGetTotal(cri)));

	}
	@GetMapping("/detail_*")
	public void menuGetDetail(StoreVO vo,int menu_id, Criteria cri, Model model) {
		log.info("menuGet............"+menu_id);
		List<StoreVO> list = storeService.menuGetimage(cri);
		/* 상품 리스트 데이터*/
		model.addAttribute("list",list);
		//메뉴 조회
		model.addAttribute("menu",storeService.menuGetDetail(menu_id));
		
	}
	/* 상품 조회 페이지 */
	@GetMapping("/category_*")
	public void goodsGetInfoGET(StoreVO vo,int store_id, Criteria cri, Model model) {

		log.info("StoresGetInfo()........." + store_id);
		//카테고리
		model.addAttribute("menu",storeService.categoryGet(vo));
		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);
		model.addAttribute("list",storeService.StoreGetimage(cri));
		/* 조회 페이지 정보 */
		model.addAttribute("StoreInfoDetail", storeService.StoreGetDetail(store_id));
		/* 조회 페이지 정보 */
		model.addAttribute("StoreInfo", storeService.storeGet(cri));
		log.info("----------------------asdfasdfasdfas"+storeService.storeGet(cri));

	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public void home(StoreVO vo, Model model,HttpServletRequest request ) {
		log.info("메인페이지 진입....");
		//카테고리
		model.addAttribute("menu",storeService.categoryGet(vo));
		
	}
	//이미지
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		log.info("getImage........"+fileName);
		File file = new File("c:\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		}catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}
	/* 이미지 정보 반환 */
	@GetMapping(value="/StoreGetImageList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ImageVO>> StoreGetImageList(int store_id){
		log.info("StoreGetImageList......."+store_id);
		return new ResponseEntity<List<ImageVO>>(ImageMapper.storeGetImageList(store_id),HttpStatus.OK);
	}
	/* 이미지 정보 반환 */
	@GetMapping(value="/MenuGetImageList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ImageVO>> menuGetImageList(int menu_id){
		log.info("menuGetImageList......."+menu_id);
		return new ResponseEntity<List<ImageVO>>(ImageMapper.menuGetImageList(menu_id),HttpStatus.OK);
	}
	/* 리뷰 쓰기 */
	@GetMapping("/replyEnroll/{user_id}")
	public String replyEnrollWindowGET(@PathVariable("user_id")String user_id, int store_id, Model model) {
		StoreVO store = storeService.getStoreIdName(store_id);
		model.addAttribute("storeInfo", store);
		model.addAttribute("user_id", user_id);
		
		return "/store/replyEnroll";
	}
	/* 리뷰 수정 팝업창 */
	@GetMapping("/replyUpdate")
	public String replyUpdateWindowGET(ReplyDTO dto, Model model) {
		StoreVO book = storeService.getStoreIdName(dto.getStore_id());
		model.addAttribute("storeInfo", book);
		model.addAttribute("replyInfo", replyService.getUpdateReply(dto.getReply_id()));
		model.addAttribute("user_id", dto.getUser_id());
		
		return "/store/replyUpdate";
	}
	//주문현황
	@GetMapping("/orderList")
	public String orderListDetail(Criteria cri,Model model) {
		List<OrderDTO> list = orderService.getOrderDetail(cri);

		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageMakerDTO(cri, orderService.getOrderTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}

		return "/store/orderListDetail";
	}
}
