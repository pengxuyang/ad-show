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
	<%--<script type="text/javascript" src="../../../js/zz.core.js"></script>
	<script type="text/javascript" src="../../../js/zz.menu.js"></script>
	<script type="text/javascript" src="../../../js/zz.index.js"></script>
	<script type="text/javascript" src="../../../js/util.js"></script>
	<script type="text/javascript" src="../../../js/zz.session1.js"></script>--%>
	<link rel="shortcut icon" href="../../../favicon.ico" type="image/x-icon" />
	<script type="text/javascript" src="<%=path%>/newStyle/js/date/WdatePicker.js"></script>

</head>

<body>
<table id="dg"></table>
<!-- 工具栏 -->
<div id="tb">
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="open_pv()"></a>
			<%--<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="modArt();"></a>--%>
			<%--<a class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delArt();"></a>--%>
</div>
<!-- 工具栏 -->



<!-- 添加窗口 -->
<div style="margin:20px 0;">
	<div id="w" class="easyui-window" title="设置点击数" data-options="iconCls:'icon-save', top:'10px'" closed="true" style="width:50%;height:300px;padding:5px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center'" style="padding:10px;">
				<form id="addForm" method="post">
					<table class="artTable" style="border-collapse:collapse;width: 100%;">
						<input type="hidden" name="id" id="mod_addAdId" />
						<tr>
							<td width="20%" class="titleTd">
								<a style="margin-right: 10px;">点击数:</a>
							</td>
							<td width="79%">
								<input style="line-height:20px; border: 1px solid gray; margin-left: 10px; width: 70%"	name="uv" type="text" />
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
<!-- 修改窗口 -->
<div style="margin:20px 0;">
	<div id="modw" class="easyui-window" title="广告详情" data-options="iconCls:'icon-save', top:'10px'" closed="true" style="width:70%;height:500px;padding:5px;">
		<div class="easyui-layout" data-options="fit:true">

			<%--<div data-options="region:'center'" style="padding:10px;">
				<table id="dgbg"></table>
				<!-- 工具栏 -->
				<div id="tbbg">
					<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="$('#w').window('open')"></a>
					&lt;%&ndash;<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="modArt();"></a>&ndash;%&gt;
					<a class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delArt();"></a>
				</div>
				<!-- 工具栏 -->
			</div>--%>
			<iframe id="bgIfr" src=""  vsspace="0" hspace="0"
					allowTransparency="true" id="ifra" name="ifr-left-bar"
					frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
					width="100%" height="500px">

			</iframe>


			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<%--<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="modSubmitArt();" style="width:80px">提交</a>--%>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#modw').window('close');" style="width:80px">取消</a>
			</div>
		</div>
	</div>
	</div>
<!-- 修改 -->		
</body>
<script type="text/javascript">
	function open_pv(){
		var row = $('#dg').datagrid('getSelected');
		if (row){
			//$.messager.alert('Info', row.title+','+row.type+','+row.content);
			//$('#mod_id').val(row.mobilephone);
			//onDblClickRow:modArt,*!/
			var adId = row.id;
			var up = row.uv;
			$("#mod_addAdId").val(adId);
			$("input[name='uv']").val(up);
			$('#w').window('open');
		}else{
			alert("请选择一条记录");
		}



	}


	//新增提交from表单
	function submitArt(){
		$('#addForm').form('submit', {
			url:"<c:url value="/launch/modAdgNum"/>",
			onSubmit: function(){
			},
			success:function(data){
				$('#dg').datagrid('reload');
				$('#w').window('close');
			}
		});
	}

//数据网格
$('#dg').datagrid({
	    url:'<c:url value="/launch/ajax"/>',
	    fitColumns:true,
	    nowrap:true,
	    rownumbers:true,
	    pagination:true,
	    singleSelect:true,
	    onDblClickRow:modArt,
	    toolbar: '#tb',
	    columns:[[
			/*{field:'id',title:'广告',width:'15%'},*/
			{field:'compnayName',title:'公司',width:'15%'},
			/* {field:'content',title:'内容',width:'15%'}, */
			{field:'launchState',title:'投放状态',width:'15%',formatter:function(value,row,index) {
				if (value == 'T') {
				 return '投放'
				 }else {
					return '未投放';
				}
			}},
			{field:'uv',title:'点击数',width:'15%'},
			{field:'id',title:'投放详情',width:'20%',formatter:function(value,row,index) {
				/*if (value == 'admin') {
					return '管理员'
				}else if(value == 'cust'){
					return '客户';
				}else if(value == 'agent'){
					return '客户代理';
				}*/
				return "<a onclick='open_load()' style='cursor: pointer'>双击该行查看</a>";
			},align:'right'}
	    ]]
	});

	var adId_p = "";


function modArt(){

	var row = $('#dg').datagrid('getSelected');
	if (row){
		 //$.messager.alert('Info', row.title+','+row.type+','+row.content);
		 //$('#mod_id').val(row.mobilephone);
		//onDblClickRow:modArt,*!/
		var adId = row.id;
		adId_p = adId;
    	var url = '<c:url value="/launch/toadd"/>';
		$("#addAdId").val(adId);
		$("#bgIfr").attr("src",url);
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
