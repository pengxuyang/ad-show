$(function(){
	//新闻公告  参数
	var platformName = $(".onesele").val();
	var sourceType = $(".twosele").val()
	
	//稿件采集/产出量汇总  参数
	var gatherOutputTimeStart = $(".gatheroutputstartTime").val();
	var gatherOutputTimeEnd = $(".gatheroutputendTime").val();
	var gatherOutputCont = $(".gatheroutputcont").val();
	var gatherOutputUnit = $(".gatheroutputunit").val();
	
	
	//稿件产出速度汇总  参数
	var speedStartTime = $(".speedStartTime").val();
	var speedEndTime = $(".speedEndTime").val();
	var speedCont = $(".speedCont").val();
	var speedUnit = $(".speedUnit").val();
	
	
	//最新稿件改变时
	$(".onesele").change(function(){
		platformName = $(this).val();
		homeServes.newsServe(sourceType,platformName,8);
	});
	$(".twosele").change(function(){
		sourceType = $(this).val();
		homeServes.newsServe(sourceType,platformName,8);
	});
	
	homeServes.selectData();
	
	
	//稿件采集/产出量汇总  点击查询
	$(".gatheroutput").on('click',function(){
		var gatherOutputTimeStart = $(".gatheroutputstartTime").val().replace(/-/g,'_').replace(' ','_').replace(/:/g,'_');
		var gatherOutputTimeEnd = $(".gatheroutputendTime").val().replace(/-/g,'_').replace(' ','_').replace(/:/g,'_');
		var gatherOutputCont = $(".gatheroutputcont").val();
		var gatherOutputUnit = $(".gatheroutputunit").val();
		homeServes.gatherOutput(gatherOutputTimeStart,gatherOutputTimeEnd,gatherOutputCont,gatherOutputUnit);
	});
	
	//稿件产出速度汇总  点击查询
	$(".speedBtn").on('click',function(){
		var speedStartTime = $(".speedStartTime").val().replace(/-/g,'_').replace(' ','_').replace(/:/g,'_');
		var speedEndTime = $(".speedEndTime").val().replace(/-/g,'_').replace(' ','_').replace(/:/g,'_');
		var speedCont = $(".speedCont").val();
		var speedUnit = $(".speedUnit").val();
		homeServes.manuSpeed(speedStartTime,speedEndTime,speedUnit,speedCont);
	});
	
	issueEchart();
	curveEchart();
	//稿件产出速度汇总
	homeServes.manuSpeed(speedStartTime,speedEndTime,speedUnit,speedCont);
	
	//最新热词
	homeServes.hotWord();
	
	
	//稿件采集/产出量汇总
	homeServes.gatherOutput(gatherOutputTimeStart,gatherOutputTimeEnd,gatherOutputCont,gatherOutputUnit);
	
	//错误日志请求
	homeServes.errorServe();
	
});

