<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <script>
    if( window != top) {
      top.location.href = window.location.href;
    }
  </script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv = "X-UA-Compatible" content = "IE=edge,chrome=1" />
  <meta name="renderer" content="webkit|ie-comp|ie-stand" />
  <title>DXP广告-品效合一的精准营销平台</title>
  <link rel="stylesheet" type="text/css" href="<c:url value="/newStyle/css/bootstrap.min.css"/>">
  <link rel="stylesheet" type="text/css" href="<c:url value="/newStyle/css/global.css"/>">
  <link rel="stylesheet" type="text/css" href="<c:url value="/newStyle/css/home.css"/>">
  <link href="<c:url value="/css/login.css"/>" type="text/css" rel="stylesheet" />
  <link rel="shortcut icon" href="<c:url value="/favicon.ico"/>" type="image/x-icon" />
</head>

<body>
<div class="header">
  <div class="home-menu-top left">
    <img src="<c:url value="/newStyle/img/logo-white.png"/>" style="height: 50px;">
  </div>
  <div class="homeuser right">
    <div class="header-text">DXP广告-品效合一的精准营销平台</div>
  </div>
</div>
<div class="main-banner">
  <div class="container">
    <div class="row">
      <div class="col-md-5">
        <div class="login-container">
          <div class="text-center lead">登录</div>
          <form id="loginForm" class="form-horizontal" method="post">
            <div class="form-group form-group-lg">
              <div class="col-sm-offset-1 col-sm-10">
                <input type="text" name="mobilephone" class="form-control" placeholder="电话">
              </div>
            </div>
            <div class="form-group form-group-lg">
              <div class="col-sm-offset-1 col-sm-10">
                <input type="password" name="password" class="form-control" placeholder="密码">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-1 col-sm-10 text-danger" id="login-error">&nbsp;</div>
            </div>
            <div class="form-group form-group-lg">
              <div class="col-sm-offset-1 col-sm-10">
                <button type="button" class="btn btn-primary btn-lg btn-block" onclick="login()">登录</button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="col-md-5 text-white">
        <div class="row lead">
          DXP广告-品效合一的精准营销平台，优势：
          <ul>
            <li>强大的媒体流量、丰富的广告形式</li>
            <li>智能的精准引擎、多种投放策略</li>
          </ul>
        </div>
        <div class="row lead">
          为传统广告主提供完整的解决方案
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="<c:url value="/newStyle/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/newStyle/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.easyui.min.js"/>"></script>
<script>
  $("#loginForm").bind('keydown',function(e){
    var key = e.which;
    if (key == 13) {
      login();
    }
  });

  function login() {
    $("#loginForm").form('submit',{
      url: "/login",
      success: function (result) {
        console.info(result);
        if (result == 'succ') {
          window.location.href = "/main";
        } else {
          $("#login-error").html("账号密码错误");
        }
      },
      error: function () {
        $.messager.alert('提示信息', '登录过程发送未知错误!');
      }
    });

  }
</script>
</body>
</html>
