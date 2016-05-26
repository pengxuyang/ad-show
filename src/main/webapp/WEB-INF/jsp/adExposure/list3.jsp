<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%String path = request.getContextPath(); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
img{ display:block;}
body{ margin:0;}
ul{ padding:0; margin:0;}
li{ padding:0; margin:0; list-style:none;}
a{ text-decoration:none;}
.titleTd{
	background-color: #F2F6FF;
	text-align: right;
	font-size: 14px;
}
.artTable tr td{
	border: 1px solid gray;
	line-height: 40px;
	
}

</style>
<meta charset="utf-8">
<title>无标题文档</title>
<%--<link href="${pageContext.request.contextPath }/styles/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/scripts/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/scripts/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/easyui/jquery.easyui.min.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/scripts/kindeditor/style/default/default.css" /> 
 <script charset="utf-8" src="${pageContext.request.contextPath }/scripts/kindeditor/javascript/kindeditor-all-min.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath }/scripts/kindeditor/lang/zh_CN.js"></script>--%>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/easyui.css"/>">
	<link rel="stylesheet" type="text/css" href="../../../css/default_easyui.css">
	<link rel="stylesheet" type="text/css" href="../../../css/icon.css">
	<link rel="stylesheet" type="text/css" href="../../../css/page.css" />
	<link rel="stylesheet" type="text/css" href="../../../css/default.css"/>
	<script type="text/javascript" src="../../../js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="../../../js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../../js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../../js/zz.core.js"></script>
	<script type="text/javascript" src="../../../js/zz.menu.js"></script>
	<script type="text/javascript" src="../../../js/zz.index.js"></script>
	<script type="text/javascript" src="../../../js/util.js"></script>
	<script type="text/javascript" src="../../../js/zz.session1.js"></script>
	<link rel="shortcut icon" href="../../../favicon.ico" type="image/x-icon" />
	<script type="text/javascript" src="<%=path%>/newStyle/js/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
<table id="dg"></table>
<!-- 工具栏 -->
<div id="tb">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="open_win()"></a>
			<%--<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="modArt();"></a>--%>
			<a class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delArt();"></a>
</div>


<!-- 添加窗口 -->
<div style="margin:20px 0;">
	<div id="w" class="easyui-window" title="新增投放" data-options="iconCls:'icon-save', top:'10px'" closed="true" style="width:70%;height:350px;padding:5px;padding-bottom: 0px">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center'" style="padding-top:10px;padding-left: 10px;padding-right: 10px">
				<form id="addForm" method="post">
					<table class="artTable" style="border-collapse:collapse;width: 100%;">
						<input type="hidden" name="adId" id="addAdId" />
						<tr>
							<td width="16%" class="titleTd">
								<a style="margin-right: 10px;">投放网站:</a>
							</td>
							<td width="80%">
								<input style="line-height:20px; border: 1px solid gray; margin-left: 10px; width: 70%"	name="launchSite" type="text" />
							</td>
						</tr>
						<tr>
							<td width="10%" class="titleTd">
								<a style="margin-right: 10px;">开始时间:</a>
							</td>
							<td width="90%">
								<input style="line-height:20px; border: 1px solid gray; margin-left: 10px; width: 70%"	name="createTimeStr" type="text"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="Wdate" />
							</td>
						</tr>
						<tr>
							<td width="10%" class="titleTd">
								<a style="margin-right: 10px;">曝光天数:</a>
							</td>
							<td width="90%">
								<input style="line-height:20px; border: 1px solid gray; margin-left: 10px; width: 70%"	name="exposureDays" type="text" />
							</td>
						</tr>
						<tr>
							<td width="10%" class="titleTd">
								<a style="margin-right: 10px;">曝光权重:</a>
							</td>
							<td width="90%">
								<input style="line-height:20px; border: 1px solid gray; margin-left: 10px; width: 70%"	name="orderIndex" type="text" />
							</td>
						</tr>

					</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitArt();" style="width:80px">提交</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#w').window('close');" style="width:80px">取消</a>
			</div>
		</div>
	</div>
</div>
<!-- 添加 -->
</body>
<script type="text/javascript">
	function open_win(){
		$("input[name='launchSite']").val("");
		$("input[name='orderIndex']").val("");
		$("input[name='createTimeStr']").val("");
		$("input[name='exposureDays']").val("");
		$('#w').window('open');
	}


	var adId = window.parent.adId_p;
	$('#dg').datagrid({
		url:'<c:url value="/launch/getAdE?adId="/>'+adId,
		fitColumns:true,
		nowrap:true,
		rownumbers:true,
		pagination:true,
		singleSelect:true,
		toolbar: '#tb',
		onDblClickRow:modArt,
		columns:[[
			{field:'launchSite',title:'投放网站',width:'15%'},
			{field:'orderIndex',title:'曝光权重',width:'15%'},
			{field:'remark',title:'开始时间',width:'20%',align:'right'},
			{field:'exposureDays',title:'曝光天数',width:'15%'}
		]]
	});

//新增提交from表单
function submitArt(){
	var adId = window.parent.adId_p;
	$("#addAdId").val(adId);

	$('#addForm').form('submit', {
		url:"<c:url value="/launch/addAdE"/>",
		onSubmit: function(){
		},
		success:function(data){
			$('#dg').datagrid('reload');
			$('#w').window('close');
		}
	});
}

function modArt(){
	var row = $('#dg').datagrid('getSelected');
	if (row){
		 //$.messager.alert('Info', row.title+','+row.type+','+row.content);
		 $('#mod_id').val(row.mobilephone);
		 $('#mod_pwd').val(row.password);
		 $('#mod_compnay').val(row.compnay);
		 $('#mod_email').text(row.email);
		$('#modw').window('open');
	}
}

//修改提交from表单
function modSubmitArt(){
	$('#easyui_ditor_mod').val(editor.html());
	$('#modForm').form('submit', {
	    url:"${pageContext.request.contextPath }/art/mod",
	    onSubmit: function(){
	    },
	    success:function(data){
	    	$('#dg').datagrid('reload');
	    	$('#modw').window('close');
	    }
	});
}

//删除
function delArt(){
	var row = $('#dg').datagrid('getSelected');
	if (row){
	$.messager.confirm('提示框', '你确定要删除吗?',function(r){
		if(r){
			$.post(
			"<c:url value="/launch/delAdE"/>",
			{id:row.id},
			function(){
				$('#dg').datagrid('reload');
			}
		);}
	})	
	}
}
//条件查询
function QueryData() {
        $("#dg").datagrid("load", {
            "type":$("input[name='qryType']").val()
        });
    }
</script>
</html>