var rootUrl = "http://114.55.34.135:8080/monitor/";
var homeServes = {
		
	//最新热词
	hotWord: function(){
		$.ajax({
			url: rootUrl + 'systemMonitor/termCountByTimeForNews.do',
			type:'get',
			data:{
				'beginTime':'2016_04_10_00_00_00',
				'endTime' : '2016_04_15_00_00_00',
				'count' : '21'
				},
			success:function(data){
				var data = JSON.parse(data);
				for(var i =0; i<data.length;i++){
					$(".keyword ul").append('<li><a href="#">' + data[i].keyWordName + '</a></li>');
				}
			}
		})
	},
	
	
	//7*24小时select
	selectData:function(){
		$.ajax({
			url: '../systemMonitor/getTemplateList.do',
			type:'post',
			data:{},
			success:function(data){
				var data = JSON.parse(data);
				console.log('select-------------' + data);
				for(var i=0;i<data.length;i++){
					$(".onesele").append('<option value="' + data[i].ID + '">' + data[i].NAME + '</option>')
				}
				homeServes.newsServe($(".twosele").val(),$(".onesele").val(),8);
			}
		})
	},
	//获取新闻公告
	newsServe:function(sourceType,platformName,count){
		$.ajax({
			url:'../systemMonitor/getRecentNews.do',
			type:'post',
			data:{
				'sourceType':sourceType,
				'templateId' : platformName,
				'count' : count
				},
			success:function(data){
				var data = JSON.parse(data);
				$("#news li").remove();
				for(var i=0 ; i<data.length; i++){
					var time = new Date().Format("yyyy-MM-dd");
					if(data[i].generateTime.indexOf(time) != -1){
						time = data[i].generateTime.substring(11);
					}else{
						time = data[i].generateTime.substring(5,11);
					}
					var newsList = '<li><a href="#">'+data[i].titleName+'</a><span>'+ time +'</span></li>';
					$("#news").append(newsList);
				}
			}
		})
	},
	
	
	//稿件采集/产出量汇总
	gatherOutput:function(startTime,endTime,cont,unit){
		$.ajax({
			url:rootUrl + 'writingMonitor/getTaskCountWithSourceByTime.do',
			type:'get',
			data:{
				'beginTime': startTime,
				'endTime' : endTime,
				'unit' : unit,  //unit 单位 day 天 hour 小时  min 分钟 second 秒   interval  间隔  
				'interval':cont
				},
			success:function(response){
				var response = JSON.parse(response);
				var times = [],annoCrawl = [],annoOutput = [],macroCrawl = [],macroOutput =[];
				var socialCrawl = [],socialOutput = [],stockCrawl = [],stockOutput = [],crawlCount = [],outputCount = [];
				for(var i=0; i<response.length;i++){
					times.push(response[i].time);
					annoCrawl.push(response[i].annoCrawlCount); // 公告采集
					annoOutput.push(response[i].annoOutputCount); //公告产出
					macroCrawl.push(response[i].macroCrawlCount); // 宏观采集
					macroOutput.push(response[i].macroOutputCount); // 宏观产出
					socialCrawl.push(response[i].socialCrawlCount); // 行情采集
					socialOutput.push(response[i].socialOutputCount); // 行情产出
					stockCrawl.push(response[i].stockCrawlCount); // 社交采集
					stockOutput.push(response[i].stockOutputCount); // 社交产出
					crawlCount.push(parseInt(response[i].annoCrawlCount) + parseInt(response[i].macroCrawlCount) + parseInt(response[i].socialCrawlCount) + parseInt(response[i].stockCrawlCount));
					outputCount.push(parseInt(response[i].annoOutputCount) + parseInt(response[i].macroOutputCount) + parseInt(response[i].socialOutputCount) + parseInt(response[i].stockOutputCount));
				}
				gatherOutputData(times,annoCrawl,macroCrawl,socialCrawl,stockCrawl,crawlCount,annoOutput,macroOutput,socialOutput,stockOutput,outputCount);
			}
		})
	},
	
	
	//稿件产出速度汇总
	manuSpeed:function(beginspeed,endspeed,unitspeed,contspeed){
		$.ajax({
			url:rootUrl + 'systemMonitor/getNewsSpeedWithSourceByTime.do',
			type:'get',
			data:{
				'beginTime': beginspeed,
				'endTime' : endspeed,
				'unit' : unitspeed,  //unit 单位 day 天 hour 小时  min 分钟 second 秒   interval  间隔  
				'interval':contspeed
			},
			success:function(data){
				var data = JSON.parse(data);
				var speedTime = [],annoArr = [],macroArr = [],socialArr = [],stockArr = [],speedAll = [];
				var annoList,macroList,socialList,stockList;
				for(var i=0;i<data.length;i++){
					speedTime.push(data[i].time);
					if(data[i].annoAvgTime != 0){
						annoList = (60000/Number(data[i].annoAvgTime)).toFixed(2);
					}else{
						annoList = 0;
					}
					if(data[i].socialAvgTime != 0){
						socialList = (60000/Number(data[i].socialAvgTime)).toFixed(2);
					}else{
						socialList = 0;
					}
					if(data[i].stockAvgTime != 0){
						stockList = (60000/Number(data[i].stockAvgTime)).toFixed(2);
					}else{
						stockList = 0;
					}
					if(data[i].macroAvgTime != 0){
						macroList = (60000/Number(data[i].macroAvgTime)).toFixed(2);
					}else{
						macroList = 0
					}
					var allList = (Number(annoList) + Number(socialList) + Number(stockList) + Number(macroList)).toFixed(2);
					annoArr.push(annoList);
					macroArr.push(macroList);
					socialArr.push(socialList);
					stockArr.push(stockList);
					speedAll.push(allList);
				}
				manuData(speedTime,annoArr,macroArr,socialArr,stockArr,speedAll);
			}
		});
	},
	
	//获取采集器个数
	spiderCountServe:function(callback){
		$.ajax({
			url:'../systemMonitor/getSpiderCount.do',
			type:'post',
			data:{},
			success:function(data){
				var data = JSON.parse(data);
				objArr=[
				         {'value':data.socialCount, 'name':'公告'},
			         	 {'value':data.annoCount, 'name':'宏观'},
			         	 {'value':data.macroCount, 'name':'行情'},
			         	 {'value':data.stockCount, 'name':'社交'}	
				       ];
				if(callback){
					callback(objArr);
				}
			}
		});
	},
	
	//获取采集任务个数
	spiderTaskCount:function(callback){
		$.ajax({
			url:'../systemMonitor/getSpiderTaskCount.do',
			type:'post',
			data:{},
			success:function(data){
				var data = JSON.parse(data);
				objArr=[
				         {'value':data.socialCount, 'name':'公告'},
			         	 {'value':data.annoCount, 'name':'宏观'},
			         	 {'value':data.macroCount, 'name':'行情'},
			         	 {'value':data.stockCount, 'name':'社交'}	
				       ];
				if(callback){
					callback(objArr);
				}
			}
		});
	},
	
	//获取解析器个数
	parseCount:function(callback){
		$.ajax({
			url:'../systemMonitor/getParseCount.do',
			type:'post',
			data:{},
			success:function(data){
				var data = JSON.parse(data);
				objArr=[
				         {'value':data.socialCount, 'name':'公告'},
			         	 {'value':data.annoCount, 'name':'宏观'},
			         	 {'value':data.macroCount, 'name':'行情'},
			         	 {'value':data.stockCount, 'name':'社交'}	
				       ];
				if(callback){
					callback(objArr);
				}
			}
		});
	},
	
	//获取模板个数
	templateCount:function(callback){
		$.ajax({
			url:'../systemMonitor/getTemplateCount.do',
			type:'post',
			data:{},
			success:function(data){
				var data = JSON.parse(data);
				objArr=[
				         {'value':data.socialCount, 'name':'公告'},
			         	 {'value':data.annoCount, 'name':'宏观'},
			         	 {'value':data.macroCount, 'name':'行情'},
			         	 {'value':data.stockCount, 'name':'社交'}	
				       ];
				if(callback){
					callback(objArr);
				}
			}
		});
	},
	
	
	//采集解析量汇总
	crawParseCont:function(callback){
		$.ajax({
			url: '../systemMonitor/queryTaskCount.do',
			type:'post',
			data:{},
			success:function(data){
				var data = JSON.parse(data);
				if(callback){
					callback(data);
				}
			}
		});
	},
	
	
	//错误日志请求
	errorServe:function(){
		$.ajax({
			url:'../systemMonitor/getErrorLogList.do',
			type:'post',
			data:{},
			timeout:3000,
			success:function(data){
				var data = JSON.parse(data);
				var maxnum = 100/Math.log(data[0].total);
				for(var i=0; i<10; i++){
					var pross = Math.log(data[i].total)*maxnum;
					if(pross == 0){
						pross = pross + 1;
					}
					var listError = '<tr>' +
					'<td>' + data[i].logger_name + '</td>' +
					'<td>' + data[i].total + '  条</td>' +
					'<td>' +
						'<div class="progress">' +
						'<div class="progress-bar progress-bar-info" role="progressbar"' +
						'aria-valuenow="' + pross + '" ' +
						'aria-valuemin="0" aria-valuemax="100" ' +
						'style="width: ' + pross + '%">' +
						'</div></div></td>' + 
					'</tr>';
					$(".errorlog").append(listError);
				}
			}
		});
	}
	
};

