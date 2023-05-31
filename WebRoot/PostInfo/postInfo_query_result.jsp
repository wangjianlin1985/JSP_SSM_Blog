﻿<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/postInfo.css" /> 

<div id="postInfo_manage"></div>
<div id="postInfo_manage_tool" style="padding:5px;">
	<div style="margin-bottom:5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit-new" plain="true" onclick="postInfo_manage_tool.edit();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete-new" plain="true" onclick="postInfo_manage_tool.remove();">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"  onclick="postInfo_manage_tool.reload();">刷新</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="postInfo_manage_tool.redo();">取消选择</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="postInfo_manage_tool.exportExcel();">导出到excel</a>
	</div>
	<div style="padding:0 0 0 7px;color:#333;">
		<form id="postInfoQueryForm" method="post">
			博文标题：<input type="text" class="textbox" id="title" name="title" style="width:110px" />
			发布人：<input class="textbox" type="text" id="userObj_user_name_query" name="userObj.user_name" style="width: auto"/>
			发布时间：<input type="text" id="addTime" name="addTime" class="easyui-datebox" editable="false" style="width:100px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="postInfo_manage_tool.search();">查询</a>
		</form>	
	</div>
</div>

<div id="postInfoEditDiv">
	<form id="postInfoEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">博文id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="postInfo_postInfoId_edit" name="postInfo.postInfoId" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">博文标题:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="postInfo_title_edit" name="postInfo.title" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">博文图片:</span>
			<span class="inputControl">
				<img id="postInfo_postPhotoImg" width="200px" border="0px"/><br/>
    			<input type="hidden" id="postInfo_postPhoto" name="postInfo.postPhoto"/>
				<input id="postPhotoFile" name="postPhotoFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">博文内容:</span>
			<span class="inputControl">
				<script name="postInfo.content" id="postInfo_content_edit" type="text/plain"   style="width:100%;height:500px;"></script>

			</span>

		</div>
		<div>
			<span class="label">浏览量:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="postInfo_hitNum_edit" name="postInfo.hitNum" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">发布人:</span>
			<span class="inputControl">
				<input class="textbox"  id="postInfo_userObj_user_name_edit" name="postInfo.userObj.user_name" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">发布时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="postInfo_addTime_edit" name="postInfo.addTime" />

			</span>

		</div>
	</form>
</div>
<script>
//实例化编辑器
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
var postInfo_content_editor = UE.getEditor('postInfo_content_edit'); //博文内容编辑器
</script>
<script type="text/javascript" src="PostInfo/js/postInfo_manage.js"></script> 
