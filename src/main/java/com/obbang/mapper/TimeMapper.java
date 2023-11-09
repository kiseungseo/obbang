package com.obbang.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	
	@Select("select curdate() from dual")
	public String getTime();
	
	public String getTime2();
}