//格式化日期函数
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};
//var time1 = new Date().Format("yyyy-MM-dd");
//var time2 = new Date().Format("yyyy-MM-dd HH:mm:ss");

//稿件产出速度汇总
function manuData(times,anno,macro,social,stock,allSpeed){
	var myChartTwo = echarts.init(document.getElementById('echart-two')); //速度
	
	var optionTwo = {
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['公告','宏观','行情','社交','全部']
		    },
		    calculable : true,
		    grid: {
		        left: '2%',
		        right: '4%',
		        bottom: '2%',
		        top : '15%',
		        containLabel: true,
		        x: 0,
		        y: 0,
		        x1: 0,
		        y2: 0
		    },
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : times
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'公告',
		            type:'line',
		            smooth:true,
		            itemStyle: {
		            	normal: {
		            		color: 'rgba(194,53,49,1)',
		            		lineStyle:{
		            			color: 'rgba(194,53,49,1)'
		            		},
		            		areaStyle: {
		            				type: 'default',
		            				color: 'rgba(194,53,49,0.1)'
		            			}
		            		}
		            	},
		            data:anno
		        },
		        {
		            name:'宏观',
		            type:'line',
		            smooth:true,
		            itemStyle: {
		            	normal: {
		            		color: 'rgba(95,173,224,1)',
		            		lineStyle:{
		            			color: 'rgba(95,173,224,1)'
		            		},
		            		areaStyle: {
		            				type: 'default',
		            				color: 'rgba(95,173,224,0.1)'
		            			}
		            		}
		            	},
		            data:macro
		        },
		        {
		            name:'行情',
		            type:'line',
		            smooth:true,
		            itemStyle: {
		            	normal: {
		            		color: 'rgba(106,224,170,1)',
		            		lineStyle:{
		            			color: 'rgba(106,220,179,1)'
		            		},
		            		areaStyle: {
		            				type: 'default',
		            				color: 'rgba(106,224,170,0.1)'
		            			}
		            		}
		            	},
		            data:stock
		        },
		        {
		            name:'社交',
		            type:'line',
		            smooth:true,
		            itemStyle: {
		            	normal: {
		            		color: 'rgba(82,209,152,1)',
		            		lineStyle:{
		            			color: 'rgba(82,209,152,1)'
		            		},
		            		areaStyle: {
		            				type: 'default',
		            				color: 'rgba(82,209,152,0.1)'
		            			}
		            		}
		            	},
		            data:social
		        },
		        {
		            name:'全部',
		            type:'line',
		            smooth:true,
		            itemStyle: {
		            	normal: {
		            		color: 'rgba(255,193,95,1)',
		            		lineStyle:{
		            			color: 'rgba(255,193,95,1)'
		            		},
		            		areaStyle: {
		            				type: 'default',
		            				color: 'rgba(255,193,95,0.1)'
		            			}
		            		}
		            	},
		            data:allSpeed
		        }
		    ]
		};
	
	
	myChartTwo.setOption(optionTwo);  //速度
	
}

