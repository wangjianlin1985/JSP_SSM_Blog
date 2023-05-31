﻿<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.ShuoshuoZan" %>
<%@ page import="com.chengxusheji.po.Shuoshuo" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<ShuoshuoZan> shuoshuoZanList = (List<ShuoshuoZan>)request.getAttribute("shuoshuoZanList");
    //获取所有的shuoshuoObj信息
    List<Shuoshuo> shuoshuoList = (List<Shuoshuo>)request.getAttribute("shuoshuoList");
    //获取所有的userObj信息
    List<UserInfo> userInfoList = (List<UserInfo>)request.getAttribute("userInfoList");
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
    Shuoshuo shuoshuoObj = (Shuoshuo)request.getAttribute("shuoshuoObj");
    UserInfo userObj = (UserInfo)request.getAttribute("userObj");
    String zanTime = (String)request.getAttribute("zanTime"); //点赞时间查询关键字
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>日志点赞查询</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="row"> 
		<div class="col-md-9 wow fadeInDown" data-wow-duration="0.5s">
			<div>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
			    	<li><a href="<%=basePath %>index.jsp">首页</a></li>
			    	<li role="presentation" class="active"><a href="#shuoshuoZanListPanel" aria-controls="shuoshuoZanListPanel" role="tab" data-toggle="tab">日志点赞列表</a></li>
			    	<li role="presentation" ><a href="<%=basePath %>ShuoshuoZan/shuoshuoZan_frontAdd.jsp" style="display:none;">添加日志点赞</a></li>
				</ul>
			  	<!-- Tab panes -->
			  	<div class="tab-content">
				    <div role="tabpanel" class="tab-pane active" id="shuoshuoZanListPanel">
				    		<div class="row">
				    			<div class="col-md-12 top5">
				    				<div class="table-responsive">
				    				<table class="table table-condensed table-hover">
				    					<tr class="success bold"><td>序号</td><td>点赞id</td><td>被点赞日志</td><td>点赞用户</td><td>点赞时间</td><td>操作</td></tr>
				    					<% 
				    						/*计算起始序号*/
				    	            		int startIndex = (currentPage -1) * 5;
				    	            		/*遍历记录*/
				    	            		for(int i=0;i<shuoshuoZanList.size();i++) {
					    	            		int currentIndex = startIndex + i + 1; //当前记录的序号
					    	            		ShuoshuoZan shuoshuoZan = shuoshuoZanList.get(i); //获取到日志点赞对象
 										%>
 										<tr>
 											<td><%=currentIndex %></td>
 											<td><%=shuoshuoZan.getZanId() %></td>
 											<td><%=shuoshuoZan.getShuoshuoObj().getShuoshuoContent() %></td>
 											<td><%=shuoshuoZan.getUserObj().getName() %></td>
 											<td><%=shuoshuoZan.getZanTime() %></td>
 											<td>
 												<a href="<%=basePath  %>ShuoshuoZan/<%=shuoshuoZan.getZanId() %>/frontshow"><i class="fa fa-info"></i>&nbsp;查看</a>&nbsp;
 												<a href="#" onclick="shuoshuoZanEdit('<%=shuoshuoZan.getZanId() %>');" style="display:none;"><i class="fa fa-pencil fa-fw"></i>编辑</a>&nbsp;
 												<a href="#" onclick="shuoshuoZanDelete('<%=shuoshuoZan.getZanId() %>');" style="display:none;"><i class="fa fa-trash-o fa-fw"></i>删除</a>
 											</td> 
 										</tr>
 										<%}%>
				    				</table>
				    				</div>
				    			</div>
				    		</div>

				    		<div class="row">
					            <div class="col-md-12">
						            <nav class="pull-left">
						                <ul class="pagination">
						                    <li><a href="#" onclick="GoToPage(<%=currentPage-1 %>,<%=totalPage %>);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						                     <%
						                    	int startPage = currentPage - 5;
						                    	int endPage = currentPage + 5;
						                    	if(startPage < 1) startPage=1;
						                    	if(endPage > totalPage) endPage = totalPage;
						                    	for(int i=startPage;i<=endPage;i++) {
						                    %>
						                    <li class="<%= currentPage==i?"active":"" %>"><a href="#"  onclick="GoToPage(<%=i %>,<%=totalPage %>);"><%=i %></a></li>
						                    <%  } %> 
						                    <li><a href="#" onclick="GoToPage(<%=currentPage+1 %>,<%=totalPage %>);"><span aria-hidden="true">&raquo;</span></a></li>
						                </ul>
						            </nav>
						            <div class="pull-right" style="line-height:75px;" >共有<%=recordNumber %>条记录，当前第 <%=currentPage %>/<%=totalPage %> 页</div>
					            </div>
				            </div> 
				    </div>
				</div>
			</div>
		</div>
	<div class="col-md-3 wow fadeInRight">
		<div class="page-header">
    		<h1>日志点赞查询</h1>
		</div>
		<form name="shuoshuoZanQueryForm" id="shuoshuoZanQueryForm" action="<%=basePath %>ShuoshuoZan/frontlist" class="mar_t15" method="post">
            <div class="form-group">
            	<label for="shuoshuoObj_shuoshuoId">被点赞日志：</label>
                <select id="shuoshuoObj_shuoshuoId" name="shuoshuoObj.shuoshuoId" class="form-control">
                	<option value="0">不限制</option>
	 				<%
	 				for(Shuoshuo shuoshuoTemp:shuoshuoList) {
	 					String selected = "";
 					if(shuoshuoObj!=null && shuoshuoObj.getShuoshuoId()!=null && shuoshuoObj.getShuoshuoId().intValue()==shuoshuoTemp.getShuoshuoId().intValue())
 						selected = "selected";
	 				%>
 				 <option value="<%=shuoshuoTemp.getShuoshuoId() %>" <%=selected %>><%=shuoshuoTemp.getShuoshuoContent() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
            <div class="form-group">
            	<label for="userObj_user_name">点赞用户：</label>
                <select id="userObj_user_name" name="userObj.user_name" class="form-control">
                	<option value="">不限制</option>
	 				<%
	 				for(UserInfo userInfoTemp:userInfoList) {
	 					String selected = "";
 					if(userObj!=null && userObj.getUser_name()!=null && userObj.getUser_name().equals(userInfoTemp.getUser_name()))
 						selected = "selected";
	 				%>
 				 <option value="<%=userInfoTemp.getUser_name() %>" <%=selected %>><%=userInfoTemp.getName() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
			<div class="form-group">
				<label for="zanTime">点赞时间:</label>
				<input type="text" id="zanTime" name="zanTime" class="form-control"  placeholder="请选择点赞时间" value="<%=zanTime %>" onclick="SelectDate(this,'yyyy-MM-dd')" />
			</div>
            <input type=hidden name=currentPage value="<%=currentPage %>" />
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
	</div>

		</div>
	</div> 
<div id="shuoshuoZanEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;日志点赞信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
      	<form class="form-horizontal" name="shuoshuoZanEditForm" id="shuoshuoZanEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="shuoshuoZan_zanId_edit" class="col-md-3 text-right">点赞id:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="shuoshuoZan_zanId_edit" name="shuoshuoZan.zanId" class="form-control" placeholder="请输入点赞id" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="shuoshuoZan_shuoshuoObj_shuoshuoId_edit" class="col-md-3 text-right">被点赞日志:</label>
		  	 <div class="col-md-9">
			    <select id="shuoshuoZan_shuoshuoObj_shuoshuoId_edit" name="shuoshuoZan.shuoshuoObj.shuoshuoId" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="shuoshuoZan_userObj_user_name_edit" class="col-md-3 text-right">点赞用户:</label>
		  	 <div class="col-md-9">
			    <select id="shuoshuoZan_userObj_user_name_edit" name="shuoshuoZan.userObj.user_name" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="shuoshuoZan_zanTime_edit" class="col-md-3 text-right">点赞时间:</label>
		  	 <div class="col-md-9">
                <div class="input-group date shuoshuoZan_zanTime_edit col-md-12" data-link-field="shuoshuoZan_zanTime_edit">
                    <input class="form-control" id="shuoshuoZan_zanTime_edit" name="shuoshuoZan.zanTime" size="16" type="text" value="" placeholder="请选择点赞时间" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
		</form> 
	    <style>#shuoshuoZanEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
      <div class="modal-footer"> 
      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	<button type="button" class="btn btn-primary" onclick="ajaxShuoshuoZanModify();">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
var basePath = "<%=basePath%>";
/*跳转到查询结果的某页*/
function GoToPage(currentPage,totalPage) {
    if(currentPage==0) return;
    if(currentPage>totalPage) return;
    document.shuoshuoZanQueryForm.currentPage.value = currentPage;
    document.shuoshuoZanQueryForm.submit();
}

/*可以直接跳转到某页*/
function changepage(totalPage)
{
    var pageValue=document.shuoshuoZanQueryForm.pageValue.value;
    if(pageValue>totalPage) {
        alert('你输入的页码超出了总页数!');
        return ;
    }
    document.shuoshuoZanQueryForm.currentPage.value = pageValue;
    documentshuoshuoZanQueryForm.submit();
}

/*弹出修改日志点赞界面并初始化数据*/
function shuoshuoZanEdit(zanId) {
	$.ajax({
		url :  basePath + "ShuoshuoZan/" + zanId + "/update",
		type : "get",
		dataType: "json",
		success : function (shuoshuoZan, response, status) {
			if (shuoshuoZan) {
				$("#shuoshuoZan_zanId_edit").val(shuoshuoZan.zanId);
				$.ajax({
					url: basePath + "Shuoshuo/listAll",
					type: "get",
					success: function(shuoshuos,response,status) { 
						$("#shuoshuoZan_shuoshuoObj_shuoshuoId_edit").empty();
						var html="";
		        		$(shuoshuos).each(function(i,shuoshuo){
		        			html += "<option value='" + shuoshuo.shuoshuoId + "'>" + shuoshuo.shuoshuoContent + "</option>";
		        		});
		        		$("#shuoshuoZan_shuoshuoObj_shuoshuoId_edit").html(html);
		        		$("#shuoshuoZan_shuoshuoObj_shuoshuoId_edit").val(shuoshuoZan.shuoshuoObjPri);
					}
				});
				$.ajax({
					url: basePath + "UserInfo/listAll",
					type: "get",
					success: function(userInfos,response,status) { 
						$("#shuoshuoZan_userObj_user_name_edit").empty();
						var html="";
		        		$(userInfos).each(function(i,userInfo){
		        			html += "<option value='" + userInfo.user_name + "'>" + userInfo.name + "</option>";
		        		});
		        		$("#shuoshuoZan_userObj_user_name_edit").html(html);
		        		$("#shuoshuoZan_userObj_user_name_edit").val(shuoshuoZan.userObjPri);
					}
				});
				$("#shuoshuoZan_zanTime_edit").val(shuoshuoZan.zanTime);
				$('#shuoshuoZanEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除日志点赞信息*/
function shuoshuoZanDelete(zanId) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "ShuoshuoZan/deletes",
			data : {
				zanIds : zanId,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#shuoshuoZanQueryForm").submit();
					//location.href= basePath + "ShuoshuoZan/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
}

/*ajax方式提交日志点赞信息表单给服务器端修改*/
function ajaxShuoshuoZanModify() {
	$.ajax({
		url :  basePath + "ShuoshuoZan/" + $("#shuoshuoZan_zanId_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#shuoshuoZanEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                $("#shuoshuoZanQueryForm").submit();
            }else{
                alert(obj.message);
            } 
		},
		processData: false,
		contentType: false,
	});
}

$(function(){
	/*小屏幕导航点击关闭菜单*/
    $('.navbar-collapse a').click(function(){
        $('.navbar-collapse').collapse('hide');
    });
    new WOW().init();

    /*点赞时间组件*/
    $('.shuoshuoZan_zanTime_edit').datetimepicker({
    	language:  'zh-CN',  //语言
    	format: 'yyyy-mm-dd hh:ii:ss',
    	weekStart: 1,
    	todayBtn:  1,
    	autoclose: 1,
    	minuteStep: 1,
    	todayHighlight: 1,
    	startView: 2,
    	forceParse: 0
    });
})
</script>
</body>
</html>
