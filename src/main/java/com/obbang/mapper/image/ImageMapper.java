package com.obbang.mapper.image;

import java.util.List;

import com.obbang.model.image.ImageVO;

public interface ImageMapper {
	
	/* 점포 이미지 데이터 반환 */
	public List<ImageVO> storeGetImageList(int store_id);
	/* 점포 이미지 데이터 반환 */
	public List<ImageVO> menuGetImageList(int menu_id);
}