//发布端柱状图
function issueEchart(){
	var issueChart = echarts.init(document.getElementById('issuepillar'));
	var optionIssue = {
//			title: {
//		        text: '发布端柱状与',
//		        x:'left'
//		    },
		    legend: {
		        data:['7*24','一财','客户','走马灯','媒体']
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{b} <br/>{a} : {c}"
		    },
		    grid: {
		        left: '2%',
		        right: '2%',
		        bottom: '2%',
		        top : '15%',
		        containLabel: true,
		        x: 0,
		        y: 0,
		        x1: 0,
		        y2: 0
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : ['发布端']
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'7*24',
		            type:'bar',
		            data:[200],
		            itemStyle: {
		                 normal: {
		                     label: {
		                         show: true,
		                         position: 'top',
		                         textStyle: {
		                             color: '#000000'
		                         }
		                     }
		                 }
		            }
		        },
		        {
		            name:'一财',
		            type:'bar',
		            data:[120],
		            itemStyle: {
		                 normal: {
		                     label: {
		                         show: true,
		                         position: 'top',
		                         textStyle: {
		                             color: '#000000'
		                         }
		                     }
		                 }
		            }
		        },
		        {
		            name:'客户',
		            type:'bar',
		            data:[350],
		            itemStyle: {
		                 normal: {
		                     label: {
		                         show: true,
		                         position: 'top',
		                         textStyle: {
		                             color: '#000000'
		                         }
		                     }
		                 }
		            }
		        },
		        {
		            name:'走马灯',
		            type:'bar',
		            data:[600],
		            itemStyle: {
		                 normal: {
		                     label: {
		                         show: true,
		                         position: 'top',
		                         textStyle: {
		                             color: '#000000'
		                         }
		                     }
		                 }
		            }
		        },
		        {
		            name:'媒体',
		            type:'bar',
		            data:[620],
		            itemStyle: {
		                 normal: {
		                     label: {
		                         show: true,
		                         position: 'top',
		                         textStyle: {
		                             color: '#000000'
		                         }
		                     }
		                 }
		            }
		        }
		    ]
		};
	issueChart.setOption(optionIssue);
}


