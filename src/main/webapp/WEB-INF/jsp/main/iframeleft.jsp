<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String path = request.getContextPath(); %>
<jsp:include page="${path}/common/meta.jsp"></jsp:include>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="<%=path %>/newStyle/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=path %>/newStyle/css/global.css" />
		<link rel="stylesheet" href="<%=path %>/newStyle/css/home.css" />
		<link rel="stylesheet" href="<%=path %>/newStyle/css/jquery.mCustomScrollbar.css" />
		<script type="text/javascript" src="<%=path %>/newStyle/js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="<%=path %>/newStyle/js/jquery.mCustomScrollbar.concat.min.js"></script>
		<script type="text/javascript" src="<%=path %>/newStyle/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=path %>/newStyle/js/login.js"></script>
		<script type="text/javascript" src="<%=path %>/js/mune.js"></script>
		<script type="text/javascript">
		
			$(function() {
				autoLeftMenuHeight();
			});
			
			//窗口改变大小时触发的事件
			window.onresize = function() {
				autoLeftMenuHeight();
			};
			
			//自适应左菜单栏高度
			function autoLeftMenuHeight() {
				$(".panel-body").mCustomScrollbar("destroy");
				var windowHeight = document.body.clientHeight;
				$(".panel-body").mCustomScrollbar({
					setHeight: windowHeight,
					theme: "dark-3"
				});
			};
		</script>
	</head>

	<body style="background-color:#272b36">

		<div id="collapseOne" class="panel-collapse collapse in">
			<div class="panel-body">
				<div class="home-leftmenu">
					<div class="home-menu-ul">
						<ul class="home-ul-toggle" id="root">
							
						</ul>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>