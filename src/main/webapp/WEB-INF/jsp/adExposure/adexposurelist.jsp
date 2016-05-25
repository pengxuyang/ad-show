<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>

<body>
<table id="dg"></table>
<!-- 工具栏 -->
<div id="tb">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="$('#w').window('open')"></a>
    <%--<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="modArt();"></a>--%>
    <a class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delArt();"></a>
</div>
<!-- 工具栏 -->

</body>
<script type="text/javascript">

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
            {field:'gender',title:'目标性别',width:'15%'},
            {field:'id',title:'投放详情',width:'20%',formatter:function(value,row,index) {
                /*if (value == 'admin') {
                 return '管理员'
                 }else if(value == 'cust'){
                 return '客户';
                 }else if(value == 'agent'){
                 return '客户代理';
                 }*/
                return "<a onclick='toexposure()'>点击查看</a>";
            },align:'right'}
        ]]
    });


    /*//新增提交from表单
     function submitArt(){
     $('#addForm').form('submit', {
     url:"<c:url value="/user/add"/>",
     onSubmit: function(){
     },
     success:function(data){
     $('#dg').datagrid('reload');
     $('#w').window('close');
     }
     });
     }*/

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


    function toexposure(){
        location.href = 'launch/toexposurelist';
    }
</script>
</html>