//发布端曲线图
function curveEchart(){
	var curveChart = echarts.init(document.getElementById('issuecurve'));
	var optionCurve = {
//			title: {
//		        text: '发布端柱状与',
//		        x:'left'
//		    },
			tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['7*24','一财','客户','走马灯','媒体']
		    },
		    calculable : true,
		    grid: {
		        left: '2%',
		        right: '4%',
		        bottom: '2%',
		        top : '15%',
		        containLabel: true,
		        x: 0,
		        y: 0,
		        x1: 0,
		        y2: 0
		    },
		    xAxis : [
		        {
		        	show:true,
		            type : 'category',
		            boundaryGap : false,
		            data : ['10-16','10-17','10-18','10-19','10-20','10-21']
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'7*24',
		            type:'line',
		            smooth:true,
		            data:[200,100,24,125,213,532]
		        },
		        {
		            name:'一财',
		            type:'line',
		            smooth:true,
		            data:[120,23,291,21,210,110]
		        },
		        {
		            name:'客户',
		            type:'line',
		            smooth:true,
		            data:[350,220,93,321,362,19]
		        },
		        {
		            name:'走马灯',
		            type:'line',
		            smooth:true,
		            data:[600,220,430,128,378,22]
		        },
		        {
		            name:'媒体',
		            type:'line',
		            smooth:true,
		            data:[620,210,330,22,158,209]
		        }
		    ]
		};
	curveChart.setOption(optionCurve);
}

