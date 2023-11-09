package com.obbang.service.image;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.obbang.mapper.image.ImageMapper;
import com.obbang.model.image.ImageVO;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ImageServiceImpl implements ImageService{
	@Autowired
	private ImageMapper ImageMapper;

	@Override
	public List<ImageVO> storeGetImageList(int store_id) {
		log.info("storeGetImageList");
		return ImageMapper.storeGetImageList(store_id);
	}
	@Override
	public List<ImageVO> menuGetImageList(int menu_id) {
		log.info("menuGetImageList");
		return ImageMapper.menuGetImageList(menu_id);
	}
}
