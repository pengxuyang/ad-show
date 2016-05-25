//login
$(function() {
	$.ajax({
		url : webroot + '/menu',
		type : 'POST',
		data:{id:'0'},
		dataType:'text',
		success : function(data) {
			console.info(perStr);
			console.info(perStr.indexOf('admin')==-1?false:true);
			var li="";
			if(perStr.indexOf('admin')==-1?false:true){
				li=li+'<li class="home-bigping-notselect"><p onclick="window.parent.userManage();" >用户管理</p></li>';
				li=li+'<li class="home-bigping-notselect"><p onclick="window.parent.launchManage();" >广告投放</p></li>';
			}else{
				li=li+'<li class="home-home-select" style="border-right-width: 2px; border-right-style: solid; border-right-color: rgb(0, 191, 255); background-color: rgb(31, 34, 43);"><p class="select" onclick="window.parent.overview();" style="color: rgb(9, 176, 255);">概览</p></li>';
				li=li+'<li class="home-bigping-notselect"><p onclick="window.parent.materialManage();" >广告素材管理</p></li>';

			}


			/*for(var i=0;i<data.length;i++)
			{
				if(data[i].sysMenuName != "大屏监控"){
					li = li + '<li onclick=\"liNext(this)\" data-value='+data[i].id+' name='+data[i].isLeaf+' class="' + data[i].sysMenuCode + '" >'+'<p>'+data[i].sysMenuName+'<span class="glyphicon glyphicon-menu-right"></span></p>'+'</li>';
				}else{
					if(perStr == ",all," || perStr.indexOf(",bigScreen_view,") > -1){
						li = li + '<li class="' + data[i].sysMenuCode + '"><p onclick="window.parent.bigpingmain(\'' + data[i].sysMenuUrl + '\');">'+data[i].sysMenuName+'</p></li>';
					}
				}
			}*/
			$("#root").append(li);
			
			$(".home-ul-toggle p").on('click', function() {
				$(".home-ul-toggle ul").remove();
				removeSelect($(".home-leftmenu .select"));
				//展开效果
				var notSelectedClass = $(this).parent().attr("class");
				
				//删除未选中的效果
				$(this).parent().removeClass(notSelectedClass);
				
				//添加选中效果
				var strArray = notSelectedClass.split("-");
				
				strArray[2] = "select";
				var selectedClass = strArray.join("-");
				$(this).parent().addClass(selectedClass);

				$(this).parent().css("border-right-width", "2px");
				$(this).parent().css("border-right-style", "solid");
				$(this).parent().css("border-right-color", "rgb(0, 191, 255)");
				$(this).parent().css("backgroundColor", "rgb(31, 34, 43)");
				//加载选中字体样式
				$(this).css("color", "rgb(9, 176,255)");
				
				//右边图标选中效果
				//$(this).children("span").addClass("glyphicon-menu-down");
				//显示子类列表
				$(this).next("ul").show();
				$(this).addClass("select");
		});
			
			
		}
	});
	
	
	function removeSelect(element) {
		$(element).removeClass("select");
		//清除分类效果
		$(element).next("ul").hide();
		var selectClass = $(element).parent().attr("class");
		if (selectClass) {
			//图片改为未选中状态
			var strArray = selectClass.split("-");
			strArray[2] = "notselect";
			var notSelected = strArray.join("-");
 			$(element).parent().removeClass(selectClass);
			$(element).parent().addClass(notSelected);
			$(element).parent().removeAttr("style");
 			$(element).css("color", "#a7acb9");	
 			$(element).children("span").css("color", "#6f7485");
 			$(element).children("span").removeClass("glyphicon-menu-down");
 			$(element).children("span").addClass("glyphicon-menu-right");
 			
		}
	};
	
});

function liNext(obj){
		var child = $(obj).children('ul');
	
	if(child.length==0){
		$.ajax({
			url : webroot + '/getChildMenuList.do',
			type : 'POST',
			data:{id:$(obj).attr("data-value")},
			dataType:'json',
			success : function(databack) {
				$(obj).find("ul").remove();
				var uli = '';
				for(var j=0;j<databack.length;j++)
				{
					uli = uli + '<li data-value='+databack[j].isLeaf+' onclick="classAddOrRemove(this)"><a href="'+databack[j].sysMenuUrl+'" target="ifr-right-cont">'+databack[j].sysMenuName+'</a></li>'
				}
				var u = '<ul>'+uli+'</ul>';
				
				$(obj).append(u);
			}
		});
	}
}

var imgStr = "<img src='" + webroot + "/img/wf_menu80.png' width='10px;' name='imgLink'/>";
function classAddOrRemove(li){
	var imgs = $("img[name='imgLink']");
	for(var i=0;i<imgs.length;i++){
		imgs[i].remove();
	}
	$(li).html(imgStr + $(li).html());
}