//稿件采集/产出量汇总
function gatherOutputData(times,annoCrawl,macroCrawl,socialCrawl,stockCrawl,crawlCount,annoOutput,macroOutput,socialOutput,stockOutput,outputCount){
	var myChartOne = echarts.init(document.getElementById('echart-one')); //分量
	var optionOne = {
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['公告采集','宏观采集','行情采集','社交采集','全部采集','公告产出','宏观产出','行情产出','社交产出','全部产出'],
		        selected: {
				    // 选中'系列1'
				    '公告采集': false,
				    '宏观采集': false,
				    '行情采集': false,
				    '社交采集': false,
				    '全部采集': true,
				    '公告产出': false,
				    '宏观产出': false,
				    '行情产出': false,
				    '社交产出': false,
				    '全部产出': true
				}
		    },
		    calculable : true,
		    grid: {
		        left: '2%',
		        right: '4%',
		        bottom: '2%',
		        top : '15%',
		        containLabel: true,
		        x: 0,
		        y: 0,
		        x1: 0,
		        y2: 0
		    },
		    xAxis : [
		        {
		        	show:true,
		            type : 'category',
		            boundaryGap : false,
		            data : times
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'公告采集',
		            type:'line',
		            smooth:true,
		            data:annoCrawl
		        },
		        {
		            name:'宏观采集',
		            type:'line',
		            smooth:true,
		            data:macroCrawl
		        },
		        {
		            name:'行情采集',
		            type:'line',
		            smooth:true,
		            data:socialCrawl
		        },
		        {
		            name:'社交采集',
		            type:'line',
		            smooth:true,
		            data:stockCrawl
		        },
		        {
		            name:'全部采集',
		            type:'line',
		            smooth:true,
		            data:crawlCount
		        },
		        {
		            name:'公告产出',
		            type:'line',
		            smooth:true,
		            itemStyle: {
		            	normal: {
		            		color: 'rgba(194,53,49,0.8)',
		            		lineStyle:{
		            			color: 'rgba(194,53,49,0.8)'
		            		},
		            		areaStyle: {
		            				type: 'default',
		            				color: 'rgba(194,53,49,0.1)'
		            			}
		            		}
		            	},
		            data:annoOutput
		        },
		        {
		            name:'宏观产出',
		            type:'line',
		            smooth:true,
		            itemStyle: {
		            	normal: {
		            		color: 'rgba(95,173,224,0.8)',
		            		lineStyle:{
		            			color: 'rgba(95,173,224,0.8)'
		            		},
		            		areaStyle: {
		            				type: 'default',
		            				color: 'rgba(95,173,224,0.1)'
		            			}
		            		}
		            	},
		            data:macroOutput
		        },
		        {
		            name:'行情产出',
		            type:'line',
		            smooth:true,
		            itemStyle: {
		            	normal: {
		            		color: 'rgba(106,224,170,0.8)',
		            		lineStyle:{
		            			color: 'rgba(106,220,179,0.8)'
		            		},
		            		areaStyle: {
		            				type: 'default',
		            				color: 'rgba(106,224,170,0.1)'
		            			}
		            		}
		            	},
		            data:socialOutput
		        },
		        {
		            name:'社交产出',
		            type:'line',
		            smooth:true,
		            itemStyle: {
		            	normal: {
		            		color: 'rgba(82,209,152,0.8)',
		            		lineStyle:{
		            			color: 'rgba(82,209,152,0.8)'
		            		},
		            		areaStyle: {
		            				type: 'default',
		            				color: 'rgba(82,209,152,0.1)'
		            			}
		            		}
		            	},
		            data:stockOutput
		        },
		        {
		            name:'全部产出',
		            type:'line',
		            smooth:true,
		            itemStyle: {
		            	normal: {
		            		color: 'rgba(255,193,95,0.8)',
		            		lineStyle:{
		            			color: 'rgba(255,193,95,0.8)'
		            		},
		            		areaStyle: {
		            				type: 'default',
		            				color: 'rgba(255,193,95,0.1)'
		            			}
		            		}
		            	},
		            data:outputCount
		        }
		    ]
		};
	function checkjudge(){
    	if($(".collectCont").is(':checked') && $(".outputCont").is(":checked")){
    		optionOne.legend.data = ['公告采集','宏观采集','行情采集','社交采集','全部采集','公告产出','宏观产出','行情产出','社交产出','全部产出'];
    		optionOne.legend.selected = {
				    // 选中'系列1'
				    '公告采集': true,
				    '宏观采集': true,
				    '行情采集': true,
				    '社交采集': true,
				    '全部采集': true,
				    '公告产出': true,
				    '宏观产出': true,
				    '行情产出': true,
				    '社交产出': true,
				    '全部产出': true
				};
			myChartOne.setOption(optionOne);
		}else if($(".collectCont").is(':checked') && !$(".outputCont").is(":checked")){
			optionOne.legend.data = ['公告采集','宏观采集','行情采集','社交采集','全部采集'];
			optionOne.legend.selected = {
				    // 选中'系列1'
					'公告采集': true,
				    '宏观采集': true,
				    '行情采集': true,
				    '社交采集': true,
				    '全部采集': true,
				    '公告产出': false,
				    '宏观产出': false,
				    '行情产出': false,
				    '社交产出': false,
				    '全部产出': false
				};
			optionOne.series = optionOne.series.slice(0,5);
			myChartOne.setOption(optionOne);
		}else if($(".outputCont").is(':checked') && !$(".collectCont").is(":checked")){
			optionOne.legend.data = ['公告产出','宏观产出','行情产出','社交产出','全部产出'];
			optionOne.legend.selected = {
				    // 选中'系列1'
				    '公告采集': false,
				    '宏观采集': false,
				    '行情采集': false,
				    '社交采集': false,
				    '全部采集': false,
				    '公告产出': true,
				    '宏观产出': true,
				    '行情产出': true,
				    '社交产出': true,
				    '全部产出': true
				};
			optionOne.series = optionOne.series.slice(5,10);
			myChartOne.setOption(optionOne);
		}else{
			optionOne.legend.data = [];
			optionOne.legend.selected = {
				    // 选中'系列1'
				    '公告采集': false,
				    '宏观采集': false,
				    '行情采集': false,
				    '社交采集': false,
				    '全部采集': false,
				    '公告产出': false,
				    '宏观产出': false,
				    '行情产出': false,
				    '社交产出': false,
				    '全部产出': false
				};
			optionOne.series = [];
			
		}
    };
    
    //采集量点击事件
    $(".collectCont").on('click',function(){
    	checkjudge();
	});
  //产出量点击事件
    $(".outputCont").on('click',function(){
    	checkjudge();
	});
	
	myChartOne.setOption(optionOne);
}