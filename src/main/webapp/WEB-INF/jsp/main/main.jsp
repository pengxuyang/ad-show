<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.amao.ad2.model.User" %>
<%String path = request.getContextPath(); %>
<%String role = ((User)request.getSession().getAttribute("money_user_id")).getUserRole(); %>
<jsp:include page="${path}/common/meta.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="<%=path %>/newStyle/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=path %>/newStyle/css/global.css"/>
    <link rel="stylesheet" href="<%=path %>/newStyle/css/home.css"/>
    <script type="text/javascript" src="<%=path %>/newStyle/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="<%=path %>/newStyle/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/newStyle/js/login.js"></script>
    <script type="text/javascript">
        $(function () {
            autoHeight();
        });
        window.onresize = function () {
            autoHeight();
        };
        function autoHeight() {
            var windowHeight = document.body.clientHeight;
            var actualHeight = windowHeight - 80;
            $("#ifra").height(actualHeight);
            $("#ifr").height(actualHeight);
            $(".home-container").height(actualHeight);
            $(".home-rightcont").height(actualHeight);
        }
        ;
        function overview() {
            document.getElementById('ifr').src = webroot + "/overview/index";
        }

        function materialManage() {
            document.getElementById('ifr').src = webroot + "/panel/adg/index";
        }

        function userManage() {
            document.getElementById('ifr').src = webroot + "/user/index";
        }

        function launchManage() {
            document.getElementById('ifr').src = webroot + "/launch/index";
        }

        function bigpingmain(url) {
            window.open(url);
        }

        function logout() {
            if (confirm("确定要退出吗？")) {
                window.location.href = webroot + '/logout.do';
            }
        }

        //打开重置密码弹窗
        function open_pwd_comm() {
            $('#resetDia_comm').show();
            $('#bg_comm_update').show();
        }
        //关闭重置密码弹窗
        function close_pwd_comm() {
            $('#resetDia_comm').hide();
            $('#bg_comm_update').hide();
            $("input[name='pwd_comm_old']").val("");
            $("input[name='pwd_comm_new']").val("");
            $("input[name='pwd_comm_new_repeat']").val("");
        }

        //提交重置密码
        function sure_reset_comm() {
            var oldpwd = $("input[name='pwd_comm_old']").val();
            var newpwd = $("input[name='pwd_comm_new']").val();
            var newpwdCfm = $("input[name='pwd_comm_new_repeat']").val();

            if ($.trim(newpwd) != $.trim(newpwdCfm)) {
                alert("两次密码不一致");
                return;
            }

            if ($.trim(newpwd) != "" && newpwd == newpwdCfm) {
                $.post(webroot + "/account/updatePwd.do", {'pwd': newpwd, 'oldpwd': oldpwd}, function (data) {
                    if (data == "succ") {
                        alert("重置成功，请重新登录！");
                        close_pwd_comm();
                        window.location.href = webroot;
                    } else {
                        alert("重置失败!");
                    }
                })
            } else {
                alert("密码校验未通过!");
            }
        }

        function adjustPasswordDiv() {
            var width = document.body.clientWidth;
            $('#resetDia_comm').css("left", (width - $('#resetDia_comm').width()) / 2);
        }

    </script>
</head>
<body onload="adjustPasswordDiv()">
<div class="header">
    <div class="home-menu-top left">
        <img src="<%=path %>/newStyle/img/logo-white.png" style="height: 50px;">
    </div>
    <div class="homeuser right">
        <div class="usercont">
            <div class="userdiv">
                <span>您好：${username }</span>
                <span style="font-size: 14px;cursor: pointer;color: #FBFBFB;" onclick="logout()">退出</span>
                <span style="font-size: 14px;cursor: pointer;color: #FBFBFB;" onclick="open_pwd_comm()">修改密码</span>
            </div>
        </div>
    </div>
</div>

<div class="home-container">
    <div class="home-leftcont" id="home-leftmenu">
        <iframe src="<%=path %>/ifreamLeft" vsspace="0" hspace="0"
                allowTransparency="true" id="ifra" name="ifr-left-bar"
                frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                width="100%"></iframe>
    </div>

    <div class="home-rightcont">
        <iframe src="<%=path %>/overview/index" id="ifr" name="ifr-right-cont" frameborder="0" scrolling="auto"
                marginheight="0" marginwidth="0" width="100%"></iframe>
    </div>
    <div class="clear"></div>
</div>


<!--修改密码-->
<div id="bg_comm_update"
     style=" display: none; position: absolute; top: 0%; left: 0%; width: 100%; height: 100%; background-color: #000; z-index:5000; -moz-opacity: 0.5; opacity:.50; filter: alpha(opacity=50);"></div>
<div id="resetDia_comm"
     style="width: 30%; padding: 2rem;z-index: 50001; border: 1px solid rgba(0,0,0,.2);border-radius: 5px;position: absolute;left: 10rem;top: 10rem;background: white;display: none">
    <div>
        <label>旧密码:</label><input type="password" name="pwd_comm_old" class="form-control"
                                  style="margin-left: 2rem;display: inline-block;width: 75%"/>
    </div>
    <div>
        <label>新密码:</label><input type="password" name="pwd_comm_new" class="form-control"
                                  style="margin-left: 2rem;display: inline-block;width: 75%"/>
    </div>
    <div style="margin: 0.3rem auto">
        <label>重复密码:</label><input type="password" name="pwd_comm_new_repeat" class="form-control"
                                   style="display: inline-block;width: 75%;margin-left: 1rem"/>
    </div>
    <div style="margin:1rem 2.3rem 0rem 0rem;text-align: right">
        <input type="button" class="btn btn-default" onclick="close_pwd_comm()" value="取消"/>
        <input type="button" class="btn btn-primary" onclick="sure_reset_comm()" value="确认"/>
    </div>
</div>
<!--修改密码-->
<div class="home-footer">
    <p>&copy; 公司名称 2016</p>
</div>
</body>

</html>
