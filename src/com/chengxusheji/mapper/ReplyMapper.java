package com.chengxusheji.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.chengxusheji.po.Reply;

public interface ReplyMapper {
	/*添加博文回复信息*/
	public void addReply(Reply reply) throws Exception;

	/*按照查询条件分页查询博文回复记录*/
	public ArrayList<Reply> queryReply(@Param("where") String where,@Param("startIndex") int startIndex,@Param("pageSize") int pageSize) throws Exception;

	/*按照查询条件查询所有博文回复记录*/
	public ArrayList<Reply> queryReplyList(@Param("where") String where) throws Exception;

	/*按照查询条件的博文回复记录数*/
	public int queryReplyCount(@Param("where") String where) throws Exception; 

	/*根据主键查询某条博文回复记录*/
	public Reply getReply(int replyId) throws Exception;

	/*更新博文回复记录*/
	public void updateReply(Reply reply) throws Exception;

	/*删除博文回复记录*/
	public void deleteReply(int replyId) throws Exception;

}
