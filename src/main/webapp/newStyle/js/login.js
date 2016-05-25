//login
$(function() {
	$(".wf-cont").css("min-height","880px");
	$(".home-ul-toggle li:first").css({'border-right':'2px solid #00bfff','background-color':'#1f222b'});
	var $div_li = $(".wf-tabs li");
	var $div_cont = $(".wf-tab-container > div");
	$div_li.click(function() {
		$(this).addClass("wf-active").siblings().removeClass("wf-active");
		var indexli = $div_li.index(this);
		$div_cont.eq(indexli).show().siblings().hide();
	});
	$(".wf-gohome").click(function() {
		window.location.href = "home.html";
	});
	
	
	$(".wf-toendover").click(function(){
		$(".wf-companyconttwo > div").hide();
		$(".wf-companyconttwo .wf-companyregok").show();
		var titleli = $(".wf-companytop ul li");
		titleli.eq(3).removeClass("li-active").addClass("li-noactive");
		titleli.eq(3).css("z-index","111111")
		$(".wf-companytop ul li:last").css({"background-color":"#11C7AE","color":"#fff"})
	})
	
	//左侧树形菜单默认显示
	$(".home-ul-toggle ul").hide();
	$(".home-org-select p").css("color","#09b0ff");
	$(".home-org-select p span").css("color","#11C7AE");
	function removeSelect(element) {
		$(element).removeClass("select");
		//清除分类效果
		var selectClass = $(element).parent().attr("class");
		if (selectClass) {
			//图片改为未选中状态
			var strArray = selectClass.split("-");
			strArray[2] = "notselect";
			var notSelected = strArray.join("-");
 			$(element).parent().removeClass(selectClass);
			$(element).parent().addClass(notSelected);
 			$(element).css("color", "#a7acb9");	
 			$(element).children("span").css("color", "#6f7485");
 			$(element).children("span").removeClass("glyphicon-menu-down");
 			$(element).children("span").addClass("glyphicon-menu-right");
 			
		}
	};
	$(".home-ul-toggle p").on('click', function() {
		$(".home-ul-toggle ul").hide();
		$(".home-ul-toggle li").css({'border-right':'none','background-color':'#272b36'});
		$(".home-ul-toggle ul li").css({'border-right':'none','background-color':''});
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
		//加载选中字体样式
		$(this).css("color", "#09b0ff");
		//右边图标选中效果
		$(this).parent().css({'border-right':'2px solid #00bfff','background-color':'#1f222b'});
		$(this).children("span").addClass("glyphicon-menu-down");
		$(this).children("span").css("color", "#09b0ff");
		//显示子类列表
		$(this).next("ul").show();
		$(this).addClass("select");
	});
})