<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="${path}/common/meta.jsp"></jsp:include>



<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="<%=path%>/newStyle/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=path%>/newStyle/css/global.css" />
		<link rel="stylesheet" href="<%=path%>/newStyle/css/home.css" />
		<link rel="stylesheet" href="<%=path%>/newStyle/css/homeNew.css" />
		<script type="text/javascript" src="<%=path%>/newStyle/js/jquery-2.1.4.min.js" ></script>
		<script type="text/javascript" src="<%=path%>/newStyle/js/echarts.min.js" ></script>
		<script type="text/javascript" src="<%=path%>/newStyle/js/echarts.js" ></script>
		<script type="text/javascript" src="<%=path%>/newStyle/js/homeservice.js" ></script>
		<script type="text/javascript" src="<%=path%>/js/logger/date/WdatePicker.js" ></script>
	</head>
	<body>
	   <!--饼状图新闻-->
	    <div class="piechart">
	    	<div class="peicharts left">
	    		<div class="curvetitle">
	    			<h2>最新热词</h2>
	    		</div>
	    		<div class="clear"></div>
	    		<div class="keyword border">
	    			<ul>
	    			</ul>
	    		</div>
	    	</div>
	    	<div class="peinews right">
	    		<div class="curvetitle">
	    			<h2 class="left">最新稿件</h2>
	    			<form class="form-inline right">
	    				<div class="form-group">
	    					<select class="onesele">
	    					</select>
	    				</div>
	    				<div class="form-group">
	    					<select class="twosele">
	    						<option>公告</option>
	    						<option>宏观</option>
	    						<option>行情</option>
	    						<option>社交</option>
	    					</select>
	    				</div>
	    			</form>
	    		</div>
	    		<div class="border newsheight">
		    		<ul id='news'>
		    		</ul>
		    		<a href="#" class="rigthblock">更多>></a>
	    		</div>
	    		
	    	</div>
	    </div>
	    <!--采集解析功能汇总-->
	    <div class="part">
	    	<div class="curvetitle">
    			<h2>采集解析功能汇总</h2>
    		</div>
	    	<div class="chart_con heismall">
	    		<ul>
	    			<li id="pieOne"></li>
	    			<li id="pieTwo"></li>
	    			<li id="pieThree"></li>
	    			<li id="pieFour"></li>
	    			<li id="pieFive"></li>
	    		</ul>
	    	</div>
	    </div>
	   
	    
	    <!--采集解析量汇总1-->
	    <div class="part">
	    	<div class="curvetitle">
    			<h2>采集解析量汇总1</h2>
    		</div>
	    	<div class="chart_con" id="zhuEchart"></div>
	    </div>
	    <!--采集解析量汇总2-->
	    <div class="part">
	    	<div class="curvetitle">
    			<h2>采集解析量汇总2</h2>
    		</div>
	    	<div class="chart_con" id="zhuEcharts"></div>
	    </div>
	    
	    
	     <!--分量-->
	    <div class="part chart">
	    	<div class="curvetitle">
    			<h2 class="left mt5">稿件采集/产出量汇总</h2>
    			<form class="form-inline right">
    				<div class="checkbox">
					    <label>
					      <input type="checkbox" class="collectCont" checked> 采集量
					    </label>
					</div>
					<div class="checkbox">
					    <label>
					      <input type="checkbox" class="outputCont" checked> 产出量
					    </label>
					</div>
    				<div class="form-group">
    					<input type="text" class="form-control gatheroutputstartTime" onclick="WdatePicker()" placeholder='开始时间'> -
    				</div>
    				<div class="form-group">
    					<input type="text" class="form-control gatheroutputendTime" onclick="WdatePicker()" placeholder='结束时间'>
    				</div>
    				<div class="form-group">
    					<input type="text" class="form-control width40 gatheroutputcont">
    				</div>
    				<div class="form-group">
    					<select class="form-control gatheroutputunit">
    						<option value='second'>秒</option>
    						<option value='min'>分钟</option>
    						<option value='hour'>小时</option>
    						<option value='day'>天</option>
    					</select>
    				</div>
    				<button type="button" class="btn btn-primary gatheroutput">查询</button>
    			</form>
    		</div>
	    	<div class="chart_con" id="echart-one"></div>
	    </div>
		
		<div class="part">
			<div class="curvetitle">
    			<h2 class="left mt5">发布端</h2>
    			<form class="form-inline right">
    				<div class="form-group">
    					<input type="text" class="form-control" onclick="WdatePicker()" placeholder='开始时间'> -
    				</div>
    				<div class="form-group">
    					<input type="text" class="form-control" onclick="WdatePicker()" placeholder='结束时间'>
    				</div>
    				<div class="form-group">
    					<input type="text" class="form-control width40">
    				</div>
    				<div class="form-group">
    					<select class="form-control">
    						<option value='second'>秒</option>
    						<option value='min'>分钟</option>
    						<option value='hour'>小时</option>
    						<option value='day'>天</option>
    					</select>
    				</div>
    				<button type="button" class="btn btn-primary">查询</button>
    			</form>
    		</div>
			<div class="issueEchart">
				<div class="issuepillar left" id="issuepillar"></div>
				<div class="issuecurve right" id="issuecurve"></div>
			</div>
		</div>
		
		<!--速度-->
	    <div class="part chart">
	    	<div class="curvetitle">
    			<h2 class="left mt5">稿件产出速度汇总</h2>
    			<form class="form-inline right">
    				<div class="form-group">
    					<input type="text" class="form-control speedStartTime" onclick="WdatePicker()" placeholder='开始时间'> -
    				</div>
    				<div class="form-group">
    					<input type="text" class="form-control speedEndTime" onclick="WdatePicker()" placeholder='结束时间'>
    				</div>
    				<div class="form-group">
    					<input type="text" class="form-control width40 speedCont">
    				</div>
    				<div class="form-group">
    					<select class="form-control speedUnit">
    						<option value='second'>秒</option>
    						<option value='min'>分钟</option>
    						<option value='hour'>小时</option>
    						<option value='day'>天</option>
    					</select>
    				</div>
    				<button type="button" class="btn btn-primary speedBtn">查询</button>
    			</form>
    		</div>
	    	<div class="chart_con" id="echart-two"></div>
	    </div>
		
		<!--管理日志-->
		<div class="part">
			<div class="curvetitle">
    			<h2>管理日志</h2>
    		</div>
			<div class="part_con">
				<div>
					<table class="table opt_num" >
						<thead>
							<tr>
								<th style="width: 200px;">ERROR类名</th>
								<th colspan="2">数量</th>
							</tr>
						</thead>
						<tbody class="errorlog">
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
	</body>
</html>
