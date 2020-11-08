<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<%@ include file="/commons/basejs.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${staticPath }/static/css/style.css" />
<style type="text/css">
.table-sort tr td {
	text-align: center;
}
.design{
	background-color:green;
}
</style>
</head>
<body>
	<nav class="breadcrumb">
	<i class="Hui-iconfont" style="color: #000;">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>课程实验
	<span class="c-gray en">&gt;</span> 学生选课
	 <a class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新">
			<i class="Hui-iconfont">&#xe68f;</i>
	</a>
	</nav>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> 
				<shiro:hasPermission name="/back/report/selectCourseAdd">
					<a class="btn btn-primary radius" data-title="添加" id="add"
						href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加班级</a>
				</shiro:hasPermission>
				<a class="btn btn-primary radius" data-title="添加学生" id="adds"
						href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加重修学生</a>
				<%-- <shiro:hasPermission name="/back/report/selectCourseAdd"> --%>
					<a class="btn btn-primary radius design" data-title="添加" id="designadd"
						href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 课程设计关联学生</a>
				<%-- </shiro:hasPermission> --%>
					<a class="btn btn-primary radius design" data-title="添加" id="designadds"
						href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 课程设计重修添加</a>
				<shiro:hasPermission name="/back/report/selectCourseDeleteIDs">
					<a data-href="javascript:;" id="delete"
						class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
						批量删除</a>
				</shiro:hasPermission>
			</span>
		</div>
		<br>
		<div class="mt_right" style="float: right;">
			<form action="${staticPath}/back/report/selectClass" id="pageForm" style="float: right;" method="post">
				 <input name="studentCode" value="${experimentVo.studentCode}" class="mt_select mt_input" type="text" placeholder="学号" /> 
				 <input name="studentName" value="${experimentVo.studentName}" class="mt_select mt_input" type="text" placeholder="姓名" />
<%-- 				 <input name="courseCode" value="${experimentVo.courseCode}" class="mt_select mt_input" type="text" placeholder="课程编号" /> --%>
				 <input name="courseName" value="${experimentVo.courseName}" class="mt_select mt_input" type="text" placeholder="课程名称" />
				 <input name="experimentCode" value="${experimentVo.experimentCode}" class="mt_select mt_input" type="text" placeholder="题目编号" />
				 <input name="experimentName" value="${experimentVo.experimentName}" class="mt_select mt_input" type="text" placeholder="题目名称" />
				 <input name="teacherName" value="${experimentVo.teacherName}" class="mt_select mt_input" type="text" placeholder="教师姓名" />
				<button class="mt_button" id="submitButton">
					<i class="Hui-iconfont">&#xe665;</i>
				</button>
			</form>
		</div>
		<br>
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th style="width:60px;"><input type="checkbox" onclick='chkall("pageForm",this)'
						 name="" value=""></th>
						<th>学号</th>
						<th>姓名</th>
<!-- 						<th>系部</th> -->
						<th>专业</th>
						<th>班级</th>
<!-- 						<th>课程编号</th> -->
						<th>课程名称</th>
						<th>题目编号</th>
						<th>题目名称</th>
						<th>教师</th>
						<th>学年学期</th>
						<!-- <th>操作</th> -->
					</tr>
				</thead>
				<tbody>
					<c:if
						test="${selectStudentList == null or selectStudentList.size() == 0 }">
						<tr>
							<td colspan="10">没有记录</td>
						</tr>
					</c:if>
					<c:if
						test="${selectStudentList != null and selectStudentList.size() > 0 }">
						<c:forEach items="${selectStudentList }" var="selectStudent">
							<tr class="text-c">
								<td><input type="checkbox" value="${selectStudent.id }"
									class="ids" name=""></td>
								<td>${selectStudent.studentCode }</td>
								<td>${selectStudent.studentName }</td>
<%-- 								<td>${selectStudent.departName }</td> --%>
								<td>${selectStudent.majorName }</td>
								<td>${selectStudent.className }</td>
