$(function(){
	//稿件采集/产出量汇总
	
	
	//获取采集器个数
	homeServes.spiderCountServe(function(response){
    	var pieChartOne = echarts.init(document.getElementById('pieOne'));
		var optionPieOne = {
			title: {
		        text: '采集器个数',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    series : [
		        {
		            name: '采集器个数',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:response,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
    	pieChartOne.setOption(optionPieOne);
    });
    
    //获取采集任务个数
	homeServes.spiderTaskCount(function(response){
		var pieChartTwo = echarts.init(document.getElementById('pieTwo'));
		var optionPieTwo = {
				title: {
			        text: '采集任务个数',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    series : [
			        {
			            name: '采集任务个数',
			            type: 'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:response,
			            itemStyle: {
			                emphasis: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
			};
		 pieChartTwo.setOption(optionPieTwo);
	});
	
	//获取解析器个数
	homeServes.parseCount(function(response){
		var pieChartThree = echarts.init(document.getElementById('pieThree'));
		var optionPieThree = {
				title: {
			        text: '解析器个数',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    series : [
			        {
			            name: '解析器个数',
			            type: 'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:response,
			            itemStyle: {
			                emphasis: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
			};
		pieChartThree.setOption(optionPieThree);
	});
    
	//获取模板个数
	homeServes.templateCount(function(response){
		var pieChartFour = echarts.init(document.getElementById('pieFour'));
		var optionPieFour = {
				title: {
			        text: '模板',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    series : [
			        {
			            name: '模板',
			            type: 'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:response,
			            itemStyle: {
			                emphasis: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
			};
		pieChartFour.setOption(optionPieFour);
	});
    
	
	//采集解析量汇总1
	homeServes.crawParseCont(function(response){
		console.log("arr - ------------------" + response[0]);
		var annoArr = [response[0].annoCrawlerCount,response[0].annoParseCount,response[0].annoNewsCount];
		var macroArr = [response[0].macroCrawlerCount,response[0].macroParseCount,response[0].macroNewsCount];
		var stockArr = [response[0].stockCrawlerCount,response[0].stockParseCount,response[0].stockNewsCount];
		var socialArr = [response[0].socialCrawlerCount,response[0].socialParseCount,response[0].socialNewsCount];
		var myChartZhu = echarts.init(document.getElementById('zhuEchart'));
		myChartZhu.on('click', function(param) {
             var e=param.name;  //这就是你选中图表的名称
             console.log(param);
		});
		var optionZhu = {
			    legend: {
			        data:['公告','宏观','行情','社交']
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
			            data : ['采集量','解析量','产出稿件量']
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
			            type:'bar',
			            data:annoArr,
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
			            name:'宏观',
			            type:'bar',
			            data:macroArr,
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
			            name:'行情',
			            type:'bar',
			            data:stockArr,
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
			            name:'社交',
			            type:'bar',
			            data:socialArr,
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
		
		myChartZhu.setOption(optionZhu);
	});
	
	
	
	//采集解析量汇总2
	homeServes.crawParseCont(function(response){
		var collectArr = [response[0].annoCrawlerCount,response[0].macroCrawlerCount,response[0].stockCrawlerCount,response[0].socialCrawlerCount];
		var analysisArr = [response[0].annoParseCount,response[0].macroParseCount,response[0].stockParseCount,response[0].socialParseCount];
		var outputArr = [response[0].annoNewsCount,response[0].macroNewsCount,response[0].stockNewsCount,response[0].socialNewsCount];
		
		var myChartZhu = echarts.init(document.getElementById('zhuEcharts'));
		myChartZhu.on('click', function(param) {
             var e=param.name;  //这就是你选中图表的名称
             console.log(param);
		});
		var optionZhu = {
			    legend: {
			        data:['采集量','解析量','稿件产出量']
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
			            data : ['公告','宏观','行情','社交']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'采集量',
			            type:'bar',
			            data:collectArr,
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
			            name:'解析量',
			            type:'bar',
			            data:analysisArr,
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
			            name:'稿件产出量',
			            type:'bar',
			            data:outputArr,
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
		
		myChartZhu.setOption(optionZhu);
	});
	
	
	var pieChartFive = echarts.init(document.getElementById('pieFive'));
	var optionPieFive = {
			title: {
		        text: '解析器个数',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    series : [
		        {
		            name: '模板发布',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
					         {'value':'30', 'name':'公告'},
				         	 {'value':'20', 'name':'宏观'},
				         	 {'value':'11', 'name':'行情'},
				         	 {'value':'27', 'name':'社交'}	
					       ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
	pieChartFive.setOption(optionPieFive);
	
	
})
