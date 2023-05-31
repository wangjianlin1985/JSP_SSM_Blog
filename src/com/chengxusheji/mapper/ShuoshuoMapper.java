﻿package com.chengxusheji.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.chengxusheji.po.Shuoshuo;

public interface ShuoshuoMapper {
	/*添加日志信息*/
	public void addShuoshuo(Shuoshuo shuoshuo) throws Exception;

	/*按照查询条件分页查询日志记录*/
	public ArrayList<Shuoshuo> queryShuoshuo(@Param("where") String where,@Param("startIndex") int startIndex,@Param("pageSize") int pageSize) throws Exception;

	/*按照查询条件查询所有日志记录*/
	public ArrayList<Shuoshuo> queryShuoshuoList(@Param("where") String where) throws Exception;

	/*按照查询条件的日志记录数*/
	public int queryShuoshuoCount(@Param("where") String where) throws Exception; 

	/*根据主键查询某条日志记录*/
	public Shuoshuo getShuoshuo(int shuoshuoId) throws Exception;

	/*更新日志记录*/
	public void updateShuoshuo(Shuoshuo shuoshuo) throws Exception;

	/*删除日志记录*/
	public void deleteShuoshuo(int shuoshuoId) throws Exception;

}