<%-- 								<td>${selectStudent.courseCode }</td> --%>
								<td title="${selectStudent.courseName }">${selectStudent.courseName }</td>
								<td>${selectStudent.experimentCode }</td>
								<td title="${selectStudent.experimentName }">${selectStudent.experimentName }</td>
								<td>${selectStudent.teacherName }</td>
								<td>${selectStudent.year }年第${selectStudent.term }学期</td>
								<%-- <td class="f-14 td-manage">
									<shiro:hasPermission name="/back/report/search">
										<a href="${staticPath}/back/report/search?id=${selectStudent.scId}"
											class="tablelink search" title="查看"><i class="icon Hui-iconfont" style="color: #000;">&#xe665;</i></a>
									</shiro:hasPermission> 
									<shiro:hasPermission name="/back/report/selectCourseUpdate">
										<a href="javascript:void(0);" idVal="${selectCourse.id}"
											class="tablelink selectCourseUpdate">修改</a>
									</shiro:hasPermission> 
									<shiro:hasPermission name="/back/report/selectCourseDelete">
										<a href="javascript:void(0);" idVal="${selectCourse.encryptId}"
											class="tablelink selectCourseDelete">删除</a>
									</shiro:hasPermission>
								</td> --%>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<jsp:include page="../../common/page.jsp" />
		</div>
	</div>
	<script type="text/javascript"
		src="${staticPath }/static/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${staticPath }/static/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${staticPath }/static/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${staticPath }/static/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${staticPath }/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="${staticPath }/static/h-ui.admin/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		function jumpUrl() {
			top.layer.closeAll();
			/* window.location.href = "${staticPath}/back/report/selectClass"; */
			var i = ${currentPage};
			var t = ${totalPage};
			GoToPage(i,t);
		}
		
		var index;
		$("#add").click(function() {
				top.layer.open({
					title: false,
					type: 2,shadeClose: true,shade: 0.3,area: ['800px', '80%'],
					content : rootPath + "/back/report/selectCourseAddUI",btn: ['保存','取消'],
					yes:function(index, layero){
						//提交iframe中的表单
						var frameName="layui-layer-iframe"+index;//获得layer层的名字
						var formdata = parent.frames[frameName].getFormData();
						if(formdata!=0){
							subAddForm(formdata);
						}
					}
				});
			});
			 function subAddForm(addFormData){
					top.layer.closeAll();
					$.ajax({  
						type:'post',
						url:rootPath+"/back/report/selectCourseAdd",
						data:addFormData,  
					    cache:false,
					    dataType:'json', 
					    success:function(data){
					    	if(data.success==true){
					    		top.layer.alert("保存成功！", {icon: 1},function(){location.reload();jumpUrl();});
					    	}else{
					    		top.layer.alert(data.msg, {icon: 2},function(){location.reload();jumpUrl();});}
					    }, 
					    error:function(){
					    	top.layer.alert("保存失败，系统内部错误!", {icon: 5},function(){jumpUrl();});
					    },
					    end:function(){
					    	location.reload();
					    }
					});
				}	
			 
			 $("#adds").click(function() {
					top.layer.open({
						title: false,
						type: 2,shadeClose: true,shade: 0.3,area: ['800px', '80%'],
						content : rootPath + "/back/report/selectCourseAddUI1",btn: ['保存','取消'],
						yes:function(index, layero){
							//提交iframe中的表单
							var frameName="layui-layer-iframe"+index;//获得layer层的名字
							var formdata = parent.frames[frameName].getFormData();
							if(formdata!=0){
								subAddForm1(formdata);
							}
						}
					});
				});
				 function subAddForm1(addFormData){
						top.layer.closeAll();
						$.ajax({  
							type:'post',
							url:rootPath+"/back/report/selectCourseAdd1",
							data:addFormData,  
						    cache:false,
						    dataType:'json', 
						    success:function(data){
						    	if(data.success==true){
						    		top.layer.alert("保存成功！", {icon: 1},function(){location.reload();jumpUrl();});
						    	}else{
						    		top.layer.alert(data.msg, {icon: 2},function(){location.reload();jumpUrl();});}
						    }, 
						    error:function(){
						    	top.layer.alert("保存失败，系统内部错误!", {icon: 5},function(){jumpUrl();});
						    },
						    end:function(){
						    	location.reload();
						    }
						});
					}

					$("#designadd").click(function() {
						top.layer.open({
							title: false,
							type: 2,shadeClose: true,shade: 0.3,area: ['800px', '80%'],
							content : rootPath + "/back/report/selectCourseDesignAddUI",btn: ['保存','取消'],
							yes:function(index, layero){
								//提交iframe中的表单
								var frameName="layui-layer-iframe"+index;//获得layer层的名字
								var formdata = parent.frames[frameName].getFormData();
								if(formdata!=0){
									subAddForm3(formdata);
								}
							}
						});
					});
					 function subAddForm3(addFormData){
							top.layer.closeAll();
							$.ajax({  
								type:'post',
								url:rootPath+"/back/report/selectCourseDesignAdd",
								data:addFormData,  
							    cache:false,
							    dataType:'json', 
							    success:function(data){
							    	console.log(data);
 							    	if(data.success==true){
							    		top.layer.alert("保存成功！", {icon: 1},function(){location.reload();jumpUrl();});
							    	}else{
							    		top.layer.alert(data.msg, {icon: 2},function(){location.reload();jumpUrl();});} 
							    }, 
							    error:function(){
							    	top.layer.alert("保存失败，系统内部错误!", {icon: 5},function(){jumpUrl();});
							    },
							    end:function(){
							    	location.reload();
							    }
							});
						}

						$("#designadds").click(function() {
							top.layer.open({
								title: false,
								type: 2,shadeClose: true,shade: 0.3,area: ['800px', '80%'],
								content : rootPath + "/back/report/selectCourseDesignAddUI1",btn: ['保存','取消'],
								yes:function(index, layero){
									//提交iframe中的表单
									var frameName="layui-layer-iframe"+index;//获得layer层的名字
									var formdata = parent.frames[frameName].getFormData();
									if(formdata!=0){
										subAddForm4(formdata);
									}
								}
							});
						});
						 function subAddForm4(addFormData){
								top.layer.closeAll();
								$.ajax({  
									type:'post',
									url:rootPath+"/back/report/selectCourseDesignAdds",
									data:addFormData,  
								    cache:false,
								    dataType:'json', 
								    success:function(data){
								    	console.log(data);
	 							    	if(data.success==true){
								    		top.layer.alert("保存成功！", {icon: 1},function(){location.reload();jumpUrl();});
								    	}else{
								    		top.layer.alert(data.msg, {icon: 2},function(){location.reload();jumpUrl();});} 
								    }, 
								    error:function(){
								    	top.layer.alert("保存失败，系统内部错误!", {icon: 5},function(){jumpUrl();});
								    },
								    end:function(){
								    	location.reload();
								    }
								});
							}
			/*批量删除  */
			$("#delete")
					.click(
							function() {
								var idChecks = $(".ids:checked");
								if (idChecks.length == 0) {
									top.layer.alert("请选择需要删除的记录！");
									return false;
								}
								top.layer
										.confirm(
												'您确认删除选中的记录吗?',
												{
													icon : 3,
													title : '提示'
												},
												function() {

													var id = "";
													var ids = new Array();
													for (var i = 0; i < idChecks.length; i++) {
														id += idChecks[i].value
																+ ",";
														ids[i] = idChecks[i].value;
													}
													$
															.ajax({
																url : "${staticPath }/back/department/departmentDeleteIDs",
																type : "post",
																data : "ids="
																		+ ids,
																dataType : "json",
																success : function(
																		data) {
																	if (data.success == true) {
																		top.layer
																				.alert(
																						data.msg,
																						{
																							icon : 1
																						},
																						function() {
																							jumpUrl();
																						});
																	} else {
																		top.layer
																				.open(
																						{
																							title : '删除',
																							content : "删除失败！有关联信息！",
																							icon : 2
																						},
																						function(
																								index) {
																							top.layer
																									.close(index);
																						});
																	}
																},
																error : function() {
																	top.layer
																			.alert(
																					"删除失败，系统内部错误!",
																					{
																						icon : 5
																					},
																					function() {
																						jumpUrl();
																					});
																}
															});
												});

							});
		
		/*修改*/
		$(".departmentUpdate").click(
				function() {
					var id = $(this).attr("idVal");
					top.layer.open({
						title : false,
						type : 2,
						shadeClose : true,
						shade : 0.3,
						area : [ '800px', '50%' ],
						content : rootPath
								+ '/back/department/departmentUpdateUI/' + id,
						btn : [ '修改', '取消' ],
						yes : function(index, layero) { //提交iframe中的表单
							var frameName = "layui-layer-iframe" + index;//获得layer层的名字
							var formdata = parent.frames[frameName]
									.getFormData();
							if (formdata != 0) {
								subEditForm(formdata);
							}
						}
					});
				});
		function subEditForm(addFormData) {
			top.layer.closeAll();
			$.ajax({
				type : 'post',
				url : rootPath + "/back/department/departmentUpdate",
				data : addFormData,
				cache : false,
				dataType : 'json',
				success : function(data) {
					if (data.success == true) {
						top.layer.alert(data.msg, {
							icon : 1
						}, function() {
							jumpUrl();
						});
					} else {
						top.layer.alert(data.msg, {
							icon : 2
						}, function() {
							jumpUrl();
						});
					}
				},
				error : function() {
					top.layer.alert("修改失败，系统内部错误!", {
						icon : 5
					}, function() {
						jumpUrl();
					});
				}
			});
		}

		/* 删除 */
		$(".departmentDelete").click(function() {
			var id = $(this).attr("idVal");
			top.layer.confirm('将会执行删除，是否继续？', {
				btn : [ '是', '否' ]
			//按钮
			}, function() {
				$.ajax({
					type : 'get',
					url : rootPath + "/back/department/departmentDelete/" + id,
					cache : false,
					dataType : 'json',
					success : function(data) {
						if (data.success == true) {
							top.layer.alert(data.msg, {
								icon : 1
							}, function() {
								jumpUrl();
							});
						} else {
							top.layer.alert(data.msg, {
								icon : 2
							}, function() {
								jumpUrl();
							});
						}
					},
					error : function() {
						top.layer.alert("删除失败，系统内部错误!", {
							icon : 5
						}, function() {
							jumpUrl();
						});
					}
				});
			});
		});
	</script>
</body>
</html>